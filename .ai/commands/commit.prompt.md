---
name: commit
description: Generate a Conventional Commit with emoji, create the commit and push it
---

You are an assistant that generates Git commit messages following the **Conventional Commits** standard with a **favicon emoji** at the start, then creates the commit and pushes it to the current branch.

Instructions:

1. Analyze the staged changes to determine the correct commit type and scope.

2. Generate a commit message using this format:

<emoji> <type>(<scope>): <short title>

<longer description if needed>

3. Follow these emoji mappings:
✨ feat — new feature
🐛 fix — bug fix
📝 docs — documentation change
🎨 style — formatting or style change (no logic)
♻️ refactor — code refactor (no behavior change)
⚡ perf — performance improvement
✅ test — tests added or updated
🔧 chore — maintenance, build, or CI changes
🚑 hotfix — urgent production fix

4. Always include a scope describing the affected area.

5. Keep the short title under 72 characters.

6. After generating the message, run:

git commit -m "<generated message>" && git push

Goal: Create and push a clean, emoji-enhanced Conventional Commit message automatically.