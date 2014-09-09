//
//  QuestionTests.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Question.h"
#import "Answer.h"

@interface QuestionTests : XCTestCase

@property (nonatomic, strong) Question *question;
@property (nonatomic, strong) Answer *lowScore;
@property (nonatomic, strong) Answer *highScore;

@end

@implementation QuestionTests

- (void)setUp {
    [super setUp];
    
    _question = [[Question alloc] init];
    _question.date = [NSDate distantPast];
    _question.title = @"Do iPhones also dream of electric sheep?";
    _question.score = 42;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [_question addAnswer: accepted];
    
    _lowScore = [[Answer alloc] init];
    _lowScore.score = -4;
    [_question addAnswer: _lowScore];
    
    _highScore = [[Answer alloc] init];
    _highScore.score = 4;
    [_question addAnswer: _highScore];
}

- (void)tearDown {
    
    _question = nil;
    _lowScore = nil;
    _highScore = nil;
    
    [super tearDown];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testQuestionHasADate {
    
    Question *question = [[Question alloc] init];
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    
    XCTAssertEqualObjects(question.date, testDate, @"Questions needs to provide its date");
}

- (void)testQuestionKeepScore {
    
    XCTAssertEqual(_question.score, 42, @"Question needs a numeric score");
}

- (void)testQuestionHasATitle {
    
    XCTAssertEqualObjects(_question.title, @"Do iPhones also dream of electric sheep?", @"Question should know its title");
}

- (void)testQuestionCanHaveAnswersAdded {
    
    Answer *myAnswer = [[Answer alloc] init];
    XCTAssertNoThrow([_question addAnswer: myAnswer], @"Must be able to add answers");
}
- (void)testAcceptedAnswerIsFirst {
    
    XCTAssertTrue([[_question.answers objectAtIndex: 0] isAccepted], @"Accepted answer comes first");
}

- (void)testHighScoreAnswerBeforeLow {
    
    NSArray *answers = _question.answers;
    NSInteger highIndex = [answers indexOfObject: _highScore];
    NSInteger lowIndex = [answers indexOfObject: _lowScore];
    XCTAssertTrue(highIndex < lowIndex, @"High-scoring answer comes first");
}

@end










































