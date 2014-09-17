//
//  Question.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 21/02/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;
@class Person;

/**
 * Represents a question asked on the Stack Overflow website.
 */
@interface Question : NSObject {
    NSMutableSet *answerSet;
}

/**
 * The date on which this question was asked.
 */
@property (retain) NSDate *date;
/**
 * The title of this question.
 */
@property (copy) NSString *title;
/**
 * The body of this question, as an HTML string.
 */
@property (copy) NSString *body;
/**
 * Upvotes received by this question, minus downvotes received.
 */
@property NSInteger score;
/**
 * An ordered collection of answers.
 */
@property (readonly) NSArray *answers;
/**
 * A numeric identifier, relating this question object to its
 * source on the website.
 */
@property NSInteger questionID;
/**
 * The person who asked this question on the website.
 */
@property (retain) Person *asker;
/**
 * Add another answer to this question's collection of answers.
 */
- (void)addAnswer: (Answer *)answer;

@end
