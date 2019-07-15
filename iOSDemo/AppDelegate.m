//
//  AppDelegate.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/4/4.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "AppDelegate.h"
#import "UIViewControllerDemo.h"
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>
#import "HHFlutterViewController.h"
#import "HHTabBarController.h"

//flutter 跳转到原生

//原生跳转到flutter

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self init1];
    
    return YES;
}

- (void)init1 {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HHTabBarController *mainVC = [[HHTabBarController alloc] init];
    self.window.rootViewController = mainVC;
    
    DemoRouter *router = [DemoRouter sharedRouter];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                        onStart:^(FlutterViewController *fvc) {
                                                            
                                                        }];
}

- (void)init2 {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
    
    
    HHFlutterViewController *fvc = HHFlutterViewController.new;
    [fvc setName:@"tab" params:@{}];
    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
    
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
    
    DemoRouter *router = [DemoRouter sharedRouter];
    router.navigationController = rvc;
    
    tabVC.viewControllers = @[vc,fvc];
    
    
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                        onStart:^(FlutterViewController *fvc) {
                                                            
                                                        }];
    
    
    self.window.rootViewController = rvc;
    
    UIButton *nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nativeButton.frame = CGRectMake(self.window.frame.size.width * 0.5 - 50, 200, 100, 45);
    nativeButton.backgroundColor = [UIColor redColor];
    [nativeButton setTitle:@"push native" forState:UIControlStateNormal];
    [nativeButton addTarget:self action:@selector(pushNative) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:nativeButton];
}

- (void)pushNative
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    [nvc pushViewController:vc animated:YES];
}

@end
