//
//  NSObject+MUWeakTask.m
//  Demo-PlanStep-2
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "NSObject+MUWeakTask.h"
#import "MUWeakTask.h"
#import <objc/runtime.h>

@implementation NSObject (MUWeakTask)

static const char kWeakTask = '0';

- (void)setWeakReferenceTask:(TaskBlock)task {
	MUWeakTask *weakTask = [MUWeakTask taskWithTaskBlock:task];
	objc_setAssociatedObject(self, &kWeakTask, weakTask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
