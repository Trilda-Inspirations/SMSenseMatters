//
//  SMSenseMatters.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSenseMatters.h"

@implementation SMSenseMatters



- (void)performBackgroundTasks {
    NSLog(@"=== Background Tasks ===");
}



+ (id)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

@end
