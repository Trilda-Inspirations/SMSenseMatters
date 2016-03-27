//
//  SMGeoPositionDataTests.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMGeoPositionData.h"

@interface SMGeoPositionDataTests : XCTestCase

@end

@implementation SMGeoPositionDataTests

- (void)testSerialisation {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(5, 15);
    CLLocationDistance altitude = 30;
    SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:coordinate altitude:altitude];
    
    NSDictionary *jsonData = [data serialise];
    
    XCTAssertNotNil([jsonData objectForKey:@"latitude"]);
    XCTAssertNotNil([jsonData objectForKey:@"longitude"]);
    XCTAssertNotNil([jsonData objectForKey:@"altitude"]);
    
    XCTAssertTrue([[jsonData objectForKey:@"latitude"] doubleValue] == coordinate.latitude);
    XCTAssertTrue([[jsonData objectForKey:@"longitude"] doubleValue] == coordinate.longitude);
    XCTAssertTrue([[jsonData objectForKey:@"altitude"] doubleValue] == altitude);
    
    
}

- (void)testZeroParameters {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(0, 0);
    CLLocationDistance altitude = 0;
    SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:coordinate altitude:altitude];
    
    XCTAssertEqual(coordinate.latitude, data.latitude);
    XCTAssertEqual(coordinate.longitude, data.longitude);
    XCTAssertEqual(altitude, data.altitude);
    
}

- (void)testPositiveParameters {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(30, 50);
    CLLocationDistance altitude = 10;
    SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:coordinate altitude:altitude];
    
    XCTAssertEqual(coordinate.latitude, data.latitude);
    XCTAssertEqual(coordinate.longitude, data.longitude);
    XCTAssertEqual(altitude, data.altitude);
    
}


- (void)testNegativeParameters {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-30, -50);
    CLLocationDistance altitude = -10;
    SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:coordinate altitude:altitude];
    
    XCTAssertEqual(coordinate.latitude, data.latitude);
    XCTAssertEqual(coordinate.longitude, data.longitude);
    XCTAssertEqual(altitude, data.altitude);
    
}

- (void)testPerformanceInitialisation {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(0, 0);
    [self measureBlock:^{
        SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:coordinate altitude:0];
    }];
}



@end
