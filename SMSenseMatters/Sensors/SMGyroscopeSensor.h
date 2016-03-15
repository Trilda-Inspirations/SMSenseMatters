//
//  SMGyroscopeSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <SMSenseMatters/SMSenseMatters.h>

/**
 *  A sensor for reading from the Gyroscope
 */
@interface SMGyroscopeSensor : SMSensor


/**
 *  Initialises the gyroscope sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Gyroscope sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;

@end
