//
//  SMBatteryDataTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 15/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <float.h>
#import <SMSenseMatters/SMSenseMatters.h>

@interface SMBatteryDataTests : XCTestCase

@end

/**
 *  Tests for the SMBatteryData class
 */
@implementation SMBatteryDataTests

/**
 *  Tests the battery level can store the maximum float
 */
- (void)testMaxFloat {
    SMBatteryData *data = [[SMBatteryData alloc] initWithBatteryLevel:FLT_MAX state:UIDeviceBatteryStateFull];
    XCTAssertEqual(data.batteryLevel, FLT_MAX, @"Battery level not as expected. Expected %.3f, actually %.3f", FLT_MAX, data.batteryLevel);
}

/**
 *  Tests the JSON serialised data is coherent with the correct values
 */
- (void)testSerialisation {
    SMBatteryData *data = [[SMBatteryData alloc] initWithBatteryLevel:1.0f state:UIDeviceBatteryStateFull];
    NSDictionary *serialised = [data serialise];
    
    XCTAssertTrue([serialised objectForKey:@"level"] != nil, @"JSON did not contain 'level', or the value was nil");
    XCTAssertTrue([[serialised objectForKey:@"level"] isKindOfClass:[NSNumber class]], @"JSON 'level' object was not a number");
    XCTAssertEqual([(NSNumber *)[serialised objectForKey:@"level"] floatValue], 1.0f, @"JSON 'level' value was different to the data");
    
    XCTAssertTrue([serialised objectForKey:@"status"] != nil, @"JSON did not contain 'status', or the value was nil");
    XCTAssertTrue([serialised objectForKey:@"status"] != nil, @"JSON 'status' object was not a number");
    XCTAssertEqual((SMBatteryStatus)[(NSNumber *)[serialised objectForKey:@"status"] integerValue], SMBatteryStatusFull, @"Expected JSON 'status' value to be equivalent to the Full battery status, but it wasn't");

    XCTAssertTrue([serialised objectForKey:@"statusDescription"] != nil, @"JSON did not contain 'statusDescription', or the vlaue was nil");
    XCTAssertTrue(![[serialised objectForKey:@"statusDescription"] isEqualToString:@""], @"JSON status description was empty");

}

/**
 *  Tests initialisation of the battery data
 */
- (void)testInitialisation {
    SMBatteryData *data = [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateCharging];
    XCTAssertTrue(data != nil, @"Data is initialised to nil");
    XCTAssertTrue(data.batteryLevel == 0.0f, @"Battery level is %.3f. Expected %.3f", data.batteryLevel, 0.0f);
}

/**
 *  Tests various UIDevice battery states, and their conversion to SMBatteryStatus
 */
- (void)testBatteryStates {
    SMBatteryData *data = [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateCharging];
    XCTAssertTrue(data.batteryStatus == SMBatteryStatusCharging, @"UIDevice Charging status not converted to SMBatteryStatusCharging");
    data = [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateFull];
    XCTAssertTrue(data.batteryStatus == SMBatteryStatusFull, @"UIDevice Full status not converted to SMBatteryStatusFull");
    data = [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateUnplugged];
    XCTAssertTrue(data.batteryStatus == SMBatteryStatusUnplugged, @"UIDevice Uplugged status not converted to SMBatteryStatusUnplugged");
    data = [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateUnknown];
    XCTAssertTrue(data.batteryStatus == SMBatteryStatusUnknown, @"UIDevice Unknown status not converted to SMBatteryStatusUnplugged");
}


/**
 *  Tests that this data class follows the structure of SMSensorData
 */
- (void)testClassStructure {
    XCTAssertTrue([SMBatteryData isSubclassOfClass:[SMSensorData class]], @"Battery Data is not a subclass of Sensor Data");
}


/**
 *  Tests the performance of the initialisation method
 */
- (void)testPerformanceInitialisation {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [[SMBatteryData alloc] initWithBatteryLevel:0.0f state:UIDeviceBatteryStateUnknown];
    }];
}

@end
