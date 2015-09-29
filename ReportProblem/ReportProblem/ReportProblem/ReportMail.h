//
//  ReportMail.h
//  ReportProblem
//
//  Created by Peter Huang on 9/28/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReportMail : NSObject

@property (strong, nonatomic) NSString *recipient;
@property (strong, nonatomic) NSString *mailTitle;
@property (strong, nonatomic) NSString *mailBody;
@property (strong, nonatomic) NSArray *attachments;

@end
