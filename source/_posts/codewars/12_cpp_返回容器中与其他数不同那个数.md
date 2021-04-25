---
title: 12_cpp_返回容器中与其他数不同那个数
toc: true
recommend: 1
keywords: 返回容器中与其他数不同那个数
uniqueId: '2021-04-25 13:58:05/12_cpp_返回容器中与其他数不同那个数.html'
mathJax: false
date: 2021-04-25 21:58:05
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/cpp)
> 内容介绍

```text
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.
Examples

[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

/**
 * 大致的意思就是
 * 给你一个容器,
 * 里面全是数字,容器大小最小为3个
 * 里面只有一个奇数或偶数
 * 请找出这个奇数或偶数并返回
*/
```

<!-- more -->

> 我的解题思路
>
> - 该开始是打算用`a[num%2]++`得到奇数和偶数的个数
> - 然后遍历容器中元素当比对上那个要求的数时就返回
> - 后来不想循环两次就放弃了
> - 然后打算是用 map 来解决这个问题
> - map 是一种映射关系,在 python 中就是字典(`键值对`)
> - 所以这样就尤为的方便
> - 我创建的是`std::map<bool, int> m`
> - 通过上面的奇数和偶数个数差,再通过 map 的一个 find 函数查找 bool 类型
> - 即可确定那个不一样的数
>
> 我的解题代码

```cpp
#include <vector>
#include <map>

int FindOutlier(std::vector<int> arr)
{
    int result = 0;
    std::map<bool, int> m;
    int a[2] = {0, 0};
    for (auto i : arr)
    {
        m.insert(std::pair<bool, int>{i % 2, i});
        a[i % 2]++;
    }
    result = (a[0] < a[1]) ? m.find(false)->second : m.find(true)->second;
    return result;
}
```

## 大佬的解决方案

```cpp 大佬的解决方案1
int FindOutlier(std::vector<int> arr)
{
    int even;
    int odd;

    int evenCount = 0;
    int oddCount = 0;

    for (auto a : arr)
        a % 2 == 0 ? (evenCount++, even = a) : (oddCount++, odd = a);

    return evenCount < oddCount ? even : odd;
}
```

```cpp 大佬的解决方案2
#include <algorithm>

int FindOutlier(std::vector<int> arr)
{
    bool lsb;
    if((lsb = arr[0]&1) == (arr[1]&1))
        return *std::find_if(arr.begin()+2, arr.end(), [&](const int& i){ return (i&1) != lsb; });
    else
        return (lsb == (arr[2]&1)) ? arr[1] : arr[0];
}
```

> get 到的知识点
>
> - map 的初步使用
> - 创建 map 键值对`std::map<bool,int> m`
> - map 插入一个键值对`m.insert(pair<bool,int>(false, 10))`
> - map 的查找操作`m.find(false)`(注意:这里只是找到了)
> - map 找到后访问第一个元素`m.find(false)->first`,第二个是`m.find(false)->second`
> - first 是键(Key),second 是值(Value)
> - 出大问题了............
> - TMD 这个 map 有问题,我忘了,key 只能有一个
> - 还有要是测试的数据中有重复的数字的话,那反过来创建的`<int,bool>`也不行 l
> - 但神奇的是我的代码通过了,好吧,在这里注意下
> - 总之我的代码太烂了,但是过了,不管了,map 是个坑
> - 是个大坑,在写博客的时候我去运行我修改后的 map 代码
> - 真 TM 迷一样的数据结构,太 TM 蒙蔽了
> - 以后好好学学这个 map 吧,键值对还是很有用的

# 希望能对你有所帮助(p_o)
