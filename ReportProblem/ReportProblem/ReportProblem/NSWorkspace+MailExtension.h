//
//  NSWorkspace+MailExtension.h
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ReportMail;

@interface NSWorkspace (MailExtension)

- (void)reportProblem:(ReportMail *)reportMail;

@end
