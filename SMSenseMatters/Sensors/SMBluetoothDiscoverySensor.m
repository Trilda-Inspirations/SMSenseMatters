//
//  SMBluetoothDiscoverySensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMBluetoothDiscoverySensor.h"
#import "SMBluetoothData.h"
#import "SMBluetoothDevice.h"

@interface SMBluetoothDiscoverySensor ()

/**
 *  Bluetooth manager to gather data from
 */
@property (nonatomic, retain) CBCentralManager *bluetoothManager;

/**
 *  List of devices discovered since the last sense
 */
@property (nonatomic, retain) NSMutableArray *devicesSinceSense;

/**
 *  Timer for repeat sensing
 */
@property (nonatomic, retain) NSTimer *timer;

@end

@implementation SMBluetoothDiscoverySensor

+ (BOOL)isAvailable {
    CBCentralManagerState state = [[CBCentralManager alloc] init].state;
    return (state == CBCentralManagerStatePoweredOn);
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _bluetoothManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
        _devicesSinceSense = [NSMutableArray array];
        
    }
    return self;
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:secs target:self selector:@selector(sense) userInfo:nil repeats:YES];
        [_timer fire];
    }
    return self;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (central.state == CBCentralManagerStatePoweredOn) {
        [_bluetoothManager scanForPeripheralsWithServices:nil options:nil];
    }
}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    SMBluetoothDevice *device = [[SMBluetoothDevice alloc] initWithName:peripheral.name UUID:peripheral.identifier.UUIDString RSSI:RSSI];
    [_devicesSinceSense addObject:device];
}

- (void)sense {
    if (self.callback) {
        self.callback([[SMBluetoothData alloc] initWithCurrentDevices:[_devicesSinceSense copy]]);
    }
    [_devicesSinceSense removeAllObjects];
    [_bluetoothManager scanForPeripheralsWithServices:nil options:nil];
}

@end
