//
//  ShellCommandTests.m
//  ReportProblem
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "ZipShellCommand.h"
#import "WbxLogCollector.h"

@interface ZipShellCommandTests : XCTestCase {
    ZipShellCommand *command;
}

@end

@implementation ZipShellCommandTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    command = [[ZipShellCommand alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *zipFile = @"/tmp/Log.zip";
    if ([fileMgr fileExistsAtPath:zipFile]) {
        NSError *error = nil;
        [fileMgr removeItemAtPath:zipFile error:&error];
    }
    
    [super tearDown];
}

- (NSString *)folderForUnitTest {
    NSString *unitTestFolder = [[NSFileManager defaultManager] currentDirectoryPath];
    unitTestFolder = [NSString stringWithFormat:@"%@/Unit Test", unitTestFolder];
    return unitTestFolder;
}

- (void)testCanZipFiles {
    WbxLogCollector *logCollector = [[WbxLogCollector alloc] init];
    logCollector.meetingLogFolder = [self folderForUnitTest];
    NSArray *allMeetingLogs = [logCollector findAllMeetingLogs];
    [command zipFiles:allMeetingLogs toArchieveWithName:@"Log" inPath:@"/tmp"];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    XCTAssertTrue([fileMgr fileExistsAtPath:@"/tmp/Log.zip"]);
}

@end
