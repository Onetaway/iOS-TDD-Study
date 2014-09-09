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

@property (nonatomic, strong) Topic *topic;

@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    
    _topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
}

- (void)tearDown {
    _topic = nil;
    
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
    XCTAssertNotNil(_topic, @"Should be able to create a new topic instance");
}

- (void)testThatTopicCanBeNamed {
    XCTAssertEqualObjects(_topic.name, @"iPhone", @"The Topic instance should have the name I gave it");
}

- (void)testThatTopicHasTag {
    XCTAssertEqualObjects(_topic.name, @"iPhone", @"The Topic instance should have a tag.");
}

- (void)testForAListOfQuestions {
    
}

@end







































