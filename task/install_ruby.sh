# Install Ruby
function Run(){
  # Apps
  ver_file=$CONF_DIR/ruby_ver

  # Check RVM command
  which rvm
  if [ $? -eq 1 ];then
    echo "rvm command not found. Please run install RVM task"
    return 1
  fi

  # Get ruby version
  ruby_ver=`ReadList $ver_file`
  var_count=`echo "$ruby_ver" | wc -l`
  if [ "$var_count" != "1" ]; then
     echo "too many ruby versions were specified in "$ver_file    
     return 1
  fi

  # Start install ruby
  rvm install $ruby_ver
  if [ $? -eq 0 ]; then
    echo "Success install Ruby"
  
  else
    echo "Failed  install Ruby"
   return 1
  
  fi
  return 0
}
