//
//  SMSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"

@interface SMSensor ()



@end

@implementation SMSensor

- (void)sense {
    NSAssert(true, @"Sensor not implemented");
}

+ (BOOL)isAvailable {
    return NO;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super init];
    if (self) {
        _callback = callback;
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        
    }
    return self;
}

@end
