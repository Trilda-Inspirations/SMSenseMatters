//
//  SMBatteryData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"
#import <UIKit/UIKit.h>

/**
 *  Battery status
 *  @constant SMBatteryStatusUnknown Unknown battery status
 *  @constant SMBatteryStatusCharging Battery is in the charging state
 *  @constant SMBatteryStatusUnplugged Battery is not charging, and unplugged
 *  @constant SMBatteryStatusFull Battery is plugged in, but not charging
 */
typedef enum : NSUInteger {
    SMBatteryStatusUnknown = 0,
    SMBatteryStatusCharging = 1,
    SMBatteryStatusUnplugged = 2,
    SMBatteryStatusFull = 3
} SMBatteryStatus;


/**
 *  Battery data at a particular instance
 */
@interface SMBatteryData : SMSensorData

/**
 *  Battery level
 *
 *  Value between 0.0 and 1.0
 */
@property (nonatomic) float batteryLevel;


/**
 *  Battery status
 */
@property (nonatomic) SMBatteryStatus batteryStatus;

- (id)initWithBatteryLevel:(float)batteryLevel state:(UIDeviceBatteryState)batteryState;

@end
