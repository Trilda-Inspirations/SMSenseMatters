//
//  SMSenseMattersTests.m
//  SMSenseMattersTests
//
//  Created by Alex Blundell on 15/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMSenseMatters/SMSenseMatters.h>

@interface SMSenseMattersTests : XCTestCase



@end

@implementation SMSenseMattersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSingleton {
    XCTAssertFalse([SMSenseMatters sharedInstance] == nil);
}




- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
