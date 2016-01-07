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

@property (nonatomic, strong) CMMotionManager *manager;

@property (nonatomic) double lastX;
@property (nonatomic) double lastY;
@property (nonatomic) double lastZ;

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
        }];
        
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
