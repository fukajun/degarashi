# Install RVM
function Run(){

  # Add group
  find / | grep -q /usr/local/rvm 
  if [ $? -eq 1 ];then
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  if [ $? -eq 0 ]; then
    echo "Success install RVM"
  
  else
    echo "Failed  install RVM"
   return 1
  
  fi
  else
  echo "Already installed RVM"
  
  fi
  return 0
}
