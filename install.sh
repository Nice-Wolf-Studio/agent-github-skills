#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_DIR="$HOME/.claude/skills"

echo "======================================"
echo "Agent GitHub Skills Installer"
echo "======================================"
echo ""

# Check for gh CLI
echo "Checking prerequisites..."
if ! command -v gh &> /dev/null; then
    echo -e "${RED}✗ GitHub CLI (gh) is not installed${NC}"
    echo ""
    echo "Please install it first:"
    echo "  macOS:   brew install gh"
    echo "  Linux:   https://github.com/cli/cli/blob/trunk/docs/install_linux.md"
    echo "  Windows: https://github.com/cli/cli#windows"
    exit 1
fi
echo -e "${GREEN}✓ GitHub CLI found${NC}"

# Check gh authentication
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}⚠ GitHub CLI is not authenticated${NC}"
    echo ""
    read -p "Would you like to authenticate now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        gh auth login
    else
        echo -e "${YELLOW}⚠ You can authenticate later with: gh auth login${NC}"
    fi
else
    echo -e "${GREEN}✓ GitHub CLI authenticated${NC}"
fi

echo ""
echo "Installation options:"
echo "1) Symlink skills (recommended - easy updates)"
echo "2) Copy skills (standalone installation)"
echo ""
read -p "Choose option (1 or 2): " -n 1 -r INSTALL_TYPE
echo ""

# Create skills directory if it doesn't exist
if [ ! -d "$SKILLS_DIR" ]; then
    echo "Creating $SKILLS_DIR..."
    mkdir -p "$SKILLS_DIR"
fi

# Remove existing github skills directory/symlink if present
if [ -e "$SKILLS_DIR/github" ]; then
    echo -e "${YELLOW}Removing existing github skills...${NC}"
    rm -rf "$SKILLS_DIR/github"
fi

case $INSTALL_TYPE in
    1)
        echo "Creating symlink to $SKILLS_DIR/github..."
        ln -s "$SCRIPT_DIR/skills" "$SKILLS_DIR/github"
        echo -e "${GREEN}✓ Skills symlinked successfully${NC}"
        echo ""
        echo "Skills are now linked. Any updates to this repository will automatically"
        echo "be available in Claude Code."
        ;;
    2)
        echo "Copying skills to $SKILLS_DIR/github..."
        mkdir -p "$SKILLS_DIR/github"
        cp -r "$SCRIPT_DIR/skills/"* "$SKILLS_DIR/github/"
        echo -e "${GREEN}✓ Skills copied successfully${NC}"
        echo ""
        echo "Skills installed. To update, run this script again or manually copy files."
        ;;
    *)
        echo -e "${RED}Invalid option. Exiting.${NC}"
        exit 1
        ;;
esac

echo ""
echo "======================================"
echo -e "${GREEN}Installation Complete!${NC}"
echo "======================================"
echo ""
echo "Installed skills:"
ls -1 "$SKILLS_DIR/github" | sed 's/^/  - /'
echo ""
echo "Usage in Claude Code:"
echo '  "Use the repository-management skill to create a new repo"'
echo '  "Use the issue-management skill to list open issues"'
echo '  "Use the pull-request-management skill to create a PR"'
echo ""
echo "For help, visit: https://github.com/Nice-Wolf-Studio/agent-github-skills"
