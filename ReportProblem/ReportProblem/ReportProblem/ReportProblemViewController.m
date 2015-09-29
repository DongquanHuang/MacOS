//
//  ViewController.m
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "ReportProblemViewController.h"
#import "NSWorkspace+MailExtension.h"
#import "WbxLogCollector.h"
#import "ReportMail.h"

@interface ReportProblemViewController ()

@property (strong, nonatomic) WbxLogCollector *logCollector;
@property (strong, nonatomic) ReportMail *reportMail;
@property (strong, nonatomic) NSWorkspace *ws;

@end

@implementation ReportProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

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

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)reportProblem:(NSButton *)sender {
//    NSArray *meetingLogs = [self collectGpcLogs];
//    NSArray *gpcLogs = [self collectGpcLogs];
//    NSArray *allLogs = [meetingLogs arrayByAddingObjectsFromArray:gpcLogs];
    
    NSArray *allLogs = [NSArray arrayWithObjects:[self latestMeetingLog],
                        [self latestGpcLog],
                        nil];
    
    self.reportMail.recipient = @"petehuan@cisco.com";
    self.reportMail.mailTitle = @"Report problem: mail title";
    self.reportMail.mailBody = @"Report problem: mail body";
    self.reportMail.attachments = [[NSArray alloc] initWithArray:allLogs];
    
    [self.ws reportProblem:self.reportMail];
}

- (IBAction)saveLog:(NSButton *)sender {
    
}

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


@end
