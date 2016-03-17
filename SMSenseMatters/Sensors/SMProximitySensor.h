//
//  SMProximitySensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"
#import <UIKit/UIKit.h>

/**
 *  A sensor for detecting whether an object is close to the front of the device
 */
@interface SMProximitySensor : SMSensor

/**
 *  Initialises the proximity sensor with specified callback and repeat time interval
 *
 *  @param callback callback for data
 *  @param secs     seconds between sensing
 *
 *  @return Proximity sensor
 */
- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;

@end
