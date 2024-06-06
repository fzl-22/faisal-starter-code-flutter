#!/bin/bash

################################################################
################################################################

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

INITIAL_PROJECT_NAME=faisal_starter_code_flutter
INITIAL_DOMAIN_NAME=com.example
REPOSITORY_NAME=faisal-starter-code-flutter
OS=$(uname -s)

# Prompt user function
function prompt_user {
  read -p "$(echo -ne "${GREEN}$1: ${NC}")" "$2"
}

# Check if gnu-sed is installed on macOS
check_gsed_installed() {
  if ! command -v gsed &>/dev/null; then
    echo -e "${RED}GNU sed (gsed) is required but not installed. Please install it using Homebrew or another package manager.${NC}"
    exit 1
  fi
}

# Check if Flutter is installed
check_flutter_installed() {
  if ! command -v flutter &>/dev/null; then
    echo -e "${RED}Flutter is not installed. Please install Flutter before proceeding.${NC}"
    exit 1
  fi
}

# validate project name
validate_project_name() {
  local project_regex="^[a-z_][a-z0-9_]*$"

  if [ -z "$1" ]; then
    echo -e "${RED}Project name cannot be empty.\n\nExiting.${NC}"
    exit 1
  fi

  if ! [[ "$1" =~ $project_regex ]]; then
    echo -e "${RED}\"${1}\" is not a valid Dart package name.\n\nThe name should be all lowercase, with underscores to separate words, \"just_like_this\". Use only basic Latin letters and Arabic digits: [a-z0-9_]. Also, make sure the name is a valid Dart identifier—that it doesn't start with digits and isn't a reserved word.\n\nSee https://dart.dev/tools/pub/pubspec#name for more information.\n\nExiting. ${NC}"
    exit 1
  fi
}

# Check if project directory already exists
check_project_existence() {
  if [ -d "$1" ]; then
    read -p "$(echo -ne "${RED}Project directory already exists. Do you want to overwrite it? (y/N): ${NC}")" OVERWRITE
    OVERWRITE=${OVERWRITE:-n} # Default to "n" if the input is empty
    if [ "$OVERWRITE" != "y" ]; then
      echo -e "${RED}Exiting.${NC}"
      exit 1
    fi
    rm -rf "$1"
  fi
}

# Validate domain name
validate_domain_name() {
  local domain_regex="^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$"
  if ! [[ "$1" =~ $domain_regex ]]; then
    echo -e "${RED}\"${1}\" is not a valid domain name.\n\nDomain name should follow the reverse domain pattern (e.g., com.example) and adhere to the specified rules.\n\nExiting.${NC}"
    exit 1
  fi
}

################################################################
################################################################

# Check if FLutter is available
check_flutter_installed

# Check if gsed is available on macOS
if [ $OS == "Darwin" ]; then
  check_gsed_installed
fi

# Prompt user for project name
prompt_user "Enter project name" PROJECT_NAME

# Check if PROJECT_NAME satisfies Flutter project naming convention
validate_project_name "$PROJECT_NAME"

# Check if project directory already exists
check_project_existence "$PROJECT_NAME"

# Prompt user for domain name
prompt_user "Enter domain name (${INITIAL_DOMAIN_NAME})" DOMAIN_NAME

# Set DOMAIN_NAME to INITIAL_DOMAIN_NAME if empty
DOMAIN_NAME=${DOMAIN_NAME:-$INITIAL_DOMAIN_NAME}

# Validate the entered domain name
validate_domain_name "$DOMAIN_NAME"

echo ""

# Cloning repository
echo -e "${GREEN}Cloning repository...${NC}"
if ! git clone "https://github.com/fzl-22/${REPOSITORY_NAME}.git" --depth 1; then
  echo -e "${RED}Failed to clone repository. Exiting.${NC}"
  exit 1
fi

echo ""

# Setup project
echo -e "${GREEN}Setting up \"$PROJECT_NAME\" project...${NC}"
mv $REPOSITORY_NAME $PROJECT_NAME
cd "$PROJECT_NAME" || exit 1

files_with_initial_project_name=$(grep -rl "$INITIAL_PROJECT_NAME" .)
files_with_initial_domain_name=$(grep -rl "$INITIAL_DOMAIN_NAME" .)

if [ -n "$files_with_initial_project_name" ] && [ -n "$files_with_initial_domain_name" ]; then
  if [ $OS == 'Linux' ]; then
    echo "$files_with_initial_project_name" | xargs sed -i "s/$INITIAL_PROJECT_NAME/$PROJECT_NAME/g"
    echo "$files_with_initial_domain_name" | xargs sed -i "s/$INITIAL_DOMAIN_NAME/$DOMAIN_NAME/g"
  elif [ $OS == 'Darwin' ]; then
    echo "$files_with_initial_project_name" | xargs gsed -i "s/$INITIAL_PROJECT_NAME/$PROJECT_NAME/g"
    echo "$files_with_initial_domain_name" | xargs gsed -i "s/$INITIAL_DOMAIN_NAME/$DOMAIN_NAME/g"
  fi

  # Get all project dependencies
  flutter pub get

  # Create .env file
  echo BASE_URL=https://reqres.in >.env

  # Run code generator
  dart run build_runner build

  # Fix analysis issues (if any)
  dart fix --apply

else
  echo -e "${RED}No files found containing \"$INITIAL_PROJECT_NAME\" or \"$INITIAL_DOMAIN_NAME\". Exiting.${NC}"
  exit 1
fi

echo ""

echo -e "${GREEN}✓ Project \"$PROJECT_NAME\" has been created successfully...${NC}"

# Clean up
rm -rf .git/ $0 ../$0
