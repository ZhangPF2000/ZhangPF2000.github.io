---
title: 04_cpp_返回容器中的最小值
toc: true
recommend: 1
keywords: 返回容器中的最小值
uniqueId: '2021-04-24 08:12:41/04_cpp_返回容器中的最小值.html'
mathJax: false
date: 2021-04-24 16:12:41
thumbnail:
tags:
categories:
---

> [题目链接](https://www.codewars.com/kata/55a2d7ebe362935a210000b2/train/cpp)
> 内容介绍

```text
Given an array of integers your solution should find the smallest integer.

For example:

    Given [34, 15, 88, 2] your solution will return 2
    Given [34, -345, -1, 100] your solution will return -345

You can assume, for the purpose of this kata, that the supplied array will not be empty.
```

<!-- more -->

> 我的代码
> 这个题目还是很简单的

```cpp
int findSmallest(vector <int> list)
{
    // Your Code is Here ... Hope you Enjoy
    int num = list[0];
    for(auto &i : list)
    {
        if(num >= i)
            num = i;
    }
    return num;
}
```

## 大佬的代码

```cpp
#include <algorithm>
#include <vector>

int findSmallest(const std::vector<int>& xs) {
  return *std::min_element(xs.cbegin(), xs.cend());
}
// 使用算法解决问题
```

> 这个题目的启发
> 多使用 cpp 的语法,而不要纠结于 c 语言的
> cpp 的好多语法都很安全

# 希望能对你有所帮助(p_o)
