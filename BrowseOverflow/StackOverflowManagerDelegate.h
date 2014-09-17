//
//  StackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 14/03/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Topic;
@class Question;

/**
 * The delegate protocol for the StackOverflowManager class.
 *
 * StackOverflowManager uses this delegate protocol to indicate when information becomes available, and to ask about doing further processing.
 */
@protocol StackOverflowManagerDelegate <NSObject>

/**
 * The manager was unable to retrieve questions from Stack Overflow.
 */
- (void)fetchingQuestionsFailedWithError: (NSError *)error;

/**
 * The manager retrieved a list of questions from Stack Overflow.
 */
- (void)didReceiveQuestions: (NSArray *)questions;

/**
 * The manager couldn't fetch a question body.
 */
- (void)fetchingQuestionBodyFailedWithError: (NSError *)error;

/**
 * The manager couldn't get answers to a question.
 */
- (void)retrievingAnswersFailedWithError: (NSError *)error;

/**
 * The manager got a list of answers to a question.
 */
- (void)answersReceivedForQuestion: (Question *)question;

/**
 * The manager got the body of a question.
 */
- (void)bodyReceivedForQuestion: (Question *)question;

@end
