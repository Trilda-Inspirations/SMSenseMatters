//
//  SMSenseMatters.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef SMSENSEMATTERS_H
#define SMSENSEMATTERS_H

// sensors
#import <SMSenseMatters/SMSensor.h>
#import <SMSenseMatters/SMAccelerometerSensor.h>
#import <SMSenseMatters/SMGyroscopeSensor.h>
#import <SMSenseMatters/SMBatterySensor.h>
#import <SMSenseMatters/SMProximitySensor.h>
#import <SMSenseMatters/SMStepSensor.h>
#import <SMSenseMatters/SMMagnetometerSensor.h>
#import <SMSenseMatters/SMBluetoothDiscoverySensor.h>

// data structures
#import <SMSenseMatters/SMSensorData.h>
#import <SMSenseMatters/SM3DMotionSensorData.h>
#import <SMSenseMatters/SMBatteryData.h>
#import <SMSenseMatters/SMProximityData.h>
#import <SMSenseMatters/SMStepsData.h>

#endif

/**
 *  **SenseMatters**
 *
 *  A library for accessing the sensors on an iOS device in a unified way
 */
@interface SMSenseMatters : NSObject


- (void)performBackgroundTasks;

+ (id)sharedInstance;

@end
