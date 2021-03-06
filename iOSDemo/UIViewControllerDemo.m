//
//  UIViewControllerDemo.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/17.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "UIViewControllerDemo.h"
#import <Flutter/Flutter.h>
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoostPlugin.h>


@interface UIViewControllerDemo ()

@end

@implementation UIViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.title = @"Demo";
}


- (IBAction)pushFlutterPage:(id)sender {
    [DemoRouter.sharedRouter openPage:@"first" params:@{} animated:YES completion:^(BOOL f){
        [FlutterBoostPlugin.sharedInstance onResultForKey:@"result_id_100" resultData:@{} params:@{}];
    }];
}

- (IBAction)present:(id)sender {
    [DemoRouter.sharedRouter openPage:@"second" params:@{@"present":@(YES)} animated:YES completion:^(BOOL f){}];
//    [self dismissViewControllerAnimated:YES completion:completion];
}

@end
