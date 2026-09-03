# Validate that a theme pull request stays in scope: the PR title is tagged
# "theme:" and every changed file lives under themes/. Run in CI on pull
# requests that touch themes/**, so a theme PR can't quietly drag in
# changes to tools/, data/, or anywhere else in the repo.
#
# Usage: python tools/validate-pr.py <changed-files-list-path>
# Reads the PR title from the PR_TITLE environment variable.

import os
import re
import sys

TITLE_RE = re.compile(r"^\s*themes?:\s*\S", re.IGNORECASE)


def check_title(title):
    if title is None:
        return "PR_TITLE was not set."
    if not TITLE_RE.match(title):
        return (
            f"PR title '{title}' doesn't start with 'theme:'.\n"
            "  Expected something like: 'theme: Add Solarized Midnight'"
        )
    return None


def check_scope(changed_files):
    out_of_scope = [f for f in changed_files if not f.startswith("themes/")]
    if out_of_scope:
        listing = "\n".join(f"  {f}" for f in out_of_scope)
        return (
            f"{len(out_of_scope)} changed file(s) outside themes/:\n{listing}\n"
            "  A theme PR should only add/edit files under themes/."
        )
    return None


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python tools/validate-pr.py <changed-files-list-path>")
        sys.exit(2)

    with open(sys.argv[1]) as f:
        changed_files = [line.strip() for line in f if line.strip()]

    errors = []

    title_error = check_title(os.environ.get("PR_TITLE"))
    if title_error:
        errors.append(title_error)

    scope_error = check_scope(changed_files)
    if scope_error:
        errors.append(scope_error)

    if errors:
        print("❌ PR scope validation failed:\n")
        for error in errors:
            print(error, "\n")
        sys.exit(1)

    print("✅ PR title and scope look good.")
