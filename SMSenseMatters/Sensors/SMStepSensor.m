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

@property (nonatomic, strong) NSDate *dateStarted;
@property (nonatomic, strong) CMPedometer *pedometer;
@property (nonatomic) int numberOfSteps;

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

- (void)sense {
    if (self.callback)
        self.callback([[SMStepsData alloc] initWithNumberOfSteps:_numberOfSteps]);
}

@end
