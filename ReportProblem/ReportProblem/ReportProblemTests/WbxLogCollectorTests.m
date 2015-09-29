//
//  WbxLogCollectorTests.m
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "WbxLogCollector.h"

@interface WbxLogCollectorTests : XCTestCase {
    WbxLogCollector *logCollector;
}

@end

@implementation WbxLogCollectorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    logCollector = [[WbxLogCollector alloc] init];
    logCollector.meetingLogFolder = [self folderForUnitTest];
    logCollector.gpcLogFolder = [self folderForUnitTest];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSString *)folderForUnitTest {
    NSString *unitTestFolder = [[NSFileManager defaultManager] currentDirectoryPath];
    unitTestFolder = [NSString stringWithFormat:@"%@/Unit Test/", unitTestFolder];
    return unitTestFolder;
}

- (void)testDefaultMeetingLogFolderIsSetCorrectly {
    WbxLogCollector *defaultLogCollector = [[WbxLogCollector alloc] init];
    XCTAssertEqualObjects(defaultLogCollector.meetingLogFolder, @"/tmp");
}

- (void)testDefaultGpcLogFolderIsSetCorrectly {
    WbxLogCollector *defaultLogCollector = [[WbxLogCollector alloc] init];
    XCTAssertEqualObjects(defaultLogCollector.gpcLogFolder, @"/tmp");
}

- (void)testCanConfigMeetingLogFolder {
    logCollector.meetingLogFolder = @"/test";
    XCTAssertEqualObjects(logCollector.meetingLogFolder, @"/test");
}

- (void)testCanConfigGpcLogFolder {
    logCollector.gpcLogFolder = @"/test";
    XCTAssertEqualObjects(logCollector.gpcLogFolder, @"/test");
}

- (void)testCanFindTwoMeetingLogFiles {
    NSArray *allMeetingLogs = [logCollector findAllMeetingLogs];
    XCTAssertEqual(allMeetingLogs.count, 2);
    NSString *expectedFilePath1 = [NSString stringWithFormat:@"%@wbxtra_09242015_092608.wbt", [self folderForUnitTest]];
    XCTAssertEqualObjects([allMeetingLogs objectAtIndex:0], expectedFilePath1);
}

- (void)testCanFindOneGpcLogFile {
    NSArray *allGpcLogs = [logCollector findAllGpcLogs];
    XCTAssertEqual(allGpcLogs.count, 1);
    NSString *expectedFilePath1 = [NSString stringWithFormat:@"%@wbxgpc.wbt", [self folderForUnitTest]];
    XCTAssertEqualObjects([allGpcLogs objectAtIndex:0], expectedFilePath1);
}

- (void)testCanGetLatestMeetingLogFile {
    NSString *expectedFilePath = [NSString stringWithFormat:@"%@wbxtra_09242015_092742.wbt", [self folderForUnitTest]];
    XCTAssertEqualObjects([logCollector latestMeetingLogPath], expectedFilePath);
}

- (void)testCanGetLatestGpcLogFile {
    NSString *expectedFilePath = [NSString stringWithFormat:@"%@wbxgpc.wbt", [self folderForUnitTest]];
    XCTAssertEqualObjects([logCollector latestGpcLogPath], expectedFilePath);
}

@end
