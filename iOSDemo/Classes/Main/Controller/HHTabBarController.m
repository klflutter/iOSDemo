//
//  HHTabBarController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/11.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "HHTabBarController.h"
#import "ViewController.h"
#import <flutter_boost/FlutterBoost.h>
#import "HHMineViewController.h"
#import "HHHomeViewController.h"

@interface HHTabBarController ()

@end

@implementation HHTabBarController

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加子控制器
    [self p_addChildVCWithController:[[HHHomeViewController alloc] init] title:@"原生" norImageName:@"room" selectedImageName:@"room_select"];
    [self p_addChildVCWithController:[[HHMineViewController alloc] init] title:@"Flutter" norImageName:@"mine" selectedImageName:@"mine_select"];

    //2.设置tabbar文字颜色
    self.tabBar.tintColor = [UIColor colorWithRed:73.0f/255.0f green:132.0f/255.0f blue:244.0f/255.0f alpha:1.0f];
}

#pragma mark - Private
/**
 *  设置指定控制器的相关属性
 */
- (void)p_addChildVCWithController:(UIViewController *)vc  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName{
    // 设置标题
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    // 设置默认图片
    vc.tabBarItem.image = [UIImage imageNamed:norImageName];
    // 设置选中图片
    vc.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImageName];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)dealloc {
    NSLog(@"%@-释放了",self.class);
}
@end
