//
//  Question.h
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;

@interface Question : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, strong) NSMutableSet *answerSet;
@property (nonatomic, strong) NSArray *answers;

- (void)addAnswer:(Answer *)answer;

@end
