//
//  HHFlutterViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/11.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "HHFlutterViewController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface HHFlutterViewController ()<UIGestureRecognizerDelegate>

@end

@implementation HHFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fd_prefersNavigationBarHidden = YES;
    
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
