//
//  SMProximityDataTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 16/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <SMSenseMatters/SMSenseMatters.h>
#import <XCTest/XCTest.h>

@interface SMProximityDataTests : XCTestCase

@end

/**
 *  Tests for the SMProximityData class
 */
@implementation SMProximityDataTests

/**
 *  Tests using 'far' data
 */
- (void)testFar {
    SMProximityData *data = [[SMProximityData alloc] initWithProximity:NO];
    XCTAssertTrue(!data.isCloseToUser, @"Proximity Data didn't store proximity value accurately");
}


/**
 *  Tests using 'near' data
 */
- (void)testNear {
    SMProximityData *data = [[SMProximityData alloc] initWithProximity:YES];
    XCTAssertTrue(data.isCloseToUser, @"Proximity Data didn't store proximity value accurately");
}


/**
 *  Tests that this data class follows the structure of SMSensorData
 */
- (void)testClassStructure {
    XCTAssertTrue([SMProximityData isSubclassOfClass:[SMSensorData class]], @"Proximity Data is not a subclass of Sensor Data");
}


/**
 *  Tests the performance of the intiialisation method
 */
- (void)testPerformanceInitialisation {
    [self measureBlock:^{
        [[SMProximityData alloc] initWithProximity:YES];
    }];
}

@end
