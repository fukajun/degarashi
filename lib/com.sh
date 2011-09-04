# read config without comment out line
function ReadList(){
  grep -v -e "^#" -e "^ *$" $1
}
function CheckDoneTask() {
  task_name=$1
  if [ -f $CHECK_FILE ]; then
    grep -q "^$task_name$" $CHECK_FILE
    if [ $? -eq 0 ]; then
      return 1
    else
      return 0
    fi
  fi
}
function RegisterDoneTask() {
  task_name=$1
  echo $task_name >> $CHECK_FILE
}
