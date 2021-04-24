---
title: 03_cpp_电影票找钱问题
toc: true
recommend: 1
keywords: 电影票找钱问题
uniqueId: '2021-04-24 07:59:12/03_cpp_电影票找钱问题.html'
mathJax: false
date: 2021-04-24 15:59:12
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/555615a77ebc7c2c8a0000b8/cpp)
> 内容介绍

```text
Description:

The new "Avengers" movie has just been released! There are a lot of people at the cinema box office standing in a huge line. Each of them has a single 100, 50 or 25 dollar bill. An "Avengers" ticket costs 25 dollars.

Vasya is currently working as a clerk. He wants to sell a ticket to every single person in this line.

Can Vasya sell a ticket to every person and give change if he initially has no money and sells the tickets strictly in the order people queue?

Return YES, if Vasya can sell a ticket to every person and give change with the bills he has at hand at that moment. Otherwise return NO.
Examples:

tickets({25, 25, 50}) // => YES
tickets({25, 100}) // => NO. Vasya will not have enough money to give change to 100 dollars
tickets({25, 25, 50, 50, 100}) // => NO. Vasya will not have the right bills to give 75 dollars of change (you can't make two bills of 25 from one of 50)

```

<!-- more -->

> 我的解题思路
> 把钱分为三类:25,50,100
> 分别创建容器,来一个钱压入相对应的容器中
> 当压入 50 时,查看 25 的容器中是否还有钱,没有就返回"NO"
> 当压入 100 时,找钱 75,分两种情况,50+25|25+25+25
> 通过判断解决
> 代码演示

```cpp
std::string tickets(const std::vector<int> &peopleInLine)
{
    // your code here
    if (peopleInLine[0] != 25)
        return "NO";

    std::vector<int> m25;
    std::vector<int> m50;
    std::vector<int> m100;
    for (auto i : peopleInLine)
    {
        std::cout << "i = " << i << std::endl;
        switch (i)
        {
        case 25:
            m25.push_back(i);
            break;
        case 50:
            m50.push_back(i);
            if (m25.size() == 0)
                return "NO";
            m25.pop_back();
            break;
        case 100:
        {
            m100.push_back(i);
            if ((m50.size() > 0 && m25.size() > 0) || (m25.size() > 3))
            {
                if (m50.size() == 0)
                {
                    m25.pop_back();
                    m25.pop_back();
                    m25.pop_back();
                }
                else
                {
                    m50.pop_back();
                    m25.pop_back();
                }
            }
            else
                return "NO";
            break;
        }
        }
    }
    return "YES";
}
```

> 上面的代码还有可以优化的地方
> 比如: 100 的容器根本就不用创建,因为不用 100 找零

## 大佬的解题代码

```cpp
std::string tickets(const std::vector<int> peopleInLine){
  int count[2] = {0,0};
  for(auto v: peopleInLine) {
    if(v == 25) count[0]++;
    if(v == 50) {count[1]++; count[0]--;}
    if(v == 100) {count[0]--; count[1]>0? count[1]-- : count[0]-=2;}
    if(count[0]<0||count[1]<0) return "NO";
  }
  return "YES";
}
```

> 分析:大佬是用数组将 25 和 50 的个数保存起来
> 需要找零的时候就减一,收钱的时候就加一
> 这样就更加的节省空间了
> 当收钱 100 的时候,找零是必须要找一张 25 的
> 所以可以提前找,后续判断 50 或 25 的够不够

# 希望能对你有所帮助(p_o)
