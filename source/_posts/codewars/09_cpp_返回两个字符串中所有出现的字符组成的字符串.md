---
title: 09_cpp_返回两个字符串中所有出现的字符组成的字符串
toc: true
recommend: 1
keywords: 返回两个字符串中所有出现的字符组成的字符串
uniqueId: '2021-04-25 05:17:06/09_cpp_返回两个字符串中所有出现的字符组成的字符串.html'
mathJax: false
date: 2021-04-25 13:17:06
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/5656b6906de340bd1b0000ac/train/cpp)
> 内容介绍

```text
Take 2 strings s1 and s2 including only letters from ato z. Return a new sorted string, the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.
Examples:

a = "xyaabbbccccdefww"
b = "xxxxyyyyabklmopq"
longest(a, b) -> "abcdefklmopqwxy"

a = "abcdefghijklmnopqrstuvwxyz"
longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"
```

<!-- more -->

> 我的解题思路
>
> - 创建一个数组`int arr[128]`
> - 把出现的字符都添加到里面`arr[char]++`
> - 最后遍历 arr 数组,大于 1 的都是出现过的
> - 然后就可以得到出现过字符的 ascii 码,返回即可
>
> 代码演示

```cpp
#include <string>
#include <limits>

class TwoToOne
{
public:
    static std::string longest(const std::string &s1, const std::string &s2);
};

std::string TwoToOne::longest(const std::string &s1, const std::string &s2)
{
    int arr[std::numeric_limits<char>::max()] = {0};
    std::string str = "";
    for(auto i : s1)
    {
        arr[i]++;
    }
    for(auto i : s2)
    {
        arr[i]++;
    }
    for (size_t i = 0; i < std::numeric_limits<char>::max(); i++)
    {
        /* code */
        if (arr[i] > 0)
        {
            str += i;
        }
    }
    return str;
}
```

## 大佬的解题方案

```cpp 大佬的解题方案1
#include <set>
#include <string>

class TwoToOne
{
public:
    static std::string longest(const std::string &s1, const std::string &s2)
    {
        std::set<char> se;
        se.insert(s1.begin(),s1.end());
        se.insert(s2.begin(),s2.end());

        return std::string(se.begin(),se.end());
    }
};
/**
 * 这个解决方案是使用set容器
 * 这个容器最大的特点就是是一个集合
 * 但是里面的元素是唯一的
 * 这样就确保了不会重复
 * 好像这个最后是可以自动排序的,
 * 很棒的思路,不用考虑其他的内容
 * 两次添加字符串即可解决字符重复的问题
*/
```

```cpp 大佬的解决方案2
class TwoToOne
{
public:
    static std::string longest(const std::string &s1, const std::string &s2) {

      std::string concat = s1 + s2;
      std::sort(concat.begin(), concat.end());
      auto end = std::unique(concat.begin(), concat.end());
      return std::string(concat.begin(), end);
    }
};

/**
 * 这个的思路是先合并成一个字符串
 * 然后排序该字符串
 * 然后去重
 * 也很不错,使用的是std::unique()
 * 这个函数是在算法头文件中<algorithm>
*/
```

> 学到的知识点
>
> - 初识 set 容器
> - set 的插入 insert,可以插入范围
> - 联想其他容器 vector 之类的也可以进行范围性插入
> - std::unique();去重函数

# 希望能对你有所帮助(p_o)
