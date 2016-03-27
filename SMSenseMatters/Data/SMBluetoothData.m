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

- (id)serialise {
    NSMutableDictionary *data = [[super serialise] mutableCopy];
    NSMutableArray *devices = [NSMutableArray array];
    for (SMBluetoothDevice *device in _currentDevices) {
        [devices addObject:[device serialise]];
    }
    [data setObject:devices forKey:@"devices"];
    return data;
}

@end
