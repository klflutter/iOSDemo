//
//  KLHookTool.m
//  iKaoYan
//
//  Created by wanhong cai on 2017/11/1.
//  Copyright © 2017年 koolearn. All rights reserved.
//

#import "HHHookTool.h"
#import <objc/runtime.h>

@implementation HHHookTool
+ (BOOL)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    return didAddMethod;
}
@end
