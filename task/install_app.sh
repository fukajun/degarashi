function Run(){
  # Apps
  app_file=$CONF_DIR/apps

  # Add group
  ReadList $app_file | while read name long_name other
  do
    yum list installed | grep $name
    if [ $? -eq 1 ];then
      echo $name
      yum -y install $name
      if [ $? -eq 0 ]; then
        echo "Success install app name:$name"

      else
        echo "Failed  install app name:$name"
        return 1

      fi
    else
      echo "Already installed app name:$name"

    fi

  done
  return 0
}
