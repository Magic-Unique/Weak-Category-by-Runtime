//
//  MUValueClass.m
//  Demo-PlanStep-1
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "MUValueClass.h"

@interface MUValueClass ()
{
	__weak id _hostObj;
	SEL _hostWipeSEL;
}

@end

@implementation MUValueClass

- (void)setWeakReference:(id)hostObj forWipeSEL:(SEL)wipeSEL {
	_hostObj = hostObj;
	_hostWipeSEL = wipeSEL;
}

- (void)dealloc {
	// 此处用宏取消 ARC 的警告
#pragma clang diagnostic push	// 创建取消警告域
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	[_hostObj performSelector:_hostWipeSEL withObject:nil];
#pragma clang diagnostic pop	// 关闭取消警告域
}

@end
