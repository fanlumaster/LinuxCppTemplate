#!/bin/bash
currentDirectory=$(pwd)
cmakeListsPath="${currentDirectory}/CMakeLists.txt"

if [ ! -f "$cmakeListsPath" ]; then
  echo "No CMakeLists.txt in current directory, please check."
  exit 1
fi

echo "Start generating and compiling..."

buildFolderPath="./build"

if [ ! -d "$buildFolderPath" ]; then
  mkdir -p "$buildFolderPath"
  echo "build folder created."
fi

cmake -G "Unix Makefiles" -D CMAKE_CXX_COMPILER=/usr/bin/g++ -S . -B ./build/

if [ $? -eq 0 ]; then
  cmake --build ./build/ --config DEBUG
  if [ $? -eq 0 ]; then
    content=$(<"./CMakeLists.txt")
    exePath=""
    while IFS= read -r line; do
      if [[ $line == "add_executable"* ]]; then
        pattern="\((.*?)\)"
        if [[ $line =~ $pattern ]]; then
          contentInParentheses="${BASH_REMATCH[1]}"
          result=($contentInParentheses)
          exePath="./build/bin/${result[0]}"
          echo "start running as follows..."
          echo "=================================================="
        fi
      fi
    done <<<"$content"
    # execute the binary file
    if [ -n "$exePath" ]; then
      $exePath
    else
      echo "cannot find executable file path"
    fi
  fi
fi
