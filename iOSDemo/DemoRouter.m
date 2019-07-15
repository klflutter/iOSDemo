//
//  DemoRouter.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/22.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>
#import "HHFlutterViewController.h"
#import "HHLoginViewController.h"

@implementation DemoRouter

+ (DemoRouter *)sharedRouter
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion
{
    if([params[@"present"] boolValue]){
        HHFlutterViewController *vc = HHFlutterViewController.new;
        [vc setName:name params:params];
        [self.navigationController presentViewController:vc animated:animated completion:^{
            if(completion) completion(YES);
        }];
    }
    else{
        HHFlutterViewController *vc = HHFlutterViewController.new;
        [vc setName:name params:params];
        [self.navigationController pushViewController:vc animated:animated];
        if(completion) completion(YES);
    }
    
//    if ([name isEqualToString:@"hh://nativeLoginPage"]) {
//        HHLoginViewController *loginVC = [[HHLoginViewController alloc] init];
//        [self.navigationController presentViewController:loginVC animated:animated completion:^{
//            if(completion) completion(YES);
//        }];
//    }
}

- (BOOL)accessibilityEnable
{
    return YES;
}


- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    HHFlutterViewController *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}

- (void)flutterCanPop:(BOOL)canpop {
    self.navigationController.interactivePopGestureRecognizer.enabled = !canpop;
}

@end
