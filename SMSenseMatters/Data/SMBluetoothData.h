//
//  SMBluetoothData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <SMSenseMatters/SMSenseMatters.h>

/**
 *  Bluetooth data for a particular sense period
 */
@interface SMBluetoothData : SMSensorData

/**
 *  List of devices discovered since the last sense
 */
@property (nonatomic, strong) NSArray *currentDevices;

/**
 *  Initialises the bluetooth data, containing a list of discovered devices
 *
 *  @param currentDevices List of current devices
 *
 *  @return Instance
 */
- (id)initWithCurrentDevices:(NSArray *)currentDevices;

@end
