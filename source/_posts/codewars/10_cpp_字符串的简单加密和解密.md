---
title: 10_cpp_字符串的简单加密和解密
toc: true
recommend: 1
keywords: 字符串的简单加密和解密
uniqueId: '2021-04-25 09:06:25/10_cpp_字符串的简单加密和解密.html'
mathJax: false
date: 2021-04-25 17:06:25
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/57814d79a56c88e3e0000786/train/cpp)
> 内容介绍

```text
For building the encrypted string:
Take every 2nd char from the string, then the other chars, that are not every 2nd char, and concat them as new String.
Do this n times!

Examples:

"This is a test!", 1 -> "hsi  etTi sats!"
"This is a test!", 2 -> "hsi  etTi sats!" -> "s eT ashi tist!"

Write two methods:

std::string encrypt(std::string text, int n)
std::string decrypt(std::string encryptedText, int n)

For both methods:
If the input-string is null or empty return exactly this value!
If n is <= 0 then return the input text.

This kata is part of the Simple Encryption Series:
Simple Encryption #1 - Alternating Split
Simple Encryption #2 - Index-Difference
Simple Encryption #3 - Turn The Bits Around
Simple Encryption #4 - Qwerty

Have fun coding it and please don't forget to vote and rank this kata! :-)
```

<!-- more -->

> 经分析
> 这个加密和解密是简单越过一个单词后进行组装的
> 多次循环即可加密
> 再加密的时候要注意原字符串的长度是奇数还是偶数
> 不然会导致加密的时候出错
> 解密的时候,忘了
> 解题代码如下

```cpp
#include <string>
std::string encrypt(std::string text, int n)
{
    if (n <= 0 || text.size() == 0)
        return text;
    std::string str = "";
    int length = (text.size() % 2 == 0) ? text.size() + 1 : text.size();
    for (int i = 0; i < n; i++)
    {
        /* code */
        for (int j = 0; j < text.size(); j++)
        {
            str += text[(2 * (j + 1) - 1) % length];
        }
        text = str;
        str = "";
    }

    return text;
}

std::string decrypt(std::string encryptedText, int n)
{
    if (n <= 0 || encryptedText.size() == 0)
        return encryptedText;
    std::string str = "";
    int length = encryptedText.size();
    for (int i = 0; i < n; i++)
    {
        /* code */
        for (int j = 0; j < length; j++)
        {
            /* code */
            str += encryptedText[(j % 2 == 0) ? (j / 2) + (length / 2) : (j - 1) / 2];
        }
        encryptedText = str;
        str = "";
    }
    return encryptedText;
}
```

## 大佬的解决方案

```cpp 大佬的解决方案
template <bool forward>
inline static std::string transform(std::string text) {
  int n = text.length(), k = 0;
  std::string s(n, ' ');
  for (int p = 1; p >= 0; --p)
    for (int j = p; j < n; j += 2)
      if (forward) s[k++] = text[j]; else s[j] = text[k++];
  return s;
}

std::string encrypt(std::string text, int n) {
  for (int i = 0; i < n; ++i) text = transform<true>(text);
  return text;
}

std::string decrypt(std::string text, int n) {
  for (int i = 0; i < n; ++i) text = transform<false>(text);
  return text;
}

/**
 * 太强了
 * 这个使用模板进行操作
 * 节省了内存空间
 * 也简单直白
 * 模板中的双层循环
 * 就是分别操作字符串中的奇数位和偶数位
*/
```

> 大佬的解决方案中还有就是常见的递归
> 我本来也想使用递归的,分析的时候有难度
> 就使用了 for 循环进行解决,使用 for 循环更容易的了解运行过程
> 学到的知识点
>
> - 要仔细分析运行过程
> - 初始化 string 字符串的方式
> - std::string(n, ' ');创建长度为 n 的字符串,里面的值为空格

# 希望能对你有所帮助(p_o)
