//
//  Topic.h
//  iOS TDD Study
//
//  Created by sanlen on 9/5/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *tag;

- (instancetype)initWithName:(NSString *)name tag:(NSString *)tag;

@end
