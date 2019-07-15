//
//  KLHookTool.h
//  iKaoYan
//
//  Created by wanhong cai on 2017/11/1.
//  Copyright © 2017年 koolearn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHHookTool : NSObject
/**
 交换两个方法
 
 @param cls 当前class
 @param originalSelector originalSelector description
 @param swizzledSelector swizzledSelector description
 @return 返回
 */
+ (BOOL)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end
