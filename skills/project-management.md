# GitHub Project Management Skill

This skill provides comprehensive GitHub Projects (v2) management operations including creating projects, managing items, fields, and organizing work.

## Available Operations

### 1. Create Project
Create a new GitHub Project for an organization or user.

### 2. List Projects
List all projects for an owner with optional filters.

### 3. View Project
View details of a specific project.

### 4. Edit Project
Update project properties like title, description, or visibility.

### 5. Close Project
Close a project when it's completed.

### 6. Delete Project
Delete a project permanently.

### 7. Add Item to Project
Add issues or pull requests to a project.

### 8. Create Draft Issue
Create a draft issue item directly in a project.

### 9. List Project Items
List all items in a project.

### 10. Edit Project Item
Update properties of items in a project.

### 11. Archive/Delete Item
Archive or delete items from a project.

### 12. Manage Fields
Create, list, and delete custom fields in a project.

### 13. Link/Unlink Project
Link a project to repositories or teams.

## Usage Examples

### Create a New Project

**Create project for current user:**
```bash
gh project create --owner "@me" --title "Q1 2025 Roadmap"
```

**Create project for organization:**
```bash
gh project create --owner myorg --title "Product Backlog"
```

**Create and get project number:**
```bash
gh project create --owner myorg --title "Sprint Planning" --format json --jq '.number'
```

### List Projects

**List your own projects:**
```bash
gh project list --owner "@me"
```

**List organization projects:**
```bash
gh project list --owner myorg
```

**List all projects including closed:**
```bash
gh project list --owner myorg --closed
```

**List with custom limit:**
```bash
gh project list --owner myorg --limit 50
```

**Open projects in browser:**
```bash
gh project list --owner myorg --web
```

**JSON output for processing:**
```bash
gh project list --owner myorg --format json --jq '.projects[] | {number, title, url}'
```

### View Project Details

**View project in terminal:**
```bash
gh project view 1 --owner myorg
```

**View in browser:**
```bash
gh project view 1 --owner myorg --web
```

**JSON output:**
```bash
gh project view 1 --owner myorg --format json
```

**Get specific project info:**
```bash
gh project view 1 --owner myorg --format json --jq '.title'
```

### Edit Project

**Update project title:**
```bash
gh project edit 1 --owner myorg --title "Updated Project Name"
```

**Update description:**
```bash
gh project edit 1 --owner myorg --description "New project description"
```

**Update readme:**
```bash
gh project edit 1 --owner myorg --readme "Project readme content"
```

**Make project public:**
```bash
gh project edit 1 --owner myorg --visibility PUBLIC
```

**Make project private:**
```bash
gh project edit 1 --owner myorg --visibility PRIVATE
```

### Close Project

**Close a completed project:**
```bash
gh project close 1 --owner myorg
```

**Close and get confirmation:**
```bash
gh project close 1 --owner myorg --format json
```

### Delete Project

**Delete project permanently:**
```bash
gh project delete 1 --owner myorg
```

**Note:** This operation is permanent and cannot be undone.

### Add Items to Project

**Add issue to project:**
```bash
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/issues/123
```

**Add pull request to project:**
```bash
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/pull/456
```

**Add multiple items:**
```bash
# Add issue
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/issues/100

# Add another issue
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/issues/101

# Add a PR
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/pull/50
```

**Get item ID after adding:**
```bash
gh project item-add 1 --owner myorg --url https://github.com/myorg/myrepo/issues/123 --format json --jq '.id'
```

### Create Draft Issue in Project

**Create draft issue:**
```bash
gh project item-create 1 --owner myorg --title "Research database options" --body "Evaluate PostgreSQL vs MongoDB"
```

**Create with minimal info:**
```bash
gh project item-create 1 --owner myorg --title "Quick task"
```

**Create and get item ID:**
```bash
gh project item-create 1 --owner myorg --title "New feature" --format json --jq '.id'
```

### List Project Items

**List all items in project:**
```bash
gh project item-list 1 --owner myorg
```

**List with custom limit:**
```bash
gh project item-list 1 --owner myorg --limit 100
```

**JSON output:**
```bash
gh project item-list 1 --owner myorg --format json
```

**Get item titles and IDs:**
```bash
gh project item-list 1 --owner myorg --format json --jq '.items[] | {id, title, type}'
```

**Filter by content type:**
```bash
gh project item-list 1 --owner myorg --format json --jq '.items[] | select(.content.type == "Issue")'
```

### Edit Project Items

**Update item field:**
```bash
gh project item-edit --project-id <PROJECT_ID> --id <ITEM_ID> --field-id <FIELD_ID> --text "In Progress"
```

**Update iteration field:**
```bash
gh project item-edit --project-id <PROJECT_ID> --id <ITEM_ID> --field-id <FIELD_ID> --iteration-id <ITERATION_ID>
```

**Update date field:**
```bash
gh project item-edit --project-id <PROJECT_ID> --id <ITEM_ID> --field-id <FIELD_ID> --date 2025-12-31
```

**Clear field value:**
```bash
gh project item-edit --project-id <PROJECT_ID> --id <ITEM_ID> --field-id <FIELD_ID> --clear
```

### Archive Items

**Archive completed item:**
```bash
gh project item-archive --owner myorg --id <ITEM_ID>
```

**Archive with confirmation:**
```bash
gh project item-archive --owner myorg --id <ITEM_ID> --format json
```

### Delete Items

**Delete item from project:**
```bash
gh project item-delete --owner myorg --id <ITEM_ID>
```

**Note:** This removes the item from the project but doesn't delete the underlying issue/PR.

### Manage Project Fields

**List all fields in project:**
```bash
gh project field-list 1 --owner myorg
```

**List fields with JSON output:**
```bash
gh project field-list 1 --owner myorg --format json
```

**Get field IDs and names:**
```bash
gh project field-list 1 --owner myorg --format json --jq '.fields[] | {id, name, dataType}'
```

**Create a single select field:**
```bash
gh project field-create 1 --owner myorg --name "Priority" --data-type "SINGLE_SELECT"
```

**Create a text field:**
```bash
gh project field-create 1 --owner myorg --name "Notes" --data-type "TEXT"
```

**Create a date field:**
```bash
gh project field-create 1 --owner myorg --name "Due Date" --data-type "DATE"
```

**Create a number field:**
```bash
gh project field-create 1 --owner myorg --name "Story Points" --data-type "NUMBER"
```

**Delete a field:**
```bash
gh project field-delete 1 --owner myorg --id <FIELD_ID>
```

### Link Project to Repository

**Link project to repository:**
```bash
gh project link 1 --owner myorg --repo myorg/myrepo
```

**Link to multiple repositories:**
```bash
gh project link 1 --owner myorg --repo myorg/repo1
gh project link 1 --owner myorg --repo myorg/repo2
```

### Unlink Project from Repository

**Unlink project:**
```bash
gh project unlink 1 --owner myorg --repo myorg/myrepo
```

### Link Project to Team

**Link project to team:**
```bash
gh project link 1 --owner myorg --team myorg/team-name
```

**Unlink from team:**
```bash
gh project unlink 1 --owner myorg --team myorg/team-name
```

### Copy Project

**Copy project structure:**
```bash
gh project copy <SOURCE_PROJECT_NUMBER> --source-owner sourceorg --owner targetorg --title "Copied Project"
```

**Copy with draft issues:**
```bash
gh project copy 1 --source-owner myorg --owner myorg --title "Q2 Planning" --drafts
```

### Mark Project as Template

**Mark project as template:**
```bash
gh project mark-template 1 --owner myorg
```

## Common Patterns

### Sprint Planning Workflow

```bash
# 1. Create sprint project
SPRINT_NUM=$(gh project create --owner myorg --title "Sprint 15" --format json --jq '.number')

# 2. Link to repository
gh project link $SPRINT_NUM --owner myorg --repo myorg/main-repo

# 3. Add issues to sprint
gh project item-add $SPRINT_NUM --owner myorg --url https://github.com/myorg/main-repo/issues/101
gh project item-add $SPRINT_NUM --owner myorg --url https://github.com/myorg/main-repo/issues/102
gh project item-add $SPRINT_NUM --owner myorg --url https://github.com/myorg/main-repo/issues/103

# 4. Create custom fields
gh project field-create $SPRINT_NUM --owner myorg --name "Status" --data-type "SINGLE_SELECT"
gh project field-create $SPRINT_NUM --owner myorg --name "Story Points" --data-type "NUMBER"

# 5. View project
gh project view $SPRINT_NUM --owner myorg --web
```

### Product Roadmap Management

```bash
# Create roadmap project
gh project create --owner myorg --title "2025 Product Roadmap"

# Add high-level features as draft issues
gh project item-create 1 --owner myorg --title "Q1: Mobile App Launch" --body "Launch iOS and Android apps"
gh project item-create 1 --owner myorg --title "Q2: API v2 Release" --body "New REST API with GraphQL support"
gh project item-create 1 --owner myorg --title "Q3: Enterprise Features" --body "SSO, audit logs, advanced permissions"
gh project item-create 1 --owner myorg --title "Q4: Analytics Dashboard" --body "Real-time analytics and reporting"

# View in browser to organize
gh project view 1 --owner myorg --web
```

### Bug Triage Board

```bash
# Create bug triage project
gh project create --owner myorg --title "Bug Triage"

# Link to repositories
gh project link 1 --owner myorg --repo myorg/backend
gh project link 1 --owner myorg --repo myorg/frontend
gh project link 1 --owner myorg --repo myorg/mobile

# Create triage fields
gh project field-create 1 --owner myorg --name "Severity" --data-type "SINGLE_SELECT"
gh project field-create 1 --owner myorg --name "Affected Version" --data-type "TEXT"

# Add recent bugs
for issue in 201 202 203 204 205; do
  gh project item-add 1 --owner myorg --url https://github.com/myorg/backend/issues/$issue
done
```

### Team Workload View

```bash
# List all active projects
gh project list --owner myorg

# View specific team project
gh project view 5 --owner myorg

# List all items with details
gh project item-list 5 --owner myorg --format json --jq '.items[] | {title, assignees: .content.assignees[].login, status: .status.name}'

# Export to CSV for analysis
gh project item-list 5 --owner myorg --format json --jq -r '.items[] | [.title, (.content.assignees[].login // "Unassigned"), .content.state] | @csv'
```

### Project Migration

```bash
# Copy existing project structure
gh project copy 1 --source-owner myorg --owner myorg --title "Sprint 16 (from Sprint 15)"

# List fields from original
gh project field-list 1 --owner myorg --format json > original_fields.json

# Recreate fields in new project if needed
# (Fields are usually copied, but you can customize)

# Link new project to repositories
gh project link 2 --owner myorg --repo myorg/main-repo
```

### Bulk Item Management

```bash
# Get all open issues from a repo
gh issue list --repo myorg/myrepo --state open --limit 100 --json url --jq '.[] | .url' > issues.txt

# Add all to project
while read url; do
  gh project item-add 1 --owner myorg --url "$url"
done < issues.txt

# Or using xargs
gh issue list --repo myorg/myrepo --state open --limit 50 --json url --jq -r '.[] | .url' | \
  xargs -I {} gh project item-add 1 --owner myorg --url {}
```

### Project Templates

```bash
# Create a template project
gh project create --owner myorg --title "Team Sprint Template"

# Set up standard fields
gh project field-create 1 --owner myorg --name "Status" --data-type "SINGLE_SELECT"
gh project field-create 1 --owner myorg --name "Priority" --data-type "SINGLE_SELECT"
gh project field-create 1 --owner myorg --name "Story Points" --data-type "NUMBER"
gh project field-create 1 --owner myorg --name "Sprint Goal" --data-type "TEXT"

# Mark as template
gh project mark-template 1 --owner myorg

# Future sprints can copy from this template
gh project copy 1 --source-owner myorg --owner myorg --title "Sprint 20"
```

## Advanced Usage

### Querying Project Data

**Get project statistics:**
```bash
gh project item-list 1 --owner myorg --format json --jq '{
  total: .items | length,
  issues: [.items[] | select(.content.type == "Issue")] | length,
  prs: [.items[] | select(.content.type == "PullRequest")] | length,
  drafts: [.items[] | select(.content.type == "DraftIssue")] | length
}'
```

**Get items by state:**
```bash
gh project item-list 1 --owner myorg --format json --jq '.items[] | select(.content.state == "OPEN") | {title, url: .content.url}'
```

**Get unassigned items:**
```bash
gh project item-list 1 --owner myorg --format json --jq '.items[] | select(.content.assignees | length == 0) | .title'
```

### Automation Scripts

**Daily standup report:**
```bash
#!/bin/bash
PROJECT_NUM=1
OWNER="myorg"

echo "=== Daily Standup Report ==="
echo "Project: $(gh project view $PROJECT_NUM --owner $OWNER --format json --jq '.title')"
echo ""

# Recently updated items
echo "Recently Updated (last 24h):"
gh project item-list $PROJECT_NUM --owner $OWNER --format json --jq '.items[] | select(.content.updatedAt > (now - 86400 | strftime("%Y-%m-%dT%H:%M:%SZ"))) | "- \(.title)"'
```

**Sprint velocity calculation:**
```bash
#!/bin/bash
# Get completed items with story points
gh project item-list 1 --owner myorg --format json --jq '
  .items[] | 
  select(.content.state == "CLOSED") | 
  {title, points: .fieldValues.storyPoints}
' | jq -s 'map(.points) | add'
```

## Field Types Reference

GitHub Projects supports these field types:

- **TEXT**: Free-form text
- **NUMBER**: Numeric values
- **DATE**: Calendar dates
- **SINGLE_SELECT**: Choose one option from a list
- **ITERATION**: Sprint/iteration tracking

## Best Practices

1. **Use descriptive project titles**: Make it clear what the project is for
2. **Link to relevant repositories**: Ensure project is connected to the right repos
3. **Create custom fields early**: Define Status, Priority, etc. before adding items
4. **Use draft issues for planning**: Create high-level items without creating formal issues
5. **Archive completed items**: Keep active items visible by archiving done work
6. **Copy successful templates**: Reuse project structures that work well
7. **Link to teams**: Make projects discoverable by linking to relevant teams
8. **Regular cleanup**: Archive or remove stale items periodically
9. **Use filters and views**: In the web UI, create custom views for different perspectives
10. **Automate workflows**: Use GitHub Actions to automatically add items to projects

## Project Views

Projects support multiple views with different layouts:
- **Board view**: Kanban-style columns
- **Table view**: Spreadsheet-like grid
- **Roadmap view**: Timeline visualization

These are configured in the web UI after creating the project.

## Error Handling

### Project Not Found
```bash
# Verify project exists
gh project list --owner myorg | grep -i "project name"

# Check project number
gh project list --owner myorg --format json --jq '.projects[] | {number, title}'
```

### Permission Denied
```bash
# Check authentication and scopes
gh auth status

# Refresh with project scope
gh auth refresh -s project
```

### Invalid Field Type
```bash
# List valid field types
echo "Valid types: TEXT, NUMBER, DATE, SINGLE_SELECT, ITERATION"

# Check existing fields
gh project field-list 1 --owner myorg
```

### Item Already in Project
```bash
# List current items to check
gh project item-list 1 --owner myorg --format json --jq '.items[].content.url' | grep "issues/123"
```

## Integration with Other Skills

- Use `issue-management` to create issues before adding them to projects
- Use `pull-request-management` to create PRs that can be tracked in projects
- Use `repository-management` to manage repos that are linked to projects
- Use `search-operations` to find items to add to projects

## Migration from Projects Classic

GitHub Projects v2 (used by this skill) is different from Projects Classic:

**Key differences:**
- Projects v2 are organization/user-level, not repository-level
- Custom fields with different types (not just columns)
- Better automation and API support
- Use project number instead of project ID

**Migration approach:**
1. Create new v2 project
2. Set up custom fields matching old columns
3. Manually add items or use bulk operations
4. Set field values to match old column assignments

## References

- [GitHub CLI Project Documentation](https://cli.github.com/manual/gh_project)
- [GitHub Projects Guide](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [Projects v2 API](https://docs.github.com/en/graphql/reference/objects#projectv2)
- [GitHub Projects Best Practices](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects)
