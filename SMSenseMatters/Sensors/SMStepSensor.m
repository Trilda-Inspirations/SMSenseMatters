//
//  SMStepSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMStepSensor.h"
#import "SMStepsData.h"
#import <CoreMotion/CoreMotion.h>

@interface SMStepSensor ()

/**
 *  Date for when this sensor was started
 */
@property (nonatomic, strong) NSDate *dateStarted;

/**
 *  Pedometer sensor
 */
@property (nonatomic, strong) CMPedometer *pedometer;

/**
 *  Number of steps taken in total
 */
@property (nonatomic) int numberOfSteps;

/**
 *  Timer for repeat scheduling
 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SMStepSensor

+ (BOOL)isAvailable {
    return [CMPedometer isStepCountingAvailable];
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _numberOfSteps = 0;
        _dateStarted = [NSDate new];
        _pedometer = [[CMPedometer alloc] init];
        [_pedometer startPedometerUpdatesFromDate:_dateStarted withHandler:^(CMPedometerData *pedometerData, NSError *error) {
            _numberOfSteps = [pedometerData.numberOfSteps intValue];
        }];
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:secs target:self selector:@selector(sense) userInfo:nil repeats:YES];
        [_timer fire];
    }
    return self;
}

- (void)sense {
    if (self.callback)
        self.callback([[SMStepsData alloc] initWithNumberOfSteps:_numberOfSteps]);
}

@end
