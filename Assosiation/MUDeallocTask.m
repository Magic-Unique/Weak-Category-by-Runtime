//
//  MUDeallocTask.m
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "MUDeallocTask.h"


@interface MUDeallocTaskItem : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) DeallocBlock task;

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(DeallocBlock)task;
+ (instancetype)taskItemWithTarget:(id)target key:(NSString *)key task:(DeallocBlock)task;

@end

@interface MUDeallocTask ()

@property (nonatomic, strong) NSMutableSet<MUDeallocTaskItem *> *taskSet;

@end


@implementation MUDeallocTask

- (void)addTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key {
    MUDeallocTaskItem *taskItem = [MUDeallocTaskItem taskItemWithTarget:target key:key task:task];
    if ([self.taskSet containsObject:taskItem]) {
        [self.taskSet removeObject:taskItem];
    }
    [self.taskSet addObject:taskItem];
}

- (void)removeTaskForTarget:(id)target key:(NSString *)key {
    MUDeallocTaskItem *taskItem = [MUDeallocTaskItem taskItemWithTarget:target key:key task:nil];
    [self.taskSet removeObject:taskItem]; // remove task with method named 'isEqual:'.
}

- (void)dealloc {
    [_taskSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        MUDeallocTaskItem *item = obj;
        !item.task?:item.task(); // run script to clean all weak references to 'self'.
    }];
}

- (NSMutableSet *)taskSet {
    if (!_taskSet) {
        _taskSet = [NSMutableSet set];
    }
    return _taskSet;
}

@end


@implementation MUDeallocTaskItem

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(DeallocBlock)task {
    self = [super init];
    if (self) {
        _target = target;
        _key = key;
        _task = [task copy];
    }
    return self;
}

+ (instancetype)taskItemWithTarget:(id)target key:(NSString *)key task:(DeallocBlock)task {
    return [[self alloc] initWithTarget:target key:key task:task];
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[self class]]) {
        return NO;
    } else {
        MUDeallocTaskItem *another = (MUDeallocTaskItem *)object;
        return [another.target isEqual:self.target] && [another.key isEqualToString:self.key];
    }
}

/**
 *  瞎写一个hash来快速查找
 *
 *  @return NSUInteger
 */
- (NSUInteger)hash {
    NSObject *target = self.target;
    return (target.hash + self.key.hash) / 2;
}

@end

