//
//  NSObject+Dealloc.m
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "NSObject+Dealloc.h"

#import <objc/runtime.h>

#import "MUDeallocTask.h"

@implementation NSObject (Dealloc)

static const char kTask = '0';

- (MUDeallocTask *)deallocTask {
    MUDeallocTask *task = objc_getAssociatedObject(self, &kTask);
    if (!task) {
        task = [MUDeallocTask new];
        objc_setAssociatedObject(self, &kTask, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return task;
}

- (void)addDeallocTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key {
    [self.deallocTask addTask:task forTarget:target key:key];
}

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key {
    [self.deallocTask removeTaskForTarget:target key:key];
}

@end
