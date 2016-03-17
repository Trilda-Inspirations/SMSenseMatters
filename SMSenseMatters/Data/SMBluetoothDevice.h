//
//  SMBluetoothDevice.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 17/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBluetoothDevice : NSObject

@property (nonatomic, strong) NSString *name;


@property (nonatomic, strong) NSString *UUID;


@property (nonatomic, strong) NSNumber *RSSI;



- (id)initWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI;

@end
