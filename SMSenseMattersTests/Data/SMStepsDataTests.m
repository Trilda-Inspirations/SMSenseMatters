//
//  SMStepsDataTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 16/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMSenseMatters/SMSenseMatters.h>


@interface SMStepsDataTests : XCTestCase

@end

/**
 *  Tests for the SMStepsData class
 */
@implementation SMStepsDataTests

/**
 *  Tests using 0 steps
 */
- (void)testZeroSteps {
    int steps = 0;
    SMStepsData *data = [[SMStepsData alloc] initWithNumberOfSteps:steps];
    XCTAssertTrue(data.steps == steps,  @"Number of steps is different than expected. Expected %d, got %d", steps, data.steps);
}

/**
 *  Tests using > 0 steps
 */
- (void)testPositiveSteps {
    int steps = 10;
    SMStepsData *data = [[SMStepsData alloc] initWithNumberOfSteps:steps];
    XCTAssertTrue(data.steps == steps, @"Number of steps is different than expected. Expected %d, got %d", steps, data.steps);
}

/**
 *  Tests using the maximum int number of steps
 */
- (void)testMaxIntSteps {
    int steps = INT_MAX;
    SMStepsData *data = [[SMStepsData alloc] initWithNumberOfSteps:steps];
    XCTAssertTrue(data.steps == steps, @"Number of steps is different than expected. Expected %d, got %d", steps, data.steps);
}

/**
 *  Tests the serialisation of the data
 */
- (void)testSerialisation {
    int steps = 10;
    SMStepsData *data = [[SMStepsData alloc] initWithNumberOfSteps:steps];
    
    NSDictionary *serialised = [data serialise];
    
    XCTAssertNotNil([serialised objectForKey:@"steps"], @"Serialised JSON does not contain 'steps'");
    NSNumber *number = (NSNumber *)[serialised objectForKey:@"steps"];
    XCTAssertEqual(steps, [number intValue], @"Number of steps in data is different to the number of steps in JSON");
    
}

/**
 *  Tests that this data class follows the structure of SMSensorData
 */
- (void)testClassStructure {
    XCTAssertTrue([SMStepsData isSubclassOfClass:[SMSensorData class]], @"Steps Data is not a subclass of Sensor Data");
}



/**
 *  Tests the performance of the initialisation
 */
- (void)testPerformanceInitialisation {
    [self measureBlock:^{
        [[SMStepsData alloc] initWithNumberOfSteps:0];
    }];
}

@end
