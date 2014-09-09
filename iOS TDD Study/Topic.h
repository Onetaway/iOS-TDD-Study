//
//  Topic.h
//  iOS TDD Study
//
//  Created by sanlen on 9/5/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface Topic : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSArray *questions;

- (instancetype)initWithName:(NSString *)name tag:(NSString *)tag;
- (NSArray *)recentQuestions;
- (void)addQuestion:(Question *)question;

@end
