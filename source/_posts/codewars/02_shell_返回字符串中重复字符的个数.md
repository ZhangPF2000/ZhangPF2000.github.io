---
title: 02_shell_返回字符串中重复字符的个数
toc: true
recommend: 1
keywords: 返回字符串中重复字符的个数
uniqueId: '2021-04-24 06:02:39/02_shell_返回字符串中重复字符的个数.html'
mathJax: false
date: 2021-04-24 14:02:39
thumbnail:
tags:
  - codewars
  - shell
categories:
  - codewars
  - shell
---

> [题目链接](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/shell)
> 内容介绍

```text
Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
Example

"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
/**
 * 给定一个字符串
 * 忽略字符的大小写,字符串中只有英文字母和数字
 * 返回里面有几个字符是重复的
*/
```

<!-- more -->

> 我的解决方案
> 通过把字符串拆成单个字符
> 判断字符的重复个数
> 比较返回
> 代码掩饰

```bash
#! /bin/bash

function count
{
        if [ -z $1 ] ; then
                echo '空字符串'
                return 0
        fi
        # 这些是获取字符串的长度的方法
        #echo $1 | wc -c
        #var=$1
        #echo ${#var}
        #expr length $1

        # 循环遍历把每个字符放到数组中
        for((i=1;i<=$(expr length $1); i++))
        do
                #echo $(echo $1 | cut -b $i)
                Arr[i-1]=`echo $1 | cut -b $i`
        done
        # echo Arr[@]是打印出数组中所有的内容,以空格区分
        test=$(echo ${Arr[@]} | tr " " "\n" | sort | uniq -ci | tr [:alpha:] ' ' | sed s/[[:space:]]//g)
        # 上面的是对字符的处理
        # tr " " "\n"把空格换成换行
        # sort 排序
        # uniq -ci 去重,c是输出重复的个数,i是忽略大小写
        # tr [:alpha:] ' '是把字符换成空格
        # sed s/[[:space:]]//g 删除所有的空格
        # 这个可能会有bug, 数字那个地方
        count=0
        for t in $test
        do
            # 把字符串变成数字
            num=$((10#${t}))
            echo "num = $num"
            if [ $num -gt 1 ] ; then
                # 数字自增
                count=$(($count+1))
            fi
        done
        return $count
}

count $1
echo $?

# 我是写了个函数
# 传入的参数是$1
# 最后的echo $?是打印调用函数的返回值
```

> 我的解决方案还是有很大的缺陷
> 过了测试是侥幸
> 里面对字符串的处理还是不清楚

## 看看大佬的解决方案

```bash
#! /bin/bash
echo $1 | grep -o . | sort -f | uniq -id | wc -l
# grep -o .
# -o, --only-matching       只显示行中非空匹配部分
# -o 后面的是正则表达式
# sort -f :忽略大小写进行排序
# uniq -id
# 去重,-i 是忽略大小写,-d是打印重复的行,不重复的不显示
# wc -l, 输出行数
# 太强了


# =====================================
echo $1 | tr [A-Z] [a-z] | grep -o . | sort | uniq -d | wc -l
# 这个大致都差不多
# tr [A-Z] [a-z]是通过把大写都换成小写的,忽略大小写进行排序

# =====================================

echo $1 \
   | tr '[:upper:]' '[:lower:]' \
   | awk -F '' 'BEGIN{OFS="\n"} {$1=$1; print $0}' \
   | sort \
   | uniq -c \
   | awk '{if ($1>=2) print $2}' \
   | wc -l

# =====================================
ls -al
# why?????????????/

# =====================================

echo $@ | grep -o . | awk '{print toupper($0)}' | sort | uniq -idc | wc -l
```

## 学到的知识点

> grep -o .
> sort -f
> uniq -idc
> tr 'xxx' 'xxx'
> wc -l
> 字符串转数字+shell 中数字相加

```bash 字符串转数字 >folded
#linux shell 字符串转数字
#转载：https://blog.csdn.net/whish1994/article/details/78379659

#原型： value=$((n#${key}Xm))
#value:自定义变量得到运算的值
#n:欲转成的进制数； 2进制就是2，10进制就是10
#key:字符串变量
#X：操作符；如+ - * /  &...
#m:操作数
#实例1：10进制字符32加上32

a='32'
value=$((10#${a}+32))
#=================

#!/bin/sh
#本脚本测试shell脚本中整型变量自增 加1的几种方法

#定义整型变量
a=1
echo $a

#第一种整型变量自增方式
a=$(($a+1))
echo $a

#第二种整型变量自增方式
a=$[$a+1]
echo $a

#第三种整型变量自增方式
a=`expr $a + 1`
echo $a

#第四种整型变量自增方式
let a++
echo $a

#第五种整型变量自增方式
let a+=1
echo $a

#第六种整型变量自增方式
((a++))
echo $a
————————————————
版权声明：本文为CSDN博主「yumushui」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/yumushui/article/details/53469845
```

# 希望能对你有所帮助(p_o)
