//
//  WbxClientVersionKeeper.m
//  ReportProblem
//
//  Created by Peter Huang on 9/30/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "WbxClientVersionKeeper.h"

@implementation WbxClientVersionKeeper

- (WbxClientVersionKeeper *)sharedInstance {
    static WbxClientVersionKeeper *clientVersionKeeper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientVersionKeeper = [[WbxClientVersionKeeper alloc] init];
    });
    
    return clientVersionKeeper;
}

@end
