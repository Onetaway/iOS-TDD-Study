//
//  Person.m
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name avatarLocation:(NSString *)location {
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _avatarURL = [[NSURL alloc] initWithString:location];
    }
    
    return self;
}

@end
