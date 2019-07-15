//
//  UINavigationController+HHExtension.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/7/12.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "UINavigationController+HHExtension.h"
#import "HHHookTool.h"

@implementation UINavigationController (HHExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HHHookTool swizzlingInClass:[self class] originalSelector:@selector(pushViewController:animated:) swizzledSelector:@selector(kl_pushViewController:animated:)];
    });
}

/**
 push时隐藏tabbar
 */
- (void)kl_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self kl_pushViewController:viewController animated:animated];
}

@end
