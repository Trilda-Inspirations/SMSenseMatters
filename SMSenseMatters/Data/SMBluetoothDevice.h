//
//  SMBluetoothDevice.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Bluetooth device
 */
@interface SMBluetoothDevice : NSObject

/**
 *  Broadcast Name of the device
 */
@property (nonatomic, strong) NSString *name;

/**
 *  UUID of the device
 */
@property (nonatomic, strong) NSString *UUID;

/**
 *  RSSI of the device
 */
@property (nonatomic, strong) NSNumber *RSSI;


/**
 *  Initialises a bluetooth device data structure
 *
 *  @param name Name
 *  @param UUID UUID
 *  @param RSSI RSSI
 *
 *  @return Instance
 */
- (id)initWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI;

@end
