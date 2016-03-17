//
//  SMBluetoothDevice.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import "SMBluetoothDevice.h"

@implementation SMBluetoothDevice


- (id)initWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI {
    self = [self init];
    if (self) {
        _name = name;
        _UUID = UUID;
        _RSSI = RSSI;
    }
    return self;
}


@end
