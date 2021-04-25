---
title: 06_cpp_返回容器中连续数字的最大值
toc: true
recommend: 1
keywords: 返回容器中连续数字的最大值
uniqueId: '2021-04-24 13:51:51/06_cpp_返回容器中连续数字的最大值.html'
mathJax: false
date: 2021-04-24 21:51:51
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c/train/cpp)
> 内容介绍

```text
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

maxSequence({-2, 1, -3, 4, -1, 2, 1, -5, 4});
//should be 6: {4, -1, 2, 1}

Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.
```

> 题目的大致意思就是,给你一个容器,里面是 int 型变量
> 写一个函数,返回一个最大值,
> 这个最大值是容器里面连续片段求和的最大值

<!-- more -->

> 我的解题思路
> 刚开始的时候,想法出错了,搞了一半写不出来了
> 然后我就选择了最笨的方法,遍历所有的连续的容器片段之和
> 然后返回我的最大值,虽然方法笨但是还能写出来
> 我的代码片段

```cpp 解题代码 >folded
#include <vector>
#include <algorithm>

using namespace std;

int maxSequence(const vector<int> arr){
    //...
    std::vector<int> result;
    int num = 0, max = 0, ni = 0, nj = 0;
    for (auto i : arr)
    {
        num = i;
        for (auto j : arr)
        {
            if (ni < nj)
            {
                num = j + num;
                result.push_back(num);
            }
            nj++;
        }
        if(max < *(max_element(result.cbegin(), result.cend())))
        {
            max = *(max_element(result.cbegin(), result.cend()));
        }
        result.clear();
        ni++;
        num = 0;
        nj = 0;
    }
    return max;
}
```

> 我的代码还是有改进的地方
> 这个函数传入的参数类型是`const vector<int> &arr`
> 带有 const 在刚开始我写的时候,用的是`vector<int>::iterator i = arr.begin`
> 但是会报错,那时候没反应过来,该用了`for(auto i : arr)`
> 但是临时变量就多了,而且二次循环的时候比较有问题,
> 当我提交之后,看到了`*max_element(result.cbegin(), result.cend())`
> 里面的`cbegin()`、`cend()`和`begin()`、`end()`有区别
> 我去百度了一下,发现`cbegin()`和`cend()`是适用于`vector<int>::const_iterator i = arr.begin();`
> 发现没有报错
> 1.iterator,const_iterator 作用：遍历容器内的元素，并访问这些元素的值。iterator 可以改元素值,但 const_iterator 不可改。跟 C 的指针有点像。
> 2.const_iterator 对象可以用于 const vector 或非 const vector,它自身的值可以改(可以指向其他元素),但不能改写其指向的元素值。
> 3.cbegin()和 cend()是 C++11 新增的，它们返回一个 const 的迭代器，不能用于修改元素。
> [原文链接](https://blog.csdn.net/u010987458/article/details/70949112)
> 又 get 到一个知识点
> 下面的代码是我优化后的方案

```cpp 优化方案
int maxSequence(const std::vector<int> arr)
{
    //...
    std::vector<int> result;
    int num = 0, max = 0;
    for (std::vector<int>::const_iterator i = arr.cbegin(); i != arr.cend(); i++)
    {
        num = *i;
        for (std::vector<int>::const_iterator j = i + 1; j != arr.cend(); j++)
        {
            num = *j + num;
            result.push_back(num);
        }
        num = 0;
        if (max < *std::max_element(result.cbegin(), result.cend()))
        {
            max = *std::max_element(result.cbegin(), result.cend());
        }
        result.clear();
    }
    std::cout << "max == " << max << std::endl;
    return max;
}
```

> 代码优化之后就不臃肿了
> 运行的效率也提高了不少
> 优化后的运行时间`2720`:优化前的运行时间`2986`[注释:是网站上显示的时间]

## 大佬的方案

```cpp 大佬的方案1
#include <vector>

using namespace std;

int maxSequence(const vector<int>& arr)
{
    int sum = 0, maxsum = 0;
    if (arr.size() == 0){return 0;}
    for (auto x: arr)
    {
        sum = max(sum+x,0);
        maxsum = max(maxsum,sum);
    }
    return maxsum;
}
```

```cpp 大佬的方案2
#include <vector>

using namespace std;

int maxSequence(const vector<int>& arr) {
  int localmax=0;
  int globalmax=0;
  for (int i = 0;i<arr.size();i++)
  {
    localmax = localmax + arr[i];
    if (localmax > globalmax)
      globalmax = localmax;
    if (localmax < 0)
      localmax = 0;
  }
  return globalmax;
}
```

> 大佬的方案就是简洁
> 学到的知识点
>
> - 交替遍历数据
> - cbegin()和 cend()
> - 求容器的最大值:\*std::max_element(result.cbegin(), result.cend());

# 希望能对你有所帮助(p_o)
