//
//  Question.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _answerSet = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)addAnswer:(Answer *)answer {
    
    [self.answerSet addObject: answer];
}

- (NSArray *)answers {
    return [[self.answerSet allObjects] sortedArrayUsingSelector: @selector(compare:)];
}

@end
