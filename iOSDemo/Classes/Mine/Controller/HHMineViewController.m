//
//  HHMineViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/12.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "HHMineViewController.h"
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>

@interface HHMineViewController ()
@property (nonatomic, strong) UIView *containView;
@end

@implementation HHMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self setName:@"tab" params:@{}];
    
    self.containView.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:self.containView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DemoRouter *router = [DemoRouter sharedRouter];
    router.navigationController = self.navigationController;
}

- (UIView *)containView {
    if (_containView == nil) {
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor redColor];
    }
    return _containView;
}

@end
