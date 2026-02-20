---
description: Sync files across workspace and branches using .sync.yml (2-step with explicit confirmation)
agent: build
---

GOAL
Synchronize files in the workspace and across multiple branches.

GENERAL RULES (MANDATORY)
- Read and apply ONLY what is defined in @.sync.yml.
- Execution is strictly 2 steps:
    1) Produce a SIMPLE summary of what would be synchronized.
    2) Ask “Do you want to execute the synchronization? (reply exactly: yes / no)”. Do NOT execute anything unless the reply is exactly “yes”.
- Do NOT delete files.
- If @.sync.yml is missing or invalid, stop and report the error.
- Use exactly `commit_message` from the YAML when committing.
- If no changes exist in a branch, do not create a commit.
- Process CURRENT branch first (if included in rule.branches), then the remaining branches in listed order.

CONTEXT
!`git rev-parse --abbrev-ref HEAD`
@.sync.yml

STEP 1 — SIMPLE SUMMARY OUTPUT

- Generate the summary in CONSOLE OUTPUT using shell printing.
- If console output is not available, output the same content as a markdown code block.
- The summary must mirror the structure of `.sync.yml`, minimal and without narrative text.

CONSOLE FORMAT:

commit_message: <value>

rules:
- name: <rule.name>
  source: <source_of_truth.branch>:<source_of_truth.path>
  destinations:
    - <path>
    - <path>
  branches:
    - <branch>
    - <branch>
  changes:
    <branch>: create=<n> update=<n> unchanged=<n>
    <branch>: create=<n> update=<n> unchanged=<n>

Rules:
- Only totals per branch (no file lists)
- Keep output minimal
- Preserve YAML order

After printing summary, ask exactly:

Do you want to execute the synchronization? (reply exactly: yes / no)

STOP.

STEP 2 — EXECUTION (ONLY IF “yes”)

1) Re-read @.sync.yml
2) For each rule:
    - Process current branch first if included
    - Then process remaining branches in listed order
3) For each branch:
    - Checkout branch
    - Copy from source_of_truth.branch + source_of_truth.path
    - Apply to each destinations[].path preserving structure
    - Do not modify anything else
4) If changes exist:
    - Stage only destination paths
    - Commit using commit_message
5) If no changes: skip commit

FINAL RESULT OUTPUT (console or markdown fallback)

result:
  <branch>: changed=yes|no rules=[rule1, rule2]