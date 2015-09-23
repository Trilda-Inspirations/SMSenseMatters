//
//  SMSensor.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSensorData.h"

typedef void (^SenseCallback)(SMSensorData *senseData);

@interface SMSensor : NSObject

@property (nonatomic, readonly, copy) SenseCallback callback;

- (void)sense;
+ (BOOL)isAvailable;
- (id)initWithSenseCallback:(SenseCallback)callback;

@end
