//
//  ShellCommand.m
//  ReportProblem
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "ZipShellCommand.h"

NSString *zipCommand = @"/usr/bin/zip";

@interface ZipShellCommand ()

- (NSString *)getTargetZipFilePathWithName:(NSString *)zipFileName andTargetDirectory:(NSString *)path;
- (NSArray *)getZipCommandArgumentsWithFilesToBeCompressed:(NSArray *)filesToBeCompressed andTargetFilePath:(NSString *)targetZipFilePath;
- (void)removePreviousZipFile:(NSString *)fileName;

@end

@implementation ZipShellCommand

- (void)zipFiles:(NSArray *)filesToBeCompressed toArchieveWithName:(NSString *)zipFileName inPath:(NSString *)path {
    NSString *targetZipFilePath = [self getTargetZipFilePathWithName:zipFileName andTargetDirectory:path];
    [self removePreviousZipFile:targetZipFilePath];
    NSArray *args = [self getZipCommandArgumentsWithFilesToBeCompressed:filesToBeCompressed andTargetFilePath:targetZipFilePath];
    [[NSTask launchedTaskWithLaunchPath:zipCommand arguments:args] waitUntilExit];
    
}

- (NSString *)getTargetZipFilePathWithName:(NSString *)zipFileName andTargetDirectory:(NSString *)path {
    NSString *targetZipFilePath = [[NSString alloc] initWithFormat:@"%@/%@", [path stringByExpandingTildeInPath], zipFileName];
    
    return targetZipFilePath;
}

- (NSArray *)getZipCommandArgumentsWithFilesToBeCompressed:(NSArray *)filesToBeCompressed andTargetFilePath:(NSString *)targetZipFilePath {
    NSMutableArray *args = [[NSMutableArray alloc] init];
    
    [args addObject:@"-jr"];
    [args addObject:targetZipFilePath];
    
    NSString *file = nil;
    for (file in filesToBeCompressed) {
        [args addObject:[file stringByExpandingTildeInPath]];
    }
    
    return args;
}

- (void)removePreviousZipFile:(NSString *)fileName {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:fileName]) {
        NSError *error = nil;
        [fileMgr removeItemAtPath:fileName error:&error];
    }

}

@end
