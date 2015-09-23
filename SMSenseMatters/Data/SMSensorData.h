//
//  SMSensorData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSensorData : NSObject

@property (nonatomic, strong) NSDate *dateSensed;

- (id)serialise;

@end
