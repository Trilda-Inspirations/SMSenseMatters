//
//  SMBluetoothDiscoverySensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensor.h"
#import <CoreBluetooth/CoreBluetooth.h>

/**
 *  A sensor for discovering nearby bluetooth devices
 */
@interface SMBluetoothDiscoverySensor : SMSensor <CBCentralManagerDelegate>

@end
