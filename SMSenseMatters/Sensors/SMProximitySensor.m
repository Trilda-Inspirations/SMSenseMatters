//
//  SMProximitySensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMProximitySensor.h"
#import "SMProximityData.h"

@implementation SMProximitySensor

+ (BOOL)isAvailable {
    return [UIDevice currentDevice].proximityMonitoringEnabled;
    
}

- (void)sense {
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    BOOL proximity = [UIDevice currentDevice].proximityState;
    SMProximityData *data = [[SMProximityData alloc] initWithProximity:proximity];
    if (self.callback) {
        self.callback(data);
    }
}

@end
