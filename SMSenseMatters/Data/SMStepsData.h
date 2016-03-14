//
//  SMStepsData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

/**
 *  Steps data
 */
@interface SMStepsData : SMSensorData


/**
 *  Number of steps taken
 */
@property (nonatomic) int steps;


/**
 *  Intialises a steps data object with specified number of steps taken
 *
 *  @param steps Number of steps taken
 *
 *  @return Steps data object
 */
- (id)initWithNumberOfSteps:(int)steps;

@end
