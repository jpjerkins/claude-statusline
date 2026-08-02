# claude-statusline

A custom status line for the [Claude Code](https://claude.com/claude-code) CLI.

Based on [danielmackay/claude-code-statusline](https://github.com/danielmackay/claude-code-statusline)
(via [this writeup](https://www.dandoescode.com/blog/claude-code-custom-statusline)), with the
following changes:

- An icon on every field (including rate-limit and git staged/modified counts, which had none)
- The "Claude" prefix stripped from the model name (e.g. "Claude Sonnet 4.6" -> "Sonnet 4.6")
- Single line output
- Context window and 5-hour session rate limit are shown as `[bar] used%` (not remaining%), colored
  green/yellow/red as usage climbs
- No cost field
- No "resets" wording in the rate-limit segment (just the reset time)

## Example

```
🤖 Opus 4.8 | 🧠 ██░░░░░░░░ 22% | ⏳ 5h █████░░░░░ 58% 11:47PM | 📁 dcm | 🌳 no worktree | 🌿 main
```

## Requirements

- `sh` (POSIX shell)
- `jq`
- `git` (optional — only used when inside a repo)

## Install

```sh
git clone https://github.com/jpjerkins/claude-statusline.git
cd claude-statusline
./install.sh
```

This copies `statusline-command.sh` to `~/.claude/statusline-command.sh` and merges a `statusLine`
entry into `~/.claude/settings.json` (any other keys already in that file are left untouched).

## Updating

Pull the latest changes and re-run `./install.sh`.
