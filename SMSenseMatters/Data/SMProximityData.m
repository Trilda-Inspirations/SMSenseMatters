//
//  SMProximityData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMProximityData.h"

@implementation SMProximityData

- (id)initWithProximity:(BOOL)proximity {
    self = [super init];
    if (self) {
        _isCloseToUser = proximity;
    }
    return self;
}

- (id)serialise {
    NSMutableDictionary *data = [[super serialise] mutableCopy];
    [data setObject:[NSNumber numberWithBool:_isCloseToUser] forKey:@"CloseToUser"];
    return data;
}

@end
