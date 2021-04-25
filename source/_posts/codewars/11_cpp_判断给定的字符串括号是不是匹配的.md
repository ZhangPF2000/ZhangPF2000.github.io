---
title: 11_cpp_判断给定的字符串括号是不是匹配的
toc: true
recommend: 1
keywords: 判断给定的字符串括号是不是匹配的
uniqueId: '2021-04-25 11:45:36/11_cpp_判断给定的字符串括号是不是匹配的.html'
mathJax: false
date: 2021-04-25 19:45:36
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/5277c8a221e209d3f6000b56/train/cpp)
> 内容介绍

```text
Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.

This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!

All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.
What is considered Valid?

A string of braces is considered valid if all braces are matched with the correct brace.
Examples

"(){}[]"   =>  True
"([{}])"   =>  True
"(}"       =>  False
"[(])"     =>  False
"[({})](]" =>  False
```

<!-- more -->

> 我的解题思路
> 刚开始是考虑到前段时间学到的栈了
> 使用`<stack>`头文件去使用栈解决
> 在我的 vscode 上是成功的解决了
> 但是在 codewars 网站上却出现了错误
> 还是内存错误,我在评论区看到和我一样错误的了
> 但是没给答案,好像是用 gdb 调试发现有问题的(我不会)
> 然后去百度,后来发现了一种不错的方法,
> 就是字符串替换,把成对的` ()``{}``[] `换成`''`
> 这样最后换完之后
> 如果字符串是空的,就返回 true,
> 如果不是空的,就返回 false
> 这样就解救这个问题了
> 我的代码演示

```cpp
int valid_braces(std::string braces)
{
    // valid or not valid?
    if (braces.size() % 2 == 0)
    {
        while (true)
        {
            /* code */
            bool b1 = braces.find("{}") < braces.size() / 2,
                 b2 = braces.find("()") < braces.size() / 2,
                 b3 = braces.find("[]") < braces.size() / 2;
            if (b1)
                braces = braces.replace(braces.find("{}"), 2, "");
            if (b2)
                braces = braces.replace(braces.find("()"), 2, "");
            if (b3)
                braces = braces.replace(braces.find("[]"), 2, "");
            std::cout << braces << std::endl;
            if (braces.empty())
                return true;
            if (!b1 && !b2 && !b3)
                return false;
        }
    }
    else
    {
        return false;
    }
}
```

## 大佬的解题思路

```cpp 大佬的解题思路1
bool valid_braces(std::string braces)
{
  std::vector<char> stack;
  for (char tok : braces) {
    switch(tok) {
    case '(':
      stack.push_back(')');
      break;
    case '[':
      stack.push_back(']');
      break;
    case '{':
      stack.push_back('}');
      break;
    case '}': case ']': case ')':
      if (stack.empty() || stack.back() != tok)
        return false;
      stack.pop_back();
    }
  }
  return stack.empty();
}

/**
 * 这个使用的是容器,我也用了
 * 但是还是报了内存错误
*/
```

```cpp 大佬的解决思路2
#include <regex>

bool valid_braces(std::string s) {
  std::regex r ("\\(\\)|\\[\\]|\\{\\}");
  while (std::regex_search(s, r)) s = std::regex_replace(s, r, "");
  return s.length() == 0;
}
/**
 * 使用正则表达式解决问题
 * nice
 * 把匹配到的替换成空即可
*/
```

> 启发:
> 在其他人的解决方案中
> 我也发现了 stack 的使用,但是他们都通过了测试
> 很奇怪,但是他们的也确实找不出错误,
> 可能是我的在某些地方有问题吧
> get 到的知识点
>
> - 了解 string 的替换
> - 了解 string 的 find 查找函数
> - 上面那两个还要继续学习,重载很多
> - 初识 map
> - 初识 regex

```cpp string的发现函数 >folded
s.find(s1)              //查找s中第一次出现s1的位置，并返回（包括0）
s.rfind(s1)             //查找s中最后次出现s1的位置，并返回（包括0）
s.find_first_of(s1)     //查找在s1中任意一个字符在s中第一次出现的位置，并返回（包括0）
s.find_last_of(s1)      //查找在s1中任意一个字符在s中最后一次出现的位置，并返回（包括0）
s.fin_first_not_of(s1)  //查找s中第一个不属于s1中的字符的位置，并返回（包括0）
s.fin_last_not_of(s1)   //查找s中最后一个不属于s1中的字符的位置，并返回（包括0）

// 官方网站上的内容;https://zh.cppreference.com/w/cpp/header/string
template<class T>
    constexpr size_type find(const T& t, size_type pos = 0) const
    noexcept(/* 见描述 */);
constexpr size_type find(const basic_string& str, size_type pos = 0) const noexcept;
constexpr size_type find(const CharT* s, size_type pos, size_type n) const;
constexpr size_type find(const CharT* s, size_type pos = 0) const;
constexpr size_type find(CharT c, size_type pos = 0) const noexcept;


template<class T>
    constexpr size_type rfind(const T& t, size_type pos = npos) const
    noexcept(/* 见描述 */);
constexpr size_type rfind(const basic_string& str,
                            size_type pos = npos) const noexcept;
constexpr size_type rfind(const CharT* s, size_type pos, size_type n) const;
constexpr size_type rfind(const CharT* s, size_type pos = npos) const;
constexpr size_type rfind(CharT c, size_type pos = npos) const noexcept;


template<class T>
    constexpr size_type find_first_of(const T& t, size_type pos = 0) const
    noexcept(/* 见描述 */);
constexpr size_type find_first_of(const basic_string& str,
                                    size_type pos = 0) const noexcept;
constexpr size_type find_first_of(const CharT* s, size_type pos, size_type n) const;
constexpr size_type find_first_of(const CharT* s, size_type pos = 0) const;
constexpr size_type find_first_of(CharT c, size_type pos = 0) const noexcept;


template<class T>
    constexpr size_type find_last_of(const T& t, size_type pos = npos) const
    noexcept(/* 见描述 */);
constexpr size_type find_last_of(const basic_string& str,
                                    size_type pos = npos) const noexcept;
constexpr size_type find_last_of(const CharT* s, size_type pos, size_type n) const;
constexpr size_type find_last_of(const CharT* s, size_type pos = npos) const;
constexpr size_type find_last_of(CharT c, size_type pos = npos) const noexcept;


template<class T>
    constexpr size_type find_first_not_of(const T& t, size_type pos = 0) const
    noexcept(/* 见描述 */);
constexpr size_type find_first_not_of(const basic_string& str,
                                        size_type pos = 0) const noexcept;
constexpr size_type find_first_not_of(const CharT* s,
                                        size_type pos, size_type n) const;
constexpr size_type find_first_not_of(const CharT* s, size_type pos = 0) const;
constexpr size_type find_first_not_of(CharT c, size_type pos = 0) const noexcept;


template<class T>
    constexpr size_type find_last_not_of(const T& t, size_type pos = npos) const
    noexcept(/* 见描述 */);
constexpr size_type find_last_not_of(const basic_string& str,
                                        size_type pos = npos) const noexcept;
constexpr size_type find_last_not_of(const CharT* s, size_type pos, size_type n) const;
constexpr size_type find_last_not_of(const CharT* s, size_type pos = npos) const;
constexpr size_type find_last_not_of(CharT c, size_type pos = npos) const noexcept;
```

```cpp string的替换 >folded
constexpr basic_string& replace(size_type pos1, size_type n1, const basic_string& str);
constexpr basic_string& replace(size_type pos1, size_type n1, const basic_string& str, size_type pos2, size_type n2 = npos);


template<class T>
    constexpr basic_string& replace(size_type pos1, size_type n1, const T& t);
template<class T>
    constexpr basic_string& replace(size_type pos1, size_type n1, const T& t, size_type pos2, size_type n2 = npos);
constexpr basic_string& replace(size_type pos, size_type n1, const CharT* s, size_type n2);
constexpr basic_string& replace(size_type pos, size_type n1, const CharT* s);
constexpr basic_string& replace(size_type pos, size_type n1, size_type n2, CharT c);
constexpr basic_string& replace(const_iterator i1, const_iterator i2, const basic_string& str);


template<class T>
    constexpr basic_string& replace(const_iterator i1, const_iterator i2, const T& t);
constexpr basic_string& replace(const_iterator i1, const_iterator i2, const CharT* s, size_type n);
constexpr basic_string& replace(const_iterator i1, const_iterator i2, const CharT* s);
constexpr basic_string& replace(const_iterator i1, const_iterator i2, size_type n, CharT c);


template<class InputIt>
    constexpr basic_string& replace(const_iterator i1, const_iterator i2, InputIt j1, InputIt j2);
constexpr basic_string& replace(const_iterator, const_iterator, initializer_list<CharT>);
```

# 希望能对你有所帮助(p_o)
