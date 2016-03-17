//
//  SMStepSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"

/**
 *  A sensor for detecting the number of steps that a user has made
 */
@interface SMStepSensor : SMSensor

/**
 *  Initialises the step sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Step sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;


@end
