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
#import "Question.h"

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
    XCTAssertTrue([[_topic recentQuestions] isKindOfClass: [NSArray class]], @"Topics should provide a list of recent questions");
}

- (void)testForInitiallyEmptyQuestionList {
    XCTAssertEqual([[_topic recentQuestions] count], (NSUInteger)0, @"No questions added yet, count should be zero");
}

- (void)testAddingAQuestionToTheList {
    Question *question = [[Question alloc] init];
    [_topic addQuestion:question];
    XCTAssertEqual([[_topic recentQuestions] count], (NSUInteger)1, @"Add a question, and the count of questions should go up");
}

- (void)testQuestionsAreListedChronologically {
    
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantPast];

    [self.topic addQuestion:q1];
    [self.topic addQuestion:q2];
    
    NSArray *questions = [self.topic recentQuestions];
    Question *listedFirst = questions[0];
    Question *listedSecond = questions[1];
    
    XCTAssertEqualObjects([listedFirst.date laterDate:listedSecond.date], listedFirst.date, @"The later question should appear first in the list");
}

- (void)testLimitOfTwentyQuestions {
    Question *q1 = [[Question alloc] init];
    
    for (int i = 0; i < 30; i++) {
        [self.topic addQuestion:q1];
    }
    
    XCTAssertTrue([[self.topic recentQuestions] count] < 21, @"There should never be more than twenty questions");
}

@end







































