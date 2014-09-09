//
//  Topic.m
//  iOS TDD Study
//
//  Created by sanlen on 9/5/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic

- (instancetype)initWithName:(NSString *)name tag:(NSString *)tag {
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _tag = [tag copy];
        _questions = [[NSArray alloc] init];
    }
    
    return self;
}

- (NSArray *)recentQuestions {
    
    return [self sortQuestionsLatestFirst:self.questions];
    
}

- (void)addQuestion:(Question *)question {
    
    NSArray *newQuestions = [_questions arrayByAddingObject:question];
    
    if ([newQuestions count] > 20) {
        newQuestions = [self sortQuestionsLatestFirst:newQuestions];
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }
    
    self.questions = newQuestions;
}

- (NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList {
    
    return [questionList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        
        return [q2.date compare:q1.date];
    }];
}

@end





































