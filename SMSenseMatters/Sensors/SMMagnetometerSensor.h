//
//  SMMagnetometerSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"

/**
 *  Sensor for getting magnetometer readings from the device
 */
@interface SMMagnetometerSensor : SMSensor

/**
 *  Initialises the magnetometer sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Magnetometer sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;

@end
