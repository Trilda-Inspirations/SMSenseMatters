//
//  SMStepsData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

@interface SMStepsData : SMSensorData

@property (nonatomic) int steps;

- (id)initWithNumberOfSteps:(int)steps;

@end
