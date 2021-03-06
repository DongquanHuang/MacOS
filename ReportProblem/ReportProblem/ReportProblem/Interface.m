//
//  Interface.m
//  ReportProblem
//
//  Created by Peter Huang on 9/30/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interface.h"
#import "WbxClientVersionKeeper.h"
#import "ReportProblemWindowController.h"

ReportProblemWindowController *winCtrl = nil;

void SetWbxClientVersion(NSString *clientVersion) {
    WbxClientVersionKeeper *clientVersionKeeper = [[WbxClientVersionKeeper alloc] sharedInstance];
    clientVersionKeeper.clientVersion = clientVersion;
}

void ShowReportProblemDialog() {
    winCtrl = [[ReportProblemWindowController alloc] initWithWindowNibName:@"ReportProblem"];
    [winCtrl window];
    [winCtrl showWindow:nil];
}