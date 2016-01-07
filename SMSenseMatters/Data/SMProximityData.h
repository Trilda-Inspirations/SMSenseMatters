//
//  SMProximityData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

@interface SMProximityData : SMSensorData

@property (nonatomic) BOOL isCloseToUser;

- (id)initWithProximity:(BOOL)proximity;

@end
