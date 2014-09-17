//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Graham J Lee on 14/03/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "QuestionBuilder.h"
#import "AnswerBuilder.h"
#import "Question.h"
#import "Topic.h"

@interface StackOverflowManager ()

- (void)tellDelegateAboutQuestionSearchError: (NSError *)underlyingError;

@end

@implementation StackOverflowManager

@synthesize delegate;
@synthesize communicator;
@synthesize bodyCommunicator;
@synthesize questionBuilder;
@synthesize answerBuilder;
@synthesize questionToFill;
@synthesize questionNeedingBody;

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate && ![newDelegate conformsToProtocol: @protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException reason: @"Delegate object does not conform to the delegate protocol" userInfo: nil] raise];
    }
    delegate = newDelegate;
}

#pragma mark Questions

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    [communicator searchForQuestionsWithTag: [topic tag]];
}

- (void)fetchBodyForQuestion: (Question *)question {
    self.questionNeedingBody = question;
    [bodyCommunicator downloadInformationForQuestionWithID: question.questionID];
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
    NSError *error = nil;
    NSArray *questions = [questionBuilder questionsFromJSON: objectNotation error: &error];
    if (!questions) {
        [self tellDelegateAboutQuestionSearchError: error];
    }
    else {
        [delegate didReceiveQuestions: questions];
    }
}

- (void)receivedQuestionBodyJSON:(NSString *)objectNotation {
    [questionBuilder fillInDetailsForQuestion: self.questionNeedingBody fromJSON: objectNotation];
    [delegate bodyReceivedForQuestion: self.questionNeedingBody];
    self.questionNeedingBody = nil;
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    [self tellDelegateAboutQuestionSearchError: error];
}

- (void)fetchingQuestionBodyFailedWithError:(NSError *)error {
    NSDictionary *errorInfo = nil;
    if (error) {
        errorInfo = [NSDictionary dictionaryWithObject: error forKey: NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError errorWithDomain: StackOverflowManagerError code: StackOverflowManagerErrorQuestionBodyFetchCode userInfo:errorInfo];
    [delegate fetchingQuestionBodyFailedWithError: reportableError];
    self.questionNeedingBody = nil;
}

#pragma mark Answers

- (void)fetchAnswersForQuestion:(Question *)question {
    self.questionToFill = question;
    [communicator downloadAnswersToQuestionWithID: question.questionID];
}

- (void)fetchingAnswersFailedWithError:(NSError *)error {
    self.questionToFill = nil;
    NSDictionary *userInfo = nil;
    if (error) {
        userInfo = [NSDictionary dictionaryWithObject: error forKey: NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError errorWithDomain: StackOverflowManagerError code:StackOverflowManagerErrorAnswerFetchCode userInfo: userInfo];
    [delegate retrievingAnswersFailedWithError: reportableError];
}

- (void)receivedAnswerListJSON: (NSString *)objectNotation {
    NSError *error = nil;
    if ([self.answerBuilder addAnswersToQuestion: self.questionToFill fromJSON: objectNotation error: &error]) {
        [delegate answersReceivedForQuestion: self.questionToFill];
        self.questionToFill = nil;
    }
    else {
        [self fetchingAnswersFailedWithError: error];
    }
}


#pragma mark Class Continuation
- (void)tellDelegateAboutQuestionSearchError:(NSError *)underlyingError {
    NSDictionary *errorInfo = nil;
    if (underlyingError) {
        errorInfo = [NSDictionary dictionaryWithObject: underlyingError forKey: NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError errorWithDomain: StackOverflowManagerError code: StackOverflowManagerErrorQuestionSearchCode userInfo: errorInfo];
    [delegate fetchingQuestionsFailedWithError:reportableError];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";
