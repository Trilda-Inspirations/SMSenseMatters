//
//  SMBatterySensorTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 16/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMSenseMatters/SMSenseMatters.h>


@interface SMBatterySensorTests : XCTestCase

@end

/**
 *  Tests for the SMBatterySensor class
 */
@implementation SMBatterySensorTests

/**
 *  Tests the battery sensor initialises correctly
 */
- (void)testBatterySensor {
    SMBatterySensor *sensor = [[SMBatterySensor alloc] init];
    XCTAssertNotNil(sensor, @"Battery Sensor did not initialise");
    
    
}

/**
 *  Tests the time taken to intialise the sensor
 */
- (void)testPerformanceInitialisation {
    [self measureBlock:^{
        [[SMBatterySensor alloc] init];
    }];
}

@end
