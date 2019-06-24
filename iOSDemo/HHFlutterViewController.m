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

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
