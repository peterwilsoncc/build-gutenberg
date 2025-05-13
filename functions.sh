#!/bin/bash

# Get the fork origin of a given branch.
function fork_origin() {
	CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

	# Change the the gutenberg-dev directory.
	cd $CURRENT_DIR/gutenberg-dev;


  local branch=$1
  local branch_commit=$(git rev-parse "$branch")
  local parent_commit=$(git rev-parse "$branch_commit"^)

  if [[ $branch == release/* ]]; then
    local grep_branch="trunk"
  elif [[ $branch == wp/* ]]; then
    local grep_branch="release/"
  else
	echo "Branch name does not start with 'release/' or 'wp/'."
	return 1
  fi


  # If the branch begins with "release/", then it was forked from trunk.
#   if [[ $branch == release/* ]]; then
	# Find the merge base betwween the branch and trunk.
	# local fork_commit=$(git merge-base --fork-point "$branch" trunk)
#   elif [[ $branch == wp/* ]]; then
	# If the branch begins with "wp/", then it was forked from a release branch or trunk.
	# merge-base will not work so we need to loop through the parent commit until finding a
	# commit that is either on a release branch or trunk.
	local fork_commit="";

	# Loop through the parent commits while the fork_commit is empty.
	while [ -z "$fork_commit" ]; do
	  # Get the branch name of the parent commit.
	  local parent_branch=$(git branch --contains "$parent_commit" | grep $grep_branch | grep -v "HEAD")

	  # If the parent branch is not empty, then we have found the fork commmit.
	  if [ ! -z "$parent_branch" ]; then
	  	# echo "Found release branch: $parent_branch"
		fork_commit=$parent_commit
		break
	  fi

	  # Move the the parent's parent commit.
	  parent_commit=$(git rev-parse "$parent_commit"^)
	done;

	# echo "Found the fork commit: $fork_commit"
	# fi

	echo "$fork_commit"
}
