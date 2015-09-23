//
//  SM3DMotionSensorData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SM3DMotionSensorData.h"

#define DATA_MOTION_KEY_X @"xAxis"
#define DATA_MOTION_KEY_Y @"yAxis"
#define DATA_MOTION_KEY_Z @"zAxis"

@implementation SM3DMotionSensorData

- (id)initWithX:(float)x y:(float)y z:(float)z {
    self = [super init];
    if (self) {
        _xAxis = x;
        _yAxis = y;
        _zAxis = z;
    }
    return self;
}

- (id)serialise {
    NSMutableDictionary *json = [[super serialise] mutableCopy];
    [json setObject:[NSNumber numberWithFloat:_xAxis] forKey:DATA_MOTION_KEY_X];
    [json setObject:[NSNumber numberWithFloat:_yAxis] forKey:DATA_MOTION_KEY_Y];
    [json setObject:[NSNumber numberWithFloat:_zAxis] forKey:DATA_MOTION_KEY_Z];
    return json;
}

@end
