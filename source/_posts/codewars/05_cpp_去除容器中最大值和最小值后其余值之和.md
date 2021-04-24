---
title: 05_cpp_去除容器中最大值和最小值后其余值之和
toc: true
recommend: 1
keywords: 去除容器中最大值和最小值后其余值之和
uniqueId: '2021-04-24 08:29:36/05_cpp_去除容器中最大值和最小值后其余值之和.html'
mathJax: false
date: 2021-04-24 16:29:36
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/576b93db1129fcf2200001e6/train/cpp)
> 内容介绍

```text
Sum all the numbers of the array (in F# and Haskell you get a list) except the highest and the lowest element (the value, not the index!).
(The highest/lowest element is respectively only one element at each edge, even if there are more than one with the same value!)

Example:

{ 6, 2, 1, 8, 10 } => 16
{ 1, 1, 11, 2, 3 } => 6


If array is empty, null or None, or if only 1 Element exists, return 0.
Note:In C++ instead null an empty vector is used. In C there is no null. ;-)

-- There's no null in Haskell, therefore Maybe [Int] is used. Nothing represents null.

Have fun coding it and please don't forget to vote and rank this kata! :-)

I have created other katas. Have a look if you like coding and challenges.

```

<!-- more -->

> 我的解题代码

```cpp
#include<vector>
#include<algorithm>
using namespace std;

int sum(vector<int> numbers)
{
    if (numbers.size() < 2)
        return 0;
    int min = *std::min_element(numbers.cbegin(), numbers.cend());
    int max = *std::max_element(numbers.cbegin(), numbers.cend());
    int add=0;
    for(auto &i : numbers)
        add+=i;
    return add-min-max;
}
/**
 * 这里我使用了前面学的算法
 * 轻松获得容器中的最大值和最小值
 * 对容器内所有元素求和再减去最大值和最小值
 * 注意:
 * 当容器为空,或者只有一个元素的时候,返回0
*/
```

# 希望能对你有所帮助(p_o)
