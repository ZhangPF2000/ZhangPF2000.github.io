---
title: 07_cpp_重新排列数字返回尽可能大的数字
toc: true
recommend: 1
keywords: 重新排列数字返回尽可能大的数字
uniqueId: '2021-04-25 04:21:29/07_cpp_重新排列数字返回尽可能大的数字.html'
mathJax: false
date: 2021-04-25 12:21:29
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/cpp)
> 内容介绍

```text
Your task is to make a function that can take any non-negative integer as an argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.
Examples:

Input: 42145 Output: 54421

Input: 145263 Output: 654321

Input: 123456789 Output: 987654321
```

<!-- more -->

> 我的解题思路
>
> - 把给的数字拆分成单个数字放入到容器中
> - 对容器排序
> - 逆向迭代器输出得到最大值
> - 返回最大值
>
> 代码如下

```cpp
// 这个头文件提供了`uint64_t`这个数据类型
#include <cinttypes>

uint64_t descendingOrder(uint64_t a)
{
    std::vector<int> v;
    uint64_t max = 0;
    for (size_t i = 0; a != 0; i++)
    {
        v.push_back(a % 10);
        a = a / 10;
    }
    sort(v.begin(), v.end());
    for (std::vector<int>::reverse_iterator i = v.rbegin(); i != v.rend(); i++)
    {
        max = max * 10 + *i;
    }
    return max;
}
```

## 大佬的解决方案

```cpp 大佬的解决方案1
#include <cinttypes>
#include <string>
#include <algorithm>

uint64_t descendingOrder(uint64_t a)
{
  std::string s = std::to_string(a);
  std::sort(s.rbegin(), s.rend());
  return std::stoull(s);
}
/**
 * 这份代码很简洁
 * 使用的方法是把数字直接通过std:to_string转换成string类型
 * 然后使用std::sort进行排序
 * 最后通过std::stoull进行输出返回
 * 这个stoull是string头文件中的
 * 就是把字符串转换成数字用的,还有其他的一些函数也是这样的
 * 只是返回值(数字)的类型不一样
*/
```

```cpp 大佬的解决方案2
#include <cinttypes>

uint64_t descendingOrder(uint64_t a)
{
  std::vector<int> c ;

  for(uint64_t b = a ; b > 0 ; b /=10)
    c.push_back(b % 10);

  for(int i=0 ; i < c.size() ; i++)
    for(int j=i; j < c.size() ; j++)
      if(c[i] < c[j])
        std::swap(c[i],c[j]);
  a=0;
  for(int i=0; i < c.size() ;i++)
    a = a*10 + c[i];

  return a;
}

/**
 * 这份代码中
 * 值的学习的是那个std::swap()函数
 * 交换函数还是很常用的,这个要记住对于容器来说
*/
```

> 学到的知识点
> 逆向迭代器的方法可以使用`vector<int>::reverse_iterator`的方法
> sort 排序是在`<algorithm>`头文件中的,要注意
> sort 排序的还可以自定义排序方式
> std::sort(v1, v2, func);
> 通过编写 func 函数进行排序,排序规则是根据 func 函数进行的
> sort 排序之后,默认是从小到大的
> 可以使用`std::reverse()`进行逆向再排序

# 希望能对你有所帮助(p_o)
