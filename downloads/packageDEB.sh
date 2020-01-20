#!/bin/bash
# Auther: Dev-Ddongfang
# 

TEMP_FILE_LOCATION="./"
TEMP_TOP_FLODER_NAME="${TEMP_FILE_LOCATION}/.pachage_debfile_tmp_floder/"
TEMP_DEBIAN_PATH="${TEMP_TOP_FLODER_NAME}/DEBIAN"
TEMP_APPLICATIONS_PATH="${TEMP_TOP_FLODER_NAME}/Applications"



#创建文件目录结构
createCrucialFloder(){
	mkdir ${TEMP_TOP_FLODER_NAME}
	mkdir ${TEMP_DEBIAN_PATH}
	mkdir ${TEMP_APPLICATIONS_PATH}

	echo "已创建临时目录结构"
}

#使用完毕删除目录结构
deleteCrucialFloder(){
	rm -rf ${TEMP_TOP_FLODER_NAME}
}

#创建并构建control文件
createControlFile(){
	controlPath="${TEMP_DEBIAN_PATH}/control"
	echo "" > ${controlPath}

	echo "参数格式请参考官网：https://www.debian.org/doc/debian-policy/ch-controlfields.html"

	read -p "请输入应用包名：" package
	read -p "请输入应用名称：" name
	read -p "请输入版本号：" version
	read -p "请输入应用图标：" icon
	read -p "请输入应用分类：" section
	read -p "请输入应用描述：" desc
	read -p "请输入应用支持最低版本号：" firmware
	read -p "请输入作者：" author
	read -p "请输入维护人：" maintainer
	read -p "请输入主页：" homepage
	read -p "请输入支持的cpu类型：" cputype

	echo "Package: ${package}" >> ${controlPath}
	echo "Name: ${name}" >> ${controlPath}
	echo "Version: ${version}" >> ${controlPath}
	echo "Description: ${desc}" >> ${controlPath}
	echo "Section: ${section}" >> ${controlPath}
	echo "Depends: ${firmware}" >> ${controlPath}
	echo "Architecture: ${cputype}" >> ${controlPath}
	echo "Author: ${author}" >> ${controlPath}
	echo "Maintainer: ${maintainer}" >> ${controlPath}
	echo "Homepage: ${homepage}" >> ${controlPath}
	echo "Icon: ${icon}" >> ${controlPath}
}

#复制App文件
copyAppFile(){
	read -p "请输入App文件绝对路径：" apppath
	cp -r ${apppath} ${TEMP_APPLICATIONS_PATH}
}

#生成deb文件，并存放到当前目录
createDebFile(){
	read -p "请输入deb名字：" deb_name
	dpkg-deb -b ${TEMP_TOP_FLODER_NAME} ${deb_name}.deb
}



#1.创建目录结构
createCrucialFloder
#2.创建control文件
createControlFile
#3.复制APP文件
copyAppFile
#4.生成deb文件，并存放到当前目录
createDebFile
#5.删除目录结构
deleteCrucialFloder

