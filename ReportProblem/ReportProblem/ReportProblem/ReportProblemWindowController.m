//
//  ReportProblemWindowController.m
//  ReportProblem
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "ReportProblemWindowController.h"
#import "NSWorkspace+MailExtension.h"
#import "WbxLogCollector.h"
#import "ReportMail.h"
#import "WbxClientVersionKeeper.h"

@interface ReportProblemWindowController ()

@property (strong, nonatomic) WbxLogCollector *logCollector;
@property (strong, nonatomic) ReportMail *reportMail;
@property (strong, nonatomic) NSWorkspace *ws;
@property (strong, nonatomic) WbxClientVersionKeeper *versionKeeper;

@end

@implementation ReportProblemWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self.window setTitle:@"Report Problem"];
}

#pragma mark - properties
- (WbxLogCollector *)logCollector {
    if (!_logCollector) {
        _logCollector = [[WbxLogCollector alloc] init];
    }
    
    return _logCollector;
}

- (ReportMail *)reportMail {
    if (!_reportMail) {
        _reportMail = [[ReportMail alloc] init];
    }
    
    return _reportMail;
}

- (NSWorkspace *)ws {
    if (!_ws) {
        _ws = [[NSWorkspace alloc] init];
    }
    
    return _ws;
}

- (WbxClientVersionKeeper *)versionKeeper {
    if (!_versionKeeper) {
        _versionKeeper = [[WbxClientVersionKeeper alloc] sharedInstance];
    }
    
    return _versionKeeper;
}

#pragma mark - helper methods
- (NSArray *)collectMeetingLogs {
    return [self.logCollector findAllMeetingLogs];
}

- (NSArray *)collectGpcLogs {
    return [self.logCollector findAllGpcLogs];
}

- (NSString *)latestMeetingLog {
    return [self.logCollector latestMeetingLogPath];
}

- (NSString *)latestGpcLog {
    return [self.logCollector latestGpcLogPath];
}

#pragma mark - IBActions
- (IBAction)reportProblem:(NSButton *)sender {
    //    NSArray *meetingLogs = [self collectGpcLogs];
    //    NSArray *gpcLogs = [self collectGpcLogs];
    //    NSArray *allLogs = [meetingLogs arrayByAddingObjectsFromArray:gpcLogs];
    
    NSArray *allLogs = [NSArray arrayWithObjects:[self latestMeetingLog],
                        [self latestGpcLog],
                        nil];
    
    
    
    self.reportMail.recipient = @"petehuan@cisco.com";
    self.reportMail.mailTitle = [[NSString alloc] initWithFormat:@"Report problem: WebEx client version %@", self.versionKeeper.clientVersion];
    self.reportMail.mailBody = @"Report problem: mail body";
    self.reportMail.attachments = [[NSArray alloc] initWithArray:allLogs];
    
    [self.ws reportProblem:self.reportMail];
}

- (IBAction)saveLog:(NSButton *)sender {
}

@end
