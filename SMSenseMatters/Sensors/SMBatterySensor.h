//
//  SMBatterySensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"

/**
 *  A sensor for reading battery information
 */
@interface SMBatterySensor : SMSensor


/**
 *  Initialises the battery sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Battery sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;

@end
