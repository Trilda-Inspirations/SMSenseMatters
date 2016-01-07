//
//  SMBluetoothDiscoverySensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMBluetoothDiscoverySensor.h"

@interface SMBluetoothDiscoverySensor ()

@property (nonatomic, retain) CBCentralManager *bluetoothManager;

@end

@implementation SMBluetoothDiscoverySensor

+ (BOOL)isAvailable {
    return NO;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _bluetoothManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
        
    }
    return self;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (central.state == CBCentralManagerStatePoweredOn) {
        [_bluetoothManager scanForPeripheralsWithServices:nil options:nil];
    }
}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {

    NSString *name = peripheral.name;
    
    if ([advertisementData count] > 1) {
        NSDictionary *dict = advertisementData;
    }
    
    NSLog(@"Bluetooth device: %@ (%@), %@", name, peripheral.identifier.UUIDString, RSSI);
    
}

@end
