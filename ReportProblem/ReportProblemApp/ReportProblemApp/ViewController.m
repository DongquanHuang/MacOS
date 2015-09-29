//
//  ViewController.m
//  ReportProblemApp
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSWindowController *reportProblemWindowController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)report:(NSButton *)sender {
    //NSString *fullPath = @"../../../ReportProblem/build/Debug/ReportProblem.bundle";
    NSBundle *bundle;
    NSString *reportProblemBundlePath = [[NSBundle mainBundle] pathForResource:[self reportProblemBundleNameString] ofType:@"bundle"];
    
    bundle = [NSBundle bundleWithPath:reportProblemBundlePath];
    [bundle load];
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:[self storyboardNameForReportProblemBundle] bundle:bundle];
    self.reportProblemWindowController = [sb instantiateInitialController];
    [self.reportProblemWindowController showWindow:self];
}

- (NSString *)reportProblemBundleNameString {
    return @"ReportProblem";
}

- (NSString *)storyboardNameForReportProblemBundle {
    return @"ReportProblem";
}

@end
