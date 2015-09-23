//
//  SM3DMotionSensorData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSensorData.h"

@interface SM3DMotionSensorData : SMSensorData

@property (nonatomic) float xAxis;
@property (nonatomic) float yAxis;
@property (nonatomic) float zAxis;

- (id)initWithX:(float)x y:(float)y z:(float)z;

@end
