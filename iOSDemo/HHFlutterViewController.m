//
//  HHFlutterViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/6/24.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "HHFlutterViewController.h"

@interface HHFlutterViewController ()

@end

@implementation HHFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    if (!parent) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.engine destroyContext];
        });
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
