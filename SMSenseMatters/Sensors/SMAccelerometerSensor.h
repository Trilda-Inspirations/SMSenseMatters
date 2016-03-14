//
//  SMAccelerometerSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

/**
 *  A sensor for reading accelerometer information from the device
 *
 *  The data returned from this sensor is in the form of the SM3DMotionSensorData class.
 */
@interface SMAccelerometerSensor : SMSensor


/**
 *  Initialises the accelerometer sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Accelerometer sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;

@end
