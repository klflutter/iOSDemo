//
//  ViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/11.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "ViewController.h"
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Demo";
    
    DemoRouter *router = [DemoRouter sharedRouter];
    router.navigationController = self.navigationController;

    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                        onStart:^(FlutterViewController *fvc) {

                                                        }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [DemoRouter.sharedRouter openPage:@"first" params:@{} animated:YES completion:^(BOOL f){
        [FlutterBoostPlugin.sharedInstance onResultForKey:@"result_id_100" resultData:@{} params:@{}];
    }];
}

@end
