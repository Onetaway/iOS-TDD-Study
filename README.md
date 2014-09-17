iOS 测试
============

###目录

* [如何编写单元测试](#如何编写单元测试)
* [定义测试范围](#定义测试范围)
* [测试性能](#测试性能)
* [测试应用程序和库](#测试应用程序和库)
* [XCTest—Xcode的测试框架](#XCTest—Xcode的测试框架)
* [测试应该从何处开始](#测试应该从何处开始)
* [断言分类](#断言分类)
      
      * [无条件失败](#无条件失败)
      * [相等性测试](#相等性测试)
      * [为空测试](#为空测试)
      * [布尔型测试](#布尔型测试)
      * [异常测试](#异常测试)

* [TDD设计准则](#TDD设计准则)

##如何编写单元测试
1. 前提。在编写单元测试中，首先要记住的是***识别出你的程序需要做什么***。在我知道我需要什么之后，我就能够决定我需要什么样的代码来实现我的需求。这些代码将会成为测试的主体。
2. ***用已知的输入运行代码***。单元测试的一个重要的特性就是它应当是可重复的。无论何时，也无论在什么计算机上，如果测试代码正确，它就应该通过，否则就应该失败。
3. ***观察期望得到的结果***。
4. ***校验结果***
5. ***重构***





##定义测试范围


##测试性能

##测试应用程序和库
Xcode 提供了两种测试：应用程序测试和库测试

* **应用程序测试**


* **库测试**

##XCTest—Xcode的测试框架
测试


##测试应该从何处开始
当你想要开始创建测试的时候，请记住下面的观点：

* 重点测试和控制器交互的基础构建部分，比如模型(Model)类和方法。

* 另一个可选的入手点是，如果你正在写一个框架或者库，你可能想从你的 API 的表层入手。从表层开始，你可以逐步开发内部的类

##断言分类
下面这部分列出了 `XCTest` 的断言。你可以在 Xcode 中使用 `Quick Help` 在 `XCTestAssertions.h` 中获取更多的关于 `XCTest` 的信息。

###无条件失败
**XCTFail.** 无条件地创建一个失败的测试。

    XCTFail(format...)
    
###相等性测试
**XCTAssertEqualObjects.** 当 `expression1` 不等于 `expression2`(或者一个对象为空，而另一个对象不为空)的时候，测试会失败。

    XCTAssertEqualObjects(expression1, expression2, format...)
    
**XCTAssertNotEqualObjects.** 当 `expression1` 等于 `expression2` 的时候，测试会失败。

    XCTAssertNotEqualObjects(expression1, expression2, format...)
    
**XCAssertEqual.** 当 `expression1` 不等于 `expression2` 的时候，测试会失败。这个测试适用于 C 语言的标量类型。

    XCTAssertEqual(expression1, expression2, format...)
    
**XCTAssertNotEqual.** 当 `expression1` 等于 `expression2` 的时候，测试会失败。这个测试适用于 C 语言的标量类型。

    XCTAssertNotEqual(expression1, expression2, format...)
    
**XCTAssertEqualWithAccuracy.** 当 `expression1` 和 `expression2` 之间的差异大于 `accuracy` 的时候，测试会失败。该测试主要用于 `float` 和 `double` 这样的标量类型，但可以用于所有的标量类型。使用情形是两个项目之间的细微的差别能使得他们不是完全相等。

    XCTAssertEqualWithAccuracy(expression1, expression2, accuracy, format...)

**XCTAssertNotEqualWithAccuracy.** 当 `expression1` 和 `expression2` 之间的差异小于或等于 `accuracy` 的时候，测试会失败。该测试主要用于 `float` 和 `double` 这样的标量类型，但可以用于所有的标量类型。使用情形是两个项目之间的细微的差别能使得他们不是完全相等。

    XCTAssertNotEqualWithAccuracy(expression1, expression2, accuracy, format...)
    
**XCTAssertGreaterThan.** 当 `expression1` 小于或等于 `expression2` 的时候，测试会失败。该测试用于标量值。

    XCTAssertGreaterThan(expression1, expression2, format...)
    
**XCTAssertGreaterThanOrEqual.** 当 `expression1` 小于 `expression2` 的时候，测试会失败。该测试用于标量值。

    XCTAssertGreaterThanOrEqual(expression1, expression2, format...)
    
**XCTAssertLessThan.** 当 `expression1` 大于或等于 `expression2` 的时候，测试会失败。该测试用于标量值。

    XCTAssertLessThan(expression1, expression2, format...)
    
**XCTAssertLessThanOrEqual.** 当 `expression1` 大于 `expression2` 的时候，测试会失败。该测试用于标量值。

    XCTAssertLessThanOrEqual(expression1, expression2, format...)
    

###为空测试

**XCTAssertNil.** 当 `expression` 不为空时，测试失败。

    XCTAssertNil(expression, format...)
    
**XCTAssertNotNil.** 当 `expression` 为空时，测试失败。

    XCTAssertNotNil(expression, format...)
    
###布尔型测试
**XCTAssertTrue.** 当 `expression` 为假时，测试失败。

    XCTAssertTrue(expression, format...)
    
**XCTAssert.** 当 `expression` 为假时，测试失败。和 `XCTAssertTrue` 相同。

    XCTAssert(expression, format...)
    
**XCTAssertFalse.** 当 `expression` 为真时，测试失败。
    
    XCTAssertFalse(expression, format...)
    
    
###异常测试
**XCTAssertThrows.** 当 `expression` 没有抛出异常的时候，测试会失败。

    XCTAssertThrows(expression, format...)
    
**XCTAssertThrowsSpecific.** 当 `expression` 没有抛出指定的类的异常时，测试会失败。

    XCTAssertThrowsSpecific(expression, exception_class, format...)
    
**XCTAssertThrowsSpecificNamed.** 当 `expression` 没有抛出指定的类的指定名字的异常的时候，测试会失败。这对像 `AppKit` 或者 `Foundation` 框架中抛出一般的指定名字的 `NSException` (`NSInvalidArgumentException`等等) 很有用。

    XCTAssertThrowsSpecificNamed(expression, exception_class, exception_name, format...)
    
**XCTAssertNoThrow.** 当 `expression` 抛出了异常的时候，测试会失败。

    XCTAssertNoThrow(expression, format...)
    
**XCTAssertNoThrowSpecific.** 当 `expression` 抛出了指定的类的异常的时候，测试会失败。任何其他类的异常都是可以的，也就是说，抛出其他类的异常不会使得测试失败。

    XCTAssertNoThrowSpecific(expression, exception_class, format...)
    
**XCTAssertNoThrowSpecificNamed.** 当 `expression` 抛出指定的类的指定名字的异常的时候，测试会失败。这对像 `AppKit` 或者 `Foundation` 框架中抛出一般的指定名字的 `NSException` (`NSInvalidArgumentException`等等) 很有用。

    XCTAssertNoThrowSpecificNamed(expression, exception_class, exception_name, format...)


##TDD设计准则

###依据接口进行设计，不要依据实现设计
不管什么时候，你在一个 TDD 项目中编写测试，你就是在设计被测试的某个类的一部分：创建时需要什么，它的 API 应该如何被使用以及当它的 API 被调用时，该类如何响应。

在 TDD 中面向接口设计的最主要的好处就是，在复杂的系统上可以很容易的替换对 fake 和 mock 对象的依赖。

像这样的对象和对像合作者的实现之间相互独立的方式，在苹果的框架中广泛使用，这是通过协议实现的。

代理并不是依据接口设计的唯一方式。事实上，任何类想要和其他类通信时，都可以使用这种技术。

###陈述，不要询问

###小的，专一的类和方法
快速回顾一下 BrowseOverflow 的源代码我们发现，在 app 中最长的函数的代码大约是 35 行。大多数的函数都是 10 行或者更少。将视野放的更大些，大多数的类只声明了很少的方法和属性。

这种由 TDD 带来的小函数，高内聚的类的代码组织形式，是我们应该遵循的法则。

###封装



###只在一处使用要比在多处复用好
尽管前面提到的许多设计准则很多时候将重点放在了，创建的类在不同的实现里可以交换或者在多个上下文中可以复用。但是最重要的因素是类只用在 app 中的唯一的上下文中。

###测试并发代码
测试那些在`后台`运行的代码是困难的——因为它们可能在任意的线程上，并且不在 UI 或是主线程上。



###继承关系应当是宽的、浅的






































