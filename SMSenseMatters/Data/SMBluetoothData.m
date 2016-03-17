//
//  SMBluetoothData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import "SMBluetoothData.h"

@implementation SMBluetoothData

- (id)initWithCurrentDevices:(NSArray *)currentDevices {
    self = [self init];
    if (self) {
        _currentDevices = currentDevices;
    }
    return self;
}

@end
