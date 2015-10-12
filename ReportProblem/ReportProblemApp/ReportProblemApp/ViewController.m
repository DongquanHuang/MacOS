//
//  ViewController.m
//  ReportProblemApp
//
//  Created by Peter Huang on 9/29/15.
//  Copyright (c) 2015 HDQ. All rights reserved.
//

#import "ViewController.h"

typedef void (*SetClientVersionPtr)(NSString *);
typedef void (*ShowReportProblemDialogPtr)();

@interface ViewController () {
    SetClientVersionPtr setClientVersion;
    ShowReportProblemDialogPtr showReportProblemDialog;
}

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
    
    [self setClientVersion];
    [self showReportDialog];
    
//    NSStoryboard *sb = [NSStoryboard storyboardWithName:[self storyboardNameForReportProblemBundle] bundle:bundle];
//    self.reportProblemWindowController = [sb instantiateInitialController];
//    [self.reportProblemWindowController showWindow:self];
}

- (NSString *)reportProblemBundleNameString {
    return @"ReportProblem";
}

- (NSString *)storyboardNameForReportProblemBundle {
    return @"ReportProblem";
}

- (NSString *)reportProblemBundlePath {
    return [[NSBundle mainBundle] pathForResource:[self reportProblemBundleNameString] ofType:@"bundle"];
}

- (void *)getFunctionPointerWithName:(NSString *)functionName fromBundle:(NSString *)bundlePath {
    NSURL *cfBundleURL = [NSURL fileURLWithPath:bundlePath];
    CFBundleRef cfBundle = CFBundleCreate(kCFAllocatorDefault, (CFURLRef)cfBundleURL);
    
    return CFBundleGetFunctionPointerForName(cfBundle, (__bridge CFStringRef)functionName);
}

- (void)setClientVersion {
    setClientVersion = [self getFunctionPointerWithName:@"SetWbxClientVersion" fromBundle:[self reportProblemBundlePath]];
    setClientVersion(@"1.0.0");
}

- (void)showReportDialog {
    showReportProblemDialog = [self getFunctionPointerWithName:@"ShowReportProblemDialog" fromBundle:[self reportProblemBundlePath]];
    showReportProblemDialog();
}

@end
