//
//  ShellCommand.h
//  ReportProblem
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZipShellCommand : NSObject

- (void)zipFiles:(NSArray *)filesToBeCompressed toArchieveWithName:(NSString *)zipFileName inPath:(NSString *)path;

@end
