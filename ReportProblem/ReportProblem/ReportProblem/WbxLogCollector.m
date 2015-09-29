//
//  WbxLogCollector.m
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "WbxLogCollector.h"

NSString *defaultMeetingLogFolder = @"/tmp";
NSString *defaultGpcLogFolder = @"/tmp";

NSString *WbxTracePrefix =  @"wbxtra_";
NSString *WbxTraceExtension = @"wbt";
NSString *WbxGpcLogFileName = @"wbxgpc.wbt";

@interface WbxLogCollector ()

@property (strong, nonatomic) NSString *latestMeetingLogFilePath;
@property (strong, nonatomic) NSString *latestGpcLogFilePath;

- (NSDirectoryEnumerator *)meetingLogDirectoryEnumerator;
- (NSDirectoryEnumerator *)gpcLogDirectoryEnumerator;

- (BOOL)isWbxMeetingLog:(NSString *)fileName;
- (NSString *)fullPathForMeetingLogFile:(NSString *)fileName;
- (NSString *)findLatestMeetingLog:(NSArray *)logFiles;
- (NSArray *)sortByTimestampForMeetingLogs:(NSArray *)logFiles;
- (NSDate *)timestampFromMeetingLogFile:(NSString *)fileName;

- (BOOL)isWbxGpcLog:(NSString *)fileName;
- (NSString *)fullPathForGpcLogFile:(NSString *)fileName;

@end

@implementation WbxLogCollector

#pragma mark - Properties
- (NSString *)meetingLogFolder {
    if (!_meetingLogFolder) {
        _meetingLogFolder = [[NSString alloc] initWithString:defaultMeetingLogFolder];
    }
    
    return _meetingLogFolder;
}

- (NSString *)gpcLogFolder {
    if (!_gpcLogFolder) {
        _gpcLogFolder = [[NSString alloc] initWithString:defaultGpcLogFolder];
    }
    
    return _gpcLogFolder;
}

#pragma mark - Public methods
- (NSArray *)findAllMeetingLogs {
    NSMutableArray *allMeetingLogs = [[NSMutableArray alloc] init];
    
    NSDirectoryEnumerator *dirEnum = [self meetingLogDirectoryEnumerator];
    NSString *fileName = nil;
    while (fileName = [dirEnum nextObject]) {
        if ([self isWbxMeetingLog:fileName]) {
            [allMeetingLogs addObject:[self fullPathForMeetingLogFile:fileName]];
        }
    }
    
    return allMeetingLogs;
}

- (NSArray *)findAllGpcLogs {
    NSMutableArray *allGpcLogs = [[NSMutableArray alloc] init];
    
    NSDirectoryEnumerator *dirEnum = [self gpcLogDirectoryEnumerator];
    NSString *fileName = nil;
    while (fileName = [dirEnum nextObject]) {
        if ([self isWbxGpcLog:fileName]) {
            [allGpcLogs addObject:[self fullPathForGpcLogFile:fileName]];
        }
    }
    
    return allGpcLogs;
}

- (NSString *)latestMeetingLogPath {
    if (!self.latestMeetingLogFilePath) {
        NSArray *allMeetingLogs = [self findAllMeetingLogs];
        NSString *latestMeetingLog = [self findLatestMeetingLog:allMeetingLogs];
        self.latestMeetingLogFilePath = [[NSString alloc] initWithString:latestMeetingLog];
    }
    return self.latestMeetingLogFilePath;
}

- (NSString *)latestGpcLogPath {
    if (!self.latestGpcLogFilePath) {
        NSArray *allGpcLogs = [self findAllGpcLogs];
        if (allGpcLogs.count > 0) {
            NSString *latestGpcLog = [allGpcLogs objectAtIndex:0];
            self.latestGpcLogFilePath = [[NSString alloc] initWithString:latestGpcLog];
        }
    }
    return self.latestGpcLogFilePath;
}

#pragma mark - Helper methods
- (NSDirectoryEnumerator *)meetingLogDirectoryEnumerator {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *home = [self.meetingLogFolder stringByExpandingTildeInPath];
    return [manager enumeratorAtPath:home];
}

- (NSDirectoryEnumerator *)gpcLogDirectoryEnumerator {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *home = [self.gpcLogFolder stringByExpandingTildeInPath];
    return [manager enumeratorAtPath:home];
}

- (BOOL)isWbxMeetingLog:(NSString *)fileName {
    if ([[fileName pathExtension] isEqualTo:WbxTraceExtension] && [fileName hasPrefix:WbxTracePrefix]) {
        return YES;
    }
    return NO;
}

- (NSString *)fullPathForMeetingLogFile:(NSString *)fileName {
    return [NSString stringWithFormat:@"%@/%@", [self.meetingLogFolder stringByExpandingTildeInPath], fileName];
}

- (NSString *)findLatestMeetingLog:(NSArray *)logFiles {
    if (logFiles.count == 0) {
        return @"";
    }
    
    NSArray *sortedLogFiles = [self sortByTimestampForMeetingLogs:logFiles];
    
    return [sortedLogFiles firstObject];
}

- (NSArray *)sortByTimestampForMeetingLogs:(NSArray *)logFiles {
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    
    NSString *logFile = nil;
    for (logFile in logFiles) {
        NSDate *date = [self timestampFromMeetingLogFile:logFile];
        
        int index = 0;
        for (index = 0; index < [sortedArray count]; index++) {
            NSDate *latestDate = [self timestampFromMeetingLogFile:[sortedArray objectAtIndex:index]];
            if ([date laterDate:latestDate]) {
                [sortedArray insertObject:logFile atIndex:index];
                break;
            }
        }
        if (index == [sortedArray count]) {
            [sortedArray addObject:logFile];
        }
    }

    
    return sortedArray;
}

- (NSDate *)timestampFromMeetingLogFile:(NSString *)fileName {
    NSString *fileNameWithoutExt = [[fileName lastPathComponent] stringByReplacingOccurrencesOfString:@".wbt" withString:@""];
    NSArray *info = [fileNameWithoutExt componentsSeparatedByString:@"_"];
    NSString *dateStr = [NSString stringWithFormat:@"%@%@", [info objectAtIndex:1], [info objectAtIndex:2]];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"MMddyyyyHHmmss"];
    return [dateFormater dateFromString:dateStr];
}

- (BOOL)isWbxGpcLog:(NSString *)fileName {
    if ([fileName isEqualToString:WbxGpcLogFileName]) {
        return YES;
    }
    return NO;
}

- (NSString *)fullPathForGpcLogFile:(NSString *)fileName {
    return [NSString stringWithFormat:@"%@/%@", [self.gpcLogFolder stringByExpandingTildeInPath], fileName];
}

@end
