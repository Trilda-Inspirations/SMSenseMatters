//
//  SMSensorData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 23/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMSensorData.h"

#define DATA_KEY_DATE @"date"

@interface SMSensorData ()

@property (nonatomic, retain) NSDateFormatter *dateFormatter;

@end

@implementation SMSensorData

- (id)serialise {
    NSString *dateString = [_dateFormatter stringFromDate:_dateSensed];
    id JSON = @{ DATA_KEY_DATE : dateString };
    return JSON;
}

- (id)init {
    self = [super init];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
        _dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        _dateSensed = [NSDate new];
    }
    return self;
}

@end
