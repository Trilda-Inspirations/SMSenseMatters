//
//  SMProximityData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

/**
 *  Proximity data
 */
@interface SMProximityData : SMSensorData

/**
 *  Whether the screen is close to an object
 */
@property (nonatomic) BOOL isCloseToUser;


/**
 *  Initialises a proximity data object with specified proximity
 *
 *  @param proximity Whether the screen is close to an object
 *
 *  @return Proximity data object
 */
- (id)initWithProximity:(BOOL)proximity;

@end
