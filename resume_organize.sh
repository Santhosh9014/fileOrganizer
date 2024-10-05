# Specify the directory to search for resumes

TARGET_DIR=${1:-.}


# Create a directory called 'resume' if it doesn't exist
#We can modify this for any 'keyword' based on our purpose

RESUME_DIR="$TARGET_DIR/resume"
mkdir -p "$RESUME_DIR"


# Loop through files in the target directory
for file in "$TARGET_DIR"/*; do
  # Skip the 'resume' directory itself
  # If there's already folder names resume, we dont need to check that

  if [[ "$(basename "$file")" == "resume" ]]; then
    continue
  fi

  # It will check if the filename contains 'resume' (case-insensitive)
  if [[ "$(basename "$file")" =~ [rR][eE][sS][uU][mM][eE] ]]; then
    # Move the file to the 'resume' directory
    mv "$file" "$RESUME_DIR"
  fi
done

#completion acknowledgement
echo "All resumes have been moved to the 'resume' folder."
