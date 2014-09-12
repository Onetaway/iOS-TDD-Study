//
//  StackOverflowManager.h
//  iOS TDD Study
//
//  Created by sanlen on 9/12/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowManager : NSObject

@property (nonatomic, weak) id<StackOverflowManagerDelegate> delegate;

@end
