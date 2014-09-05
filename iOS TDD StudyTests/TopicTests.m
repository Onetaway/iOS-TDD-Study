//
//  Topic.m
//  iOS TDD Study
//
//  Created by sanlen on 9/5/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Topic.h"

@interface TopicTests : XCTestCase



@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testTopicExist {
    Topic *newTopic = [[Topic alloc] init];
    XCTAssert(newTopic, @"Should be able to create a new topic");
}

- (void)testThatTopicCanBeNamed {
    Topic *nameTopic = [[Topic alloc] initWithName:@"iPhone"];
    XCTAssertEqualObjects(nameTopic.name, @"iPhone", @"topic's name should have the name iPhone");
}

@end







































