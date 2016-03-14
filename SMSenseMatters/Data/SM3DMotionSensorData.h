//
//  SM3DMotionSensorData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSensorData.h"

/**
 *  3D sensor data with 3 axis (x, y, z)
 */
@interface SM3DMotionSensorData : SMSensorData

/**
 *  X Value
 */
@property (nonatomic) float xAxis;

/**
 *  Y Value
 */
@property (nonatomic) float yAxis;

/**
 *  Z Value
 */
@property (nonatomic) float zAxis;

/**
 *  Initialises 3D sensor data with the values for 3 axis
 *
 *  @param x X value
 *  @param y Y value
 *  @param z Z value
 *
 *  @return 3D sensor data
 */
- (id)initWithX:(float)x y:(float)y z:(float)z;

@end
