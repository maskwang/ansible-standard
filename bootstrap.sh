#!/bin/bash
# 自动化部署标准机脚本
# User: Mask Wang
# Email: mask.wang.cn@gmail.com
# Date: 15-03-06
# Time: 下午20:49
set -e
echo '==>自动化部署标准机器ing...'

############################变量start

#ansible path
ansible_path=`pwd`

# mac or ubuntu
uname=`uname`

if [ "Darwin" = "$uname" ];then
  isSudo=""
else
  isSudo="sudo "
fi

# 导出变量
export ansible_path
export uname
export isSudo
############################变量end


# main
cd "$ansible_path/bin"
for file in {initEnv,runAnsible};do
  [ -r "$file" ] && [ -f "$file" ] && bash "$file"
  cd "$ansible_path/bin"
done
unset file

echo '==>自动化部署标准机器成功^_^'
