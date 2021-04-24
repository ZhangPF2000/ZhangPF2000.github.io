---
title: 01_cpp_返回字符串中的最大值和最小值
toc: true
recommend: 1
keywords: 返回字符串中的最大值和最小值
uniqueId: '2021-04-24 02:05:13/01_cpp_返回字符串中的最大值和最小值.html'
mathJax: false
date: 2021-04-24 10:05:13
thumbnail:
tags:
  - codewars
  - cpp
categories:
  - codewars
  - cpp
---

> [题目链接](https://www.codewars.com/kata/554b4ac871d6813a03000035/cpp)
> 内容介绍:

```text
In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.

Example:

highAndLow("1 2 3 4 5");  // return "5 1"
highAndLow("1 2 -3 4 5"); // return "5 -3"
highAndLow("1 9 3 4 -5"); // return "9 -5"

Notes:

    All numbers are valid Int32, no need to validate them.
    There will always be at least one number in the input string.
    Output string must be two numbers separated by a single space, and highest number is first.
```

<!-- more -->

> 我的解决方案
>
> - for 循环遍历字符串中的每个字符
> - 通过判断将字符组成新的字符串(数字字符串)
> - 把这些数字字符串放入容器 vector 中
> - 依次弹出容器中的字符串,转换成数字
> - 进行数字比较,确定最小值和最大值
> - 返回最大值和最小值
>   我的提交代码如下

```cpp 我的解决方案 >folded
#include <string>
#include <vector>

int test(std::string s)
{
    bool tag = true;
    int num = 0;
    /* code */
    for (size_t i = 0; i < s.length(); i++)
    {
        /* code */
        if (s[i] == '-')
        {
            tag = false;
            continue;
        }
        num = num * 10 + (s[i] - 48);
    }
    num = tag ? num : num * -1;
    return num;
}

std::string highAndLow(const std::string& numbers){
    //your code here
    int num = 0;
    int num_min = 0, num_max = 0;
    std::vector<std::string> vs;
    std::string str = "";
    for (size_t i = 0; i <= numbers.length(); i++)
    {
        if (numbers[i] != ' ' && (numbers[i] == '-' || (48 <= numbers[i] && numbers[i] <= 57)))
        {
            str = str + numbers[i];
        }
        else if (numbers[i] == ' ' || numbers[i] == '\0')
        {
            vs.push_back(str);
            str = "";
        }
        else
        {
            str = "";
            continue;
        }
    }

    std::string s1 = "", s2 = "";
    num_max = num_min = test(vs[0]);
    for (size_t i = 0; i < vs.size(); i++)
    {
        num = test(vs[i]);
        std::cout << "num = " << num << std::endl;
        s1 = ((num <= num_min) ? vs[i] : s1);
        s2 = ((num >= num_max) ? vs[i] : s2);
        num_min = ((num < num_min) ? num : num_min);
        num_max = ((num > num_max) ? num : num_max);
        num = 0;
    }
    str = s2 + ' ' + s1;

    return str;
}
```

> 我的方案还是不好,代码篇幅太大
> 空间时间复杂度都比较高
> 思路没有问题,但是还可以再优化

```cpp 优化方案 >folded
#include <limits>
#include <string>

int test(std::string s)
{
    bool tag = true;
    int num = 0;
    /* code */
    for (size_t i = 0; i < s.length(); i++)
    {
        /* code */
        if (s[i] == '-')
        {
            tag = false;
            continue;
        }
        num = num * 10 + (s[i] - 48);
    }
    num = tag ? num : num * -1;
    return num;
 }

std::string highAndLow(std::string numbers)
{
    //your code here
    int num = 0;
    int num_min = std::numeric_limits<int>::max(), num_max = std::numeric_limits<int>::min();
    // 这个是让num_min=int范围内的最大值,num_max=int范围内的最小值
    std::string str = "";
    std::string s1 = "", s2 = "";


    for (size_t i = 0; i <= numbers.length(); i++)
    {
        if (numbers[i] != ' ' && (numbers[i] == '-' || (48 <= numbers[i] && numbers[i] <= 57)))
        {
            str = str + numbers[i];
        }
        else if (numbers[i] == ' ' || numbers[i] == '\0')
        {
            num = test(str);
            s1 = ((num <= num_min) ? str : s1);
            s2 = ((num >= num_max) ? str : s2);
            num_min = ((num < num_min) ? num : num_min);
            num_max = ((num > num_max) ? num : num_max);
            str="";
        }
        else
        {
            str = "";
            continue;
        }
    }
    str = s2 + ' ' + s1;
    return str;
}
```

> 上面这个解决方案中
> 舍弃了容器,直接让确定的数字字符串转换成数字返回
> 然后进行比较
> 不过这个使用了`<limits>`这个头文件
> 是为了让比较的初始值为最大(num_min)和最小(num_max)
> 防止出现无法比较的情况,这个方案就比上面那个要好很多了

---

# 大佬的解决方案

```cpp 大佬的解决方案
#include <string>
#include <sstream>
#include <limits>

std::string highAndLow(const std::string& numbers){
  std::stringstream ss(numbers);
  int temp, min = std::numeric_limits<int>::max(), max = std::numeric_limits<int>::min();
  while (ss >> temp) {
    min = (temp < min) ? temp : min;
    max = (temp > max) ? temp : max;
  };
  return std::to_string(max) + " " + std::to_string(min);
}

/**
 * 这里主要是使用了#include <sstring>头文件
 * 以下是我的对sstring的推测
 * 头文件中的stream是流的意思
 * 常见的有iostream(标准输入输出流),和fstream(文件输入输出流)
 * iostream中有istream和ostream两个常见的类
 * fstream中有fstream,ifstream,ofstream三个类(常见的)
 * 推测sstream是字符串流处理,专门处理字符串流的
 * sstream有stringstream,istringstream和ostringstream三个类
 * 用法和上面的fstream差不多,也支持`>>`和`<<`运算符
 *
 * 上面大佬的解决思路大致就是
 * 把传入的字符串传入字符串流ss中,
 * ss >> temp是把字符串流中的数据输入到temp(int类型)中
 * 然后进行比较判断,最后把最大数和最小数转换成字符串
 *
 * `>>` 这个具有和std::cin >> test差不多的特性
 * 输入空格后就停止,然后进行下一个
*/
```

## 学到的知识点

> `#include <sstring>`  
> `#include <limits>`  
> 主要是`sstring`头文件,以后可以方便的处理字符串数据
> 可以多了解了解这个头文件中的类,函数
> `sstring`举例

```cpp sstring例子
#include <string>
#include <sstream>
#include <iostream>

int main()
{
    std::stringstream stream;
    std::string result;
    int i = 1000;
    stream << i; //将int输入流
    stream >> result; //从stream中抽取前面插入的int值
    std::cout << result << std::endl; // print the string "1000"
}
```

# 希望能对你有所帮助(p_o)
