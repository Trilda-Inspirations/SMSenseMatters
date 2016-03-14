//
//  SMAccelerometerSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMAccelerometerSensor.h"
#import "SM3DMotionSensorData.h"

const float SMACCELEROMETER_DEFAULT_INTERVAL = .2;

@interface SMAccelerometerSensor ()

/**
 *  Instance of the motion manager to read data from
 */
@property (nonatomic, strong) CMMotionManager *motionManager;

/**
 *  Latest data received from the sensor
 */
@property (atomic, strong) SM3DMotionSensorData *currentData;


/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation SMAccelerometerSensor


+ (BOOL)isAvailable {
    CMMotionManager *manager = [[CMMotionManager alloc] init];
    return manager.isAccelerometerAvailable;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _motionManager = [[CMMotionManager alloc] init];
        _operationQueue = [[NSOperationQueue alloc] init];
        _currentData = [[SM3DMotionSensorData alloc] initWithX:0 y:0 z:0];
        [_motionManager startAccelerometerUpdatesToQueue:_operationQueue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            if (!error && accelerometerData) {
                CMAcceleration acceleration = accelerometerData.acceleration;
                self.currentData.xAxis = acceleration.x;
                self.currentData.yAxis = acceleration.y;
                self.currentData.zAxis = acceleration.z;
                self.currentData.dateSensed = [NSDate date];
                [self sense];
            } else if (error) {
                NSLog(@"Error: %@", error);
            }
        }];
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        _motionManager.deviceMotionUpdateInterval = secs;
        _motionManager.accelerometerUpdateInterval = secs;
    }
    return self;
}

- (void)sense {
    if (self.callback)
        self.callback(_currentData);
}

@end
