//
//  SMLocationSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <SMSenseMatters/SMSenseMatters.h>
#import <CoreLocation/CoreLocation.h>

@interface SMLocationSensor : SMSensor <CLLocationManagerDelegate>


- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs;


@end
