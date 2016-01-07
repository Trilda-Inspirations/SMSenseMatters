//
//  SMBatteryData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMBatteryData.h"


@implementation SMBatteryData


- (id)initWithBatteryLevel:(float)batteryLevel state:(UIDeviceBatteryState)batteryState {
    self = [super init];
    if (self) {
        _batteryLevel = batteryLevel;
        switch (batteryState) {
            case UIDeviceBatteryStateCharging:
                _batteryStatus = SMBatteryStatusCharging;
                break;
            case UIDeviceBatteryStateFull:
                _batteryStatus = SMBatteryStatusFull;
                break;
            case UIDeviceBatteryStateUnplugged:
                _batteryStatus = SMBatteryStatusUnplugged;
                break;
            default:
                _batteryStatus = SMBatteryStatusUnknown;
                break;
        }
    }
    return self;
}

- (id)serialise {
    NSMutableDictionary *json = [[super serialise] mutableCopy];
   // [json setObject:[NSNumber numberWithFloat:_xAxis] forKey:DATA_MOTION_KEY_X];
   // [json setObject:[NSNumber numberWithFloat:_yAxis] forKey:DATA_MOTION_KEY_Y];
   // [json setObject:[NSNumber numberWithFloat:_zAxis] forKey:DATA_MOTION_KEY_Z];
    return json;
}


@end
