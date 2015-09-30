//
//  WbxClientVersionKeeper.h
//  ReportProblem
//
//  Created by Peter Huang on 9/30/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WbxClientVersionKeeper : NSObject

@property (strong, nonatomic) NSString *clientVersion;

- (WbxClientVersionKeeper *)sharedInstance;

@end
