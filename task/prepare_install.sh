function Run(){
  # For Install Git on sakura VPS
  cd $TEMP_DIR
  wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
  rpm --import http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
  rpm -K  rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
  rpm -ivh rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm

  return 0
}
