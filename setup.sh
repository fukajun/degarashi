#  Current dir
cd `dirname $0`
WORK_DIR=`pwd`

#  Define directries
TASK_DIR=$WORK_DIR/task
CONF_DIR=$WORK_DIR/conf
TEMP_DIR=$WORK_DIR/tmp
LIB_DIR=$WORK_DIR/lib

#  Define files
CONFIG_PATH=$CONF_DIR/task.conf
INIT_SCRIPT=$LIB_DIR/init_task.sh
CHECK_FILE=$TEMP_DIR/lock_file

#  Import functions
source $LIB_DIR/com.sh

#  Do Setup
#source init.sh

ReadList $CONFIG_PATH | while read line
do
  name=`echo $line | awk 'BEGIN{FS=":"}{print $1}'`
  file_path=${TASK_DIR}/${name}.sh

  # Load init
  source $INIT_SCRIPT

  # Load task
  source $file_path

  # Check task
  CheckDoneTask $name
  if [ $? -eq 1 ];then
    echo "SKIP task $name"
    continue
  fi

  # Run task
  echo "EXEC task $name"
  Run 2>&1 | sed 's/^/  /'

  # Record done task
  if [ $? -eq 0 ];then
    RegisterDoneTask $name
  else
    echo "FAILED $name"
    exit 1
  fi

done
