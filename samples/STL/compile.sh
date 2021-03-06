## Helper script for build_all.sh

FILE=$1

macro="$macro -DELPP_DEBUG_ERRORS"
macro="$macro -DELPP_THREAD_SAFE"
macro="$macro -DELPP_STL_LOGGING"
macro="$macro -DELPP_LOG_UNORDERED_SET"
macro="$macro -DELPP_LOG_UNORDERED_MAP"
macro="$macro -DELPP_STACKTRACE_ON_CRASH"
macro="$macro -DELPP_LOGGING_FLAGS_FROM_ARG"
macro="$macro -DELPP_FEATURE_ALL"
# macro="$macro -DELPP_DEFAULT_LOG_FILE=\"/a/path/that/does/not/exist/f.log\""

if [ "$2" = "" ];then
  COMPILER=g++
else
  COMPILER=$2
fi

CXX_STD='-std=c++0x -pthread'

if [ "$FILE" = "" ]; then
  echo "Please provide filename to compile"
  exit
fi

echo "Compiling... [$FILE]"

COMPILE_LINE="$COMPILER $FILE -o bin/$FILE.bin $macro $CXX_STD -Wall -Wextra -pedantic -pedantic-errors -Werror -Wfatal-errors -Wundef -Wunused"

echo "    $COMPILE_LINE"

$($COMPILE_LINE)

echo "    DONE! [./bin/$FILE.bin]"
echo
echo
