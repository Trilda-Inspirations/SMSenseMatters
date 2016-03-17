//
//  SMMagnetometerSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMMagnetometerSensor.h"
#import "SM3DMotionSensorData.h"
#import <CoreMotion/CoreMotion.h>

@interface SMMagnetometerSensor ()

/**
 *  Motion manager for getting the data from
 */
@property (nonatomic, strong) CMMotionManager *manager;

/**
 *  Last x coordinate
 */
@property (nonatomic) double lastX;

/**
 *  Last y coordinate
 */
@property (nonatomic) double lastY;

/**
 *  Last z coordinate
 */
@property (nonatomic) double lastZ;

/**
 *  Operation queue for receiving the information periodically to
 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation SMMagnetometerSensor

+ (BOOL)isAvailable {
    return [[[CMMotionManager alloc] init] isMagnetometerAvailable];
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _manager = [[CMMotionManager alloc] init];
        _queue = [[NSOperationQueue alloc] init];
        [_manager startMagnetometerUpdatesToQueue:_queue withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
            _lastX = magnetometerData.magneticField.x;
            _lastY = magnetometerData.magneticField.y;
            _lastZ = magnetometerData.magneticField.z;
            [self sense];
        }];
        
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        _manager.magnetometerUpdateInterval = secs;
    }
    return self;
}

- (void)sense {
    if (self.callback) {
        SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:_lastX y:_lastY z:_lastZ];
        self.callback(data);
    }
}

@end
