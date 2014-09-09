//
//  Topic.m
//  iOS TDD Study
//
//  Created by sanlen on 9/5/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "Topic.h"

@implementation Topic

- (instancetype)initWithName:(NSString *)name tag:(NSString *)tag
{
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _tag = [tag copy];
    }
    
    return self;
}

@end
