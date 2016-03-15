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
   
    [json setObject:[NSNumber numberWithFloat:_batteryLevel] forKey:@"level"];
    [json setObject:[NSNumber numberWithInteger:_batteryStatus] forKey:@"status"];
    [json setObject:[self describeStatus:_batteryStatus] forKey:@"statusDescription"];
    
    return json;
}

- (NSString *)describeStatus:(SMBatteryStatus)status {
    switch (status) {
        case SMBatteryStatusCharging:
            return @"Charging";
        case SMBatteryStatusFull:
            return @"Full";
        case SMBatteryStatusUnplugged:
            return @"Not Charging";
        default:
            return @"Unknown";
    }
}


@end
