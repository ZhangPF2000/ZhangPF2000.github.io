#! /bin/bash

echo '在_posts文件夹下创建$1文件夹'
echo "在$1文件夹下创建文件$2.md"

if [ -f "./source/_posts/$1/$2.md" ] ; then
	echo "$2.md文件已经存在了"
	echo "请重新考虑一个文件名"
else
	hexo new post -p $1/$2 $2
fi
