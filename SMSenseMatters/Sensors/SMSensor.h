//
//  SMSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSensorData.h"

/**
 *  Block for receiving sensor data
 *
 *  @param senseData Data
 */
typedef void (^SenseCallback)(SMSensorData *senseData);

/**
 *  A generic sensor.
 *
 *  (Should not be instantiated directly)
 */
@interface SMSensor : NSObject

/**
 *  The callback to provide the data back to after each sense is made
 */
@property (nonatomic, readonly, copy) SenseCallback callback;

/**
 *  Requests data to be sent from the sensor to the callback as soon as it's available
 */
- (void)sense;


/**
 *  Checks whether the sensor is available at runtime
 *
 *  @return Sensor available
 */
+ (BOOL)isAvailable;


/**
 *  Initialises an SMSensor with specified callback. 
 *
 *  **Note: ** This class can not be instantiated from outside this library. Use the relevant subclasses for a particular sensor
 *
 *  @param callback Callback to send the data to
 *
 *  @return SMSensor Instance
 */
- (id)initWithSenseCallback:(SenseCallback)callback;

@end
