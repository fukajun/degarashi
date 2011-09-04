function Run(){
  # User
  user_file=$CONF_DIR/users
  
  # File
  pass_file=$TEMP_DIR/passfile

  # Add user
  ReadList $user_file | while read name passwd home uid gid other
  do
    grep -q "^$name:" /etc/passwd
    if [ $? -eq 1 ];then

      # Add user
      useradd -d $home -u $uid -g $gid $name
      if [ $? -eq 0 ]; then
        echo "Success add user name:$name uid:$uid"

      else
        echo "Failed  add user name:$name uid:$uid"
        return 1

      fi

      # Set pasword
      echo "$name:$passwd" > $pass_file
      chpasswd < $pass_file
      if [ $? -eq 0 ]; then
        echo "Success set passwd name:$name"
      else
        echo "Failed  set passwd name:$name"
        return 1
      fi

    else
      echo "Exist user $name"

    fi

  done
  return 0
}
