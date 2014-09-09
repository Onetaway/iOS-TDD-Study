//
//  AnswerTests.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Answer.h"
#import "Person.h"

@interface AnswerTests : XCTestCase

@property (nonatomic, strong) Answer *answer;
@property (nonatomic, strong) Answer *otherAnswer;

@end

@implementation AnswerTests

- (void)setUp {
    [super setUp];
    
    _answer = [[Answer alloc] init];
    _answer.text = @"The answer is 42";
    _answer.person = [[Person alloc] initWithName: @"Graham Lee"
                                   avatarLocation: @"http://example.com/avatar.png"];
    _answer.score = 42;
    
    _otherAnswer = [[Answer alloc] init];
    _otherAnswer.text = @"I have the answer you need";
    _otherAnswer.score = 42;
}

- (void)tearDown {
    
    _answer = nil;
    
    [super tearDown];
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testAnswerHasSomeText {
    
    XCTAssertEqualObjects(self.answer.text, @"The answer is 42", @"Answers need to contain some text");
}

- (void)testSomeoneProvidedTheAnswer {
    
    XCTAssertTrue([self.answer.person isKindOfClass: [Person class]], @"A Person gave this Answer");
}

- (void)testAnswersNotAcceptedByDefault {
    XCTAssertFalse(self.answer.accepted, @"Answer not accepted by default");
}

- (void)testAnswerCanBeAccepted {
    XCTAssertNoThrow(self.answer.accepted = YES, @"It is possible to accept an answer");
}

- (void)testAnswerHasAScore {
    
    XCTAssertTrue(self.answer.score == 42, @"Answer's score can be retrieved");
}

- (void)testAcceptedAnswerComesBeforeUnaccepted {
    
    _otherAnswer.accepted = YES;
    _otherAnswer.score = _answer.score + 10;
    
    XCTAssertEqual([_answer compare: _otherAnswer], NSOrderedDescending, @"Accepted answer should come first");
    XCTAssertEqual([_otherAnswer compare: _answer], NSOrderedAscending, @"Unaccepted answer should come last");
}

- (void)testAnswersWithEqualScoresCompareEqually {
    
    XCTAssertEqual([_answer compare: _otherAnswer], NSOrderedSame, @"Both answers of equal rank");
    XCTAssertEqual([_otherAnswer compare: _answer], NSOrderedSame, @"Each answer has the same rank");
}

- (void)testLowerScoringAnswerComesAfterHigher {
    
    _otherAnswer.score = _answer.score + 10;
    
    XCTAssertEqual([_answer compare: _otherAnswer], NSOrderedDescending,
                   @"Higher score comes first");
    XCTAssertEqual([_otherAnswer compare: _answer], NSOrderedAscending, @"Lower score comes last");
}

@end










