#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Change the the gutenberg-dev directory.
cd $CURRENT_DIR/gutenberg-dev;

RECENT_TAGS="$(gh release list --exclude-drafts --limit 10 --json tagName --jq '.[].tagName')"

# echo "Last 10 tags: $RECENT_TAGS"


## Loop through the last 10 tags and remove the v from the tag name

LAST_MAJOR_VERSIONS="";

for tag in $RECENT_TAGS; do
  # Remove the v from the tag name
  tag="${tag#v}"

  # Remove any thing after the first hyphen
  tag="${tag%%-*}"

  # Drop the final `.#` from the tag name for the branch name
  branch="${tag%.*}"

  # Append the major version to the list
  LAST_MAJOR_VERSIONS="$LAST_MAJOR_VERSIONS $branch"



#   # Add the `release/` prefix to the branch name
#   branch="release/$branch"

#   # Generate a file name by replacing the slash with a double dash.
#   branch_file_name=$(echo $branch | sed 's/\//-/g');



#   echo "Tag: $tag"
#   echo "Branch: $branch"
#   echo "Branch file name: $branch_file_name"
done

# echo "Last major versions: $LAST_MAJOR_VERSIONS"

MAJOR_VERSIONS="";

# Loop through the major versions and remove the duplicates
for version in $LAST_MAJOR_VERSIONS; do
  # Remove the duplicates
  if [[ ! " ${MAJOR_VERSIONS[@]} " =~ " ${version} " ]]; then
	MAJOR_VERSIONS+=("$version")
  fi
done

# Print the major versions
echo "Major versions: ${MAJOR_VERSIONS[@]}"

# Loop the the major versions and echo the branch and file name
for version in "${MAJOR_VERSIONS[@]}"; do
	# continue if the version is empty
	if [[ -z "$version" ]]; then
		continue
	fi


  # Add the `release/` prefix to the branch name
  branch="release/$version"

  # Generate a file name by replacing the slash with a double dash.
  branch_file_name=$(echo $branch | sed 's/\//-/g');

  echo "Branch: $branch"
  echo "Branch file name: $branch_file_name"

  # Call the build script with the branch name.
  $CURRENT_DIR/build-branch-from-workflows.sh $branch
done



