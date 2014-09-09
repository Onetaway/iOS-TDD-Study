//
//  Person.h
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *avatarURL;

- (instancetype)initWithName:(NSString *)name avatarLocation:(NSString *)location;

@end
