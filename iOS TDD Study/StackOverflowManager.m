//
//  StackOverflowManager.m
//  iOS TDD Study
//
//  Created by sanlen on 9/12/14.
//  Copyright (c) 2014 Onetaway. All rights reserved.
//

#import "StackOverflowManager.h"

@implementation StackOverflowManager

- (void)setDelegate:(id<StackOverflowManagerDelegate>)delegate {
    if (![delegate conformsToProtocol: @protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"object doesn't conform to the protocol" userInfo:nil] raise];
    }
    
    _delegate = delegate;
}

@end
