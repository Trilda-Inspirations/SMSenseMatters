//
//  SMBatterySensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMBatterySensor.h"
#import <UIKit/UIKit.h>
#import "SMBatteryData.h"

@implementation SMBatterySensor

+ (BOOL)isAvailable {
    return [UIDevice currentDevice].batteryLevel >= 0.0f;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    }
    return self;
}

- (void)sense {
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
    SMBatteryData *data = [[SMBatteryData alloc] initWithBatteryLevel:batteryLevel state:batteryState];
    if (self.callback) {
        self.callback(data);
    }
}


@end
