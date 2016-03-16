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

/**
 *  Tests for the SMSenseMatters class
 */
@implementation SMSenseMattersTests

/**
 *  Tests the singleton instnance
 */
- (void)testSingleton {
    XCTAssertFalse([SMSenseMatters sharedInstance] == nil, @"Shared SMSenseMatters instance is nil");
    XCTAssertTrue([SMSenseMatters sharedInstance] == [SMSenseMatters sharedInstance], @"Multiple instances of SMSenseMatters created");
}



@end
