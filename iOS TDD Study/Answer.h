//
//  Answer.h
//  iOS TDD Study
//
//  Created by sanlen on 9/9/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Answer : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) Person *person;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign, getter=isAccepted) BOOL accepted;

- (NSComparisonResult)compare:(Answer *)otherAnswer;

@end
