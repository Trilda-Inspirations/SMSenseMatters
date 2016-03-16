//
//  SMStepsData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/10/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMStepsData.h"

@implementation SMStepsData

- (id)initWithNumberOfSteps:(int)steps {
    self = [super init];
    if (self) {
        _steps = steps;
        
    }
    return self;
}

- (id)serialise {
    NSMutableDictionary *serialised = [[super serialise] mutableCopy];
    
    [serialised setObject:[NSNumber numberWithInt:_steps] forKey:@"steps"];
    
    return serialised;
}



@end
