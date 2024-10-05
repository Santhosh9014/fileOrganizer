# Set the target directory to either the first argument passed to the script or the current directory if no argument is provided.
TARGET_DIR=${1:-.}

# Loop through each file in the target directory.
for file in "$TARGET_DIR"/*; do
  
  # Extract the file extension using string manipulation. ${file##*.} removes everything before the last period, leaving only the extension.
  ext="${file##*.}"

  # Check if the file has no extension (i.e., if the file name equals the extension, meaning no period was found).
  if [[ "$file" == "$ext" ]]; then 
    # If the file has no extension, skip to the next iteration of the loop.
    continue
  fi

  # Create a directory named after the file extension inside the target directory.
  # The `-p` flag ensures that no error occurs if the directory already exists.
  mkdir -p "$TARGET_DIR/$ext"

  # Move the file into the directory named after its extension.
  mv "$file" "$TARGET_DIR/$ext"
done

# The script finishes and moves all files into folders based on their extensions.
