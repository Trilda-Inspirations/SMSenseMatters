//
//  SMBluetoothData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <SMSenseMatters/SMSenseMatters.h>

@interface SMBluetoothData : SMSensorData


@property (nonatomic, strong) NSArray *currentDevices;


- (id)initWithCurrentDevices:(NSArray *)currentDevices;

@end
