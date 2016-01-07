//
//  SMBatteryData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SMBatteryStatusUnknown = 0,
    SMBatteryStatusCharging = 1,
    SMBatteryStatusUnplugged = 2,
    SMBatteryStatusFull = 3
} SMBatteryStatus;

@interface SMBatteryData : SMSensorData

@property (nonatomic) float batteryLevel;
@property (nonatomic) SMBatteryStatus batteryStatus;

- (id)initWithBatteryLevel:(float)batteryLevel state:(UIDeviceBatteryState)batteryState;

@end
