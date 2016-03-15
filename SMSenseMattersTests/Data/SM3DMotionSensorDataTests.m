//
//  SM3DMotionSensorDataTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 15/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMSenseMatters/SMSenseMatters.h>
#import <float.h>

@interface SM3DMotionSensorDataTests : XCTestCase



@end

@implementation SM3DMotionSensorDataTests


/**
 *  Tests that the 3D Motion Data class is constructed correctly
 */
- (void)testMotionDataInitialisation {
    
    SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:0 y:0 z:0];
    XCTAssertEqual(data.xAxis, 0.0f, @"X axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.xAxis, 0.0f);
    XCTAssertEqual(data.yAxis, 0.0f, @"Y axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.yAxis, 0.0f);
    XCTAssertEqual(data.zAxis, 0.0f, @"Z axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.zAxis, 0.0f);
    
    
    
}

- (void)testSerialisation {
    float x = -0.0f;
    float y = 0.99f;
    float z = -0.2f;
    SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:x y:y z:z];
    NSDictionary *serialised = [data serialise];
    
    XCTAssertTrue([serialised objectForKey:@"xAxis"] != nil, @"JSON xAxis is nil");
    XCTAssertTrue([[serialised objectForKey:@"xAxis"] isKindOfClass:[NSNumber class]], @"JSON xAxis is not an NSNumber");
    XCTAssertTrue([serialised objectForKey:@"yAxis"] != nil, @"JSON yAxis is nil");
    XCTAssertTrue([[serialised objectForKey:@"yAxis"] isKindOfClass:[NSNumber class]], @"JSON yAxis is not an NSNumber");
    XCTAssertTrue([serialised objectForKey:@"zAxis"] != nil, @"JSON zAxis is nil");
    XCTAssertTrue([[serialised objectForKey:@"zAxis"] isKindOfClass:[NSNumber class]], @"JSON zAxis is not an NSNumber");
    
    XCTAssertEqual([(NSNumber *)[serialised objectForKey:@"xAxis"] floatValue], x, @"JSON xAxis value is not as expected. Expected %.3f, got %.3f", x, [(NSNumber *)[serialised objectForKey:@"xAxis"] floatValue]);
    XCTAssertEqual([(NSNumber *)[serialised objectForKey:@"yAxis"] floatValue], y, @"JSON yAxis value is not as expected. Expected %.3f, got %.3f", y, [(NSNumber *)[serialised objectForKey:@"yAxis"] floatValue]);
    XCTAssertEqual([(NSNumber *)[serialised objectForKey:@"zAxis"] floatValue], z, @"JSON zAxis value is not as expected. Expected %.3f, got %.3f", z, [(NSNumber *)[serialised objectForKey:@"zAxis"] floatValue]);
    
    
}

/**
 *  Tests that this data class follows the structure of SMSensorData
 */
- (void)testClassStructure {
    XCTAssertTrue([SM3DMotionSensorData isSubclassOfClass:[SMSensorData class]]);
}

/**
 *  Tests that each axis is independent
 */
- (void)testDiffValues {
    float x = -0.0f;
    float y = 0.99f;
    float z = -0.2f;
    SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:x y:y z:z];
    XCTAssertEqual(data.xAxis, x, @"X axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.xAxis, x);
    XCTAssertEqual(data.yAxis, y, @"Y axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.yAxis, y);
    XCTAssertEqual(data.zAxis, z, @"Z axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.zAxis, z);
}


/**
 *  Tests that the class works for maximum float values
 */
- (void)testMaxValue {
    float x = FLT_MAX;
    float y = FLT_MAX;
    float z = FLT_MAX;
    SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:x y:y z:z];
    XCTAssertEqual(data.xAxis, x, @"X axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.xAxis, x);
    XCTAssertEqual(data.yAxis, y, @"Y axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.yAxis, y);
    XCTAssertEqual(data.zAxis, z, @"Z axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.zAxis, z);
}


/**
 *  Tests that the class works for negative values
 */
- (void)testNegativeAxis {
    SM3DMotionSensorData *data = [[SM3DMotionSensorData alloc] initWithX:-100 y:-100 z:-100];
    XCTAssertEqual(data.xAxis, -100.0f, @"X axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.xAxis, -100.0f);
    XCTAssertEqual(data.yAxis, -100.0f, @"Y axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.yAxis, -100.0f);
    XCTAssertEqual(data.zAxis, -100.0f, @"Z axis value for 3D Motion Data was not equal -- %.3f != %.3f", data.zAxis, -100.0f);
}

/**
 *  Tests the time to initialise the data class
 */
- (void)testPerformanceInitialisation {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [[SM3DMotionSensorData alloc] initWithX:0 y:0 z:0];
    }];
}

@end
