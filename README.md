# Agent GitHub Skills

A collection of Claude Code skills that provide GitHub functionality, converting the GitHub MCP server operations into easy-to-use skills that leverage the `gh` CLI.

## What are Claude Code Skills?

Claude Code skills are markdown files that extend Claude Code's capabilities. When you invoke a skill, Claude follows the instructions and examples provided in the skill file to perform complex operations.

## Why This Project?

This project converts all GitHub MCP server functionality into Claude Code skills, providing:

- No additional server setup required
- Uses the familiar `gh` CLI tool
- Organized by functional area (repos, issues, PRs, etc.)
- Easy to customize and extend
- Works entirely within Claude Code

## Prerequisites

1. **GitHub CLI (`gh`)** - Install from https://cli.github.com/
2. **Authentication** - Run `gh auth login` to authenticate with GitHub
3. **Claude Code** - Available at https://claude.com/claude-code

## Installation

### Via Plugin System (Recommended)

Install as a Claude Code plugin for automatic updates and integration:

```bash
# Install directly from GitHub (once pushed)
/plugin install https://github.com/Nice-Wolf-Studio/agent-github-skills.git
```

Or add to a marketplace and install:
```bash
# Add your marketplace
/plugin marketplace add yourusername/your-marketplace

# Install the plugin
/plugin install github-skills@your-marketplace
```

### Manual Installation (Alternative)

1. Clone this repository:
```bash
git clone https://github.com/Nice-Wolf-Studio/agent-github-skills.git
```

2. Symlink for easier updates:
```bash
ln -s $(pwd)/agent-github-skills/skills ~/.claude/skills/github
```

3. Verify installation:
```bash
ls ~/.claude/skills/
```

## Available Skills

### Core Operations

| Skill | Description | Key Operations |
|-------|-------------|----------------|
| `repository-management` | Manage repositories | create, fork, branch, file operations |
| `issue-management` | Work with issues | create, list, update, comment |
| `pull-request-management` | PR operations | create, list, merge, update |
| `code-review` | Review PRs | create reviews, approve, request changes |
| `project-management` | Manage GitHub Projects | create, list, add items, manage fields |
| `search-operations` | Search GitHub | search code, issues, users, repos |
| `commit-operations` | View commits | list commits by repo/branch |

### CI/CD & Releases

| Skill | Description | Key Operations |
|-------|-------------|----------------|
| `workflow-management` | GitHub Actions workflows | trigger, monitor, view logs, download artifacts |
| `release-management` | Manage releases | create releases, upload assets, manage tags |

### Organization & Collaboration

| Skill | Description | Key Operations |
|-------|-------------|----------------|
| `label-management` | Manage labels | create, edit, delete, apply labels |
| `gist-management` | Manage gists | create, list, edit, share code snippets |

## Quick Start

### Using a Skill in Claude Code

Invoke a skill using the skill name:

```
Use the repository-management skill to create a new repo called my-project
```

```
Use the issue-management skill to list all open issues in myorg/myrepo
```

```
Use the pull-request-management skill to merge PR #123 in myorg/myrepo
```

### Example Workflows

**Create a repository and push code:**
```
Use repository-management to:
1. Create a new public repo called awesome-project
2. Create a README.md file with project description
```

**Work with issues:**
```
Use issue-management to:
1. List all open bugs in myorg/myrepo
2. Create a new issue for the critical bug I found
3. Add a comment to issue #45 with my investigation results
```

**Pull request workflow:**
```
Use pull-request-management to:
1. Create a PR from feature-branch to main
2. Check the PR status
3. Merge it once tests pass
```

**CI/CD workflow:**
```
Use workflow-management to:
1. Trigger the deployment workflow
2. Monitor the workflow run
3. Download build artifacts when complete
```

**Release workflow:**
```
Use release-management to:
1. Create a new release v1.2.0
2. Upload build artifacts
3. Generate release notes from commits
```

## Skill Reference

### repository-management

Operations:
- Create new repositories
- Fork existing repositories
- Create branches
- Search for repositories
- Read file contents
- Create/update files
- Push multiple files

### issue-management

Operations:
- Create issues
- List issues with filters
- Get issue details
- Update issues
- Add comments
- Search issues across repos

### pull-request-management

Operations:
- Create pull requests
- List PRs with filters
- Get PR details and files
- Check PR status
- View comments and reviews
- Update PR branch
- Merge pull requests

### code-review

Operations:
- Create PR reviews
- Approve changes
- Request changes
- Add review comments

### project-management

Operations:
- Create and manage projects
- Add issues and PRs to projects
- Create draft issues
- List and view project items
- Manage custom fields
- Link projects to repositories
- Archive and organize items

### search-operations

Operations:
- Search code across GitHub
- Search issues and PRs
- Search users
- Search repositories

### commit-operations

Operations:
- List commits by repository
- List commits by branch
- View commit details

### workflow-management

Operations:
- List and view workflow runs
- Trigger workflows manually
- Cancel and rerun workflows
- View workflow logs
- Download build artifacts
- Monitor CI/CD pipelines

### release-management

Operations:
- Create and publish releases
- Upload release assets
- Manage release tags
- Edit release notes
- Download release assets
- View release statistics

### label-management

Operations:
- Create and edit labels
- Delete labels
- Apply labels to issues/PRs
- Clone labels between repos
- Organize with color coding

### gist-management

Operations:
- Create and edit gists
- List and view gists
- Clone gists as repos
- Star and fork gists
- Share code snippets

## Authentication

These skills use `gh` CLI which requires authentication. If you encounter authentication errors:

```bash
# Login to GitHub
gh auth login

# Check current authentication status
gh auth status

# Switch accounts if needed
gh auth switch
```

## Troubleshooting

### "gh: command not found"

Install the GitHub CLI:
- macOS: `brew install gh`
- Linux: See https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- Windows: See https://github.com/cli/cli#windows

### "Authentication required"

Run `gh auth login` and follow the prompts.

### "Repository not found"

Ensure you have access to the repository and are using the correct owner/repo format (e.g., `owner/repo-name`).

## Contributing

Contributions are welcome! To add new functionality:

1. Fork this repository
2. Create a new branch for your feature
3. Add or modify skill files in the `skills/` directory
4. Update this README with new skill documentation
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Related Projects

- [Model Context Protocol](https://github.com/modelcontextprotocol/servers) - The official MCP servers
- [GitHub CLI](https://cli.github.com/) - The underlying tool used by these skills
- [Claude Code](https://docs.claude.com/en/docs/claude-code) - Official documentation

## Support

For issues or questions:
- Open an issue in this repository
- Check the GitHub CLI documentation: https://cli.github.com/manual/
- Review Claude Code skills documentation: https://docs.claude.com/en/docs/claude-code/skills
