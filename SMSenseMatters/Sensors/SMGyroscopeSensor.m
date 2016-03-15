//
//  SMGyroscopeSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMGyroscopeSensor.h"


const float SMGYROSCOPE_DEFAULT_INTERVAL = .2;

@interface SMGyroscopeSensor ()

/**
 *  Motion manager to get gyroscope information from
 */
@property (nonatomic, strong) CMMotionManager *motionManager;


/**
 *  Latest data received from the sensor
 */
@property (atomic, strong) SM3DMotionSensorData *currentData;

@end

@implementation SMGyroscopeSensor

+ (BOOL)isAvailable {
    CMMotionManager *manager = [[CMMotionManager alloc] init];
    return manager.isGyroAvailable;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _motionManager = [[CMMotionManager alloc] init];
        _motionManager.gyroUpdateInterval = SMGYROSCOPE_DEFAULT_INTERVAL;
        _currentData = [[SM3DMotionSensorData alloc] initWithX:0 y:0 z:0];
        [_motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            if (!error && gyroData) {
                _currentData.xAxis = gyroData.rotationRate.x;
                _currentData.yAxis = gyroData.rotationRate.y;
                _currentData.zAxis = gyroData.rotationRate.z;
                _currentData.dateSensed = [NSDate date];
            }
        }];
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        _motionManager.deviceMotionUpdateInterval = secs;
        _motionManager.gyroUpdateInterval = secs;
    }
    return self;
}

- (void)sense {
    if (self.callback)
        self.callback(_currentData);
}

@end
