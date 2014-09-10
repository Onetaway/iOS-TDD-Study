iOS 测试
============

###目录

* [定义测试范围](#定义测试范围)
*    [测试性能](#测试性能)
*    [测试应用程序和库](#测试应用程序和库)
*    [XCTest—Xcode的测试框架](#XCTest—Xcode的测试框架)
*    [测试应该从何处开始](#测试应该从何处开始)
*    [断言分类](#断言分类)
      
      * [无条件失败](#无条件失败)
      * [相等性测试](#相等性测试)
      * [为空测试](#为空测试)
      * [布尔型测试](#布尔型测试)
      * [异常测试](#异常测试)

###定义测试范围


###测试性能

###测试应用程序和库
Xcode 提供了两种测试：应用程序测试和库测试

* **应用程序测试**


* **库测试**

###XCTest—Xcode的测试框架
测试


###测试应该从何处开始
当你想要开始创建测试的时候，请记住下面的观点：

* 重点测试和控制器交互的基础构建部分，比如模型(Model)类和方法。

* 另一个可选的入手点是，如果你正在写一个框架或者库，你可能想从你的 API 的表层入手。从表层开始，你可以逐步开发内部的类

###断言分类
下面这部分列出了 `XCTest` 的断言。你可以在 Xcode 中使用 `Quick Help` 在 `XCTestAssertions.h` 中获取更多的关于 `XCTest` 的信息。

####无条件失败
**XCTFail.** 无条件地创建一个失败的测试。

    XCTFail(format...)
    
####相等性测试
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
    

####为空测试

**XCTAssertNil.** 当 `expression` 不为空时，测试失败。

    XCTAssertNil(expression, format...)
    
**XCTAssertNotNil.** 当 `expression` 为空时，测试失败。

    XCTAssertNotNil(expression, format...)
    
####布尔型测试
**XCTAssertTrue.** 当 `expression` 为假时，测试失败。

    XCTAssertTrue(expression, format...)
    
**XCTAssert.** 当 `expression` 为假时，测试失败。和 `XCTAssertTrue` 相同。

    XCTAssert(expression, format...)
    
**XCTAssertFalse.** 当 `expression` 为真时，测试失败。
    
    XCTAssertFalse(expression, format...)
    
    
####异常测试
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













