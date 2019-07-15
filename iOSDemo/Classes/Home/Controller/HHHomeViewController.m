//
//  HHHomeViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/12.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "HHHomeViewController.h"
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>

@interface HHHomeViewController ()

@end

@implementation HHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DemoRouter *router = [DemoRouter sharedRouter];
    router.navigationController = self.navigationController;
}

- (IBAction)SkipFlutterPage:(UIButton *)sender {
    [DemoRouter.sharedRouter openPage:@"first" params:@{} animated:YES completion:^(BOOL f){
//        [FlutterBoostPlugin.sharedInstance onResultForKey:@"result_id_100" resultData:@{} params:@{}];
    }];
}

- (IBAction)PresentFlutterPage:(UIButton *)sender {
    [DemoRouter.sharedRouter openPage:@"second" params:@{@"present":@(YES)} animated:YES completion:^(BOOL f){}];
}

@end
