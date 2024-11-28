content=$(<"./CMakeLists.txt")
exePath=""
while IFS= read -r line; do
  if [[ $line == "set(MY_EXECUTABLE_NAME"* ]]; then
    pattern="\"([^\"]+)\""
    if [[ $line =~ $pattern ]]; then
      contentInParentheses="${BASH_REMATCH[1]}"
      result=($contentInParentheses)
      exePath="./build/bin/${result[0]}"
    fi
  fi
done <<<"$content"

if [ -n "$exePath" ]; then
  $exePath
else
  echo "cannot find executable file path"
fi
