//
//  WbxLogCollector.h
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WbxLogCollector : NSObject

@property (strong, nonatomic) NSString *meetingLogFolder;
@property (strong, nonatomic) NSString *gpcLogFolder;

- (NSArray *)findAllMeetingLogs;
- (NSArray *)findAllGpcLogs;

- (NSString *)latestMeetingLogPath;
- (NSString *)latestGpcLogPath;

@end
