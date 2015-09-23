//
//  SMSensorData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

#define DATA_KEY_DATE @"date"

@implementation SMSensorData

- (id)serialise {
    NSString *dateString = [NSDateFormatter localizedStringFromDate:_dateSensed
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterMediumStyle];
    id JSON = @{ DATA_KEY_DATE : dateString };
    return JSON;
}

- (id)init {
    self = [super init];
    if (self) {
        _dateSensed = [NSDate new];
    }
    return self;
}

@end
