//
//  NSWorkspace+MailExtension.m
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "NSWorkspace+MailExtension.h"
#import "ReportMail.h"
#import "ZipShellCommand.h"

NSString *zipFolder = @"/tmp";
NSString *zipFileName = @"Log";

NSString *MSOutlookBundleIdentifier = @"com.microsoft.Outlook";
NSString *OutlookAppleScriptName = @"SendViaOutlook" ;
NSString *MailAppleScriptName =	@"SendViaMail" ;

NSString *AppleScriptTaskPath = @"/usr/bin/osascript";
NSString *AppleScriptExtension = @"scpt" ;


@implementation NSWorkspace (MailExtension)

- (void)reportProblem:(ReportMail *)reportMail {
    NSString *zippedAttachment = [self zipAttachmentFiles:reportMail.attachments];
    
    NSString *scriptName = MailAppleScriptName;
    if ([self isMSOutlookInstalled]) {
        scriptName = OutlookAppleScriptName;
    }
    [self mailTo:reportMail.recipient withMailTitle:reportMail.mailTitle mailBody:reportMail.mailBody andAttachment:zippedAttachment byUsingAppleScript:scriptName];
}

- (NSString *)zipAttachmentFiles:(NSArray *)files {
    if ([files count] == 0) {
        return @"";
    }
    
    ZipShellCommand *zipCommand = [[ZipShellCommand alloc] init];
    [zipCommand zipFiles:files toArchieveWithName:zipFileName inPath:zipFolder];
    
    NSString *targetZipFile = [[NSString alloc] initWithFormat:@"%@/%@.zip", zipFolder, zipFileName];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:targetZipFile]) {
        return targetZipFile;
    }
    return @"";
}

-(BOOL)isMSOutlookInstalled
{
    NSString *strPath = [self absolutePathForAppBundleWithIdentifier:MSOutlookBundleIdentifier];
    return strPath.length > 0;
}

- (void)mailTo:(NSString *)address withMailTitle:(NSString *)title mailBody:(NSString *)body andAttachment:(NSString *)attachment byUsingAppleScript:(NSString *)scriptName {
    NSString *scriptPath = [self appleScriptPathForScriptName:scriptName];
    [NSTask launchedTaskWithLaunchPath:AppleScriptTaskPath
                             arguments:[NSArray arrayWithObjects:scriptPath,
                                        address,
                                        title,
                                        body,
                                        attachment,
                                        nil]];
}

- (NSString *)appleScriptPathForScriptName:(NSString *)scriptName {
    NSBundle *thisBundle = [self myBundle];
    NSString *scriptPathName = [thisBundle pathForResource:scriptName ofType:AppleScriptExtension];
    NSURL *scriptURL = [NSURL fileURLWithPath:scriptPathName];
    NSString *scriptPath = [[NSString alloc] initWithFormat:@"%@", [scriptURL path]];
    return scriptPath;
}

- (NSBundle *)myBundle {
    return [NSBundle bundleWithIdentifier:@"com.hdq.ReportProblem"];
}

@end
