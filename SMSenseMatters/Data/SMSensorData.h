//
//  SMSensorData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Generic sensor data object
 */
@interface SMSensorData : NSObject

/**
 *  Date when the data was sensed
 */
@property (nonatomic, strong) NSDate *dateSensed;

/**
 *  Serialised data to JSON object
 *
 *  @return JSON object
 */
- (id)serialise;

@end
