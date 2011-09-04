function Run(){
  # Group
  group_file=$CONF_DIR/groups

  # Add group
  ReadList $group_file | while read name gid other
  do
    grep -q "^$name:" /etc/group
    if [ $? -eq 1 ];then
      groupadd -g $gid $name
      if [ $? -eq 0 ]; then
        echo "Success add group name:$name gid:$gid"

      else
        echo "Failed  add group name:$name gid:$gid"
        return 1

      fi
    else
      echo "Exist group $name"

    fi

  done
  return 0
}
