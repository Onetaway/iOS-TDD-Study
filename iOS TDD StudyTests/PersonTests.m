//
//  PersonTests.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Person.h"

@interface PersonTests : XCTestCase

@property (nonatomic, strong) Person *person;

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    
    _person = [[Person alloc] initWithName:@"Peter" avatarLocation:@"http://example.com/avatar.png"];
}

- (void)tearDown {
    
    _person = nil;
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

- (void)testThatPersonHasTheRightName {
    
    XCTAssertEqualObjects(_person.name, @"Peter", @"expecting a person to provide its name");
}

- (void)testThatPersonHasaAnAvatarURL {
    NSURL *url = _person.avatarURL;
    XCTAssertEqualObjects([url absoluteString], @"http://example.com/avatar.png", @"The Person’s avatar should be represented by a URL");
}

@end













