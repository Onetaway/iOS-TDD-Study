//
//  Answer.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "Answer.h"

@implementation Answer

- (NSComparisonResult)compare:(Answer *)otherAnswer
{
    if (self.accepted && !(otherAnswer.accepted)) {
        
        return NSOrderedAscending;
        
    } else if (!self.accepted && otherAnswer.accepted) {
    
        return NSOrderedDescending;
    }
    
    if (self.score > otherAnswer.score) {
        return NSOrderedAscending;
    } else if (self.score < otherAnswer.score) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@end
