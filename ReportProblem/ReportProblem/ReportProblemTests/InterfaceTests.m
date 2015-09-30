//
//  InterfaceTests.m
//  ReportProblem
//
//  Created by Peter Huang on 9/30/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "Interface.h"
#import "WbxClientVersionKeeper.h"

@interface InterfaceTests : XCTestCase

@end

@implementation InterfaceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCanSetClientVersionThroughInterface {
    SetWbxClientVersion(@"1.0.0");
    WbxClientVersionKeeper *versionKeeper = [[WbxClientVersionKeeper alloc] sharedInstance];
    XCTAssertEqualObjects(versionKeeper.clientVersion, @"1.0.0");
}

@end
