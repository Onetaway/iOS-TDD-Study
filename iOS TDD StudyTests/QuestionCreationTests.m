//
//  QuestionCreationTests.m
//  iOS TDD Study
//
//  Created by sanlen on 9/12/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "StackOverflowManager.h"

@interface QuestionCreationTests : XCTestCase

@property (nonatomic, strong) StackOverflowManager *mgr;

@end

@implementation QuestionCreationTests

- (void)setUp {
    [super setUp];
    
    _mgr = [[StackOverflowManager alloc] init];
}

- (void)tearDown {
    
    _mgr = nil;
    
    [super tearDown];
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testNonConformingObjectCannotBeDelegate {
    
    XCTAssertThrows(self.mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null], @"NSNull should not be used as the delegate as doesn't comform to the delegate protocol.");
}

- (void)testConformingObjectCanBeDelegate {
    id<StackOverflowManagerDelegate> delegate = [[MockStackOverFlowManagerDelegate alloc] init];
    
    
    XCTAssertNoThrow(self.mgr = delegate, @"object conforming to delegate protocol ccan be used as the delegate");
}

- (void)testManagerAcceptsNilAsADelegate {
    XCTAssertNoThrow(self.mgr = nil, @"It should be accept to use nil as a delegate");
}

@end


































