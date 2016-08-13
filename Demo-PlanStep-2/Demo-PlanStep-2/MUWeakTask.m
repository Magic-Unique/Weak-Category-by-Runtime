//
//  MUWeakTask.m
//  Demo-PlanStep-2
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "MUWeakTask.h"

@implementation MUWeakTask

- (instancetype)initWithTaskBlock:(TaskBlock)taskBlock {
	self = [super init];
	if (self) {
		_taskBlock = [taskBlock copy];
	}
	return self;
}

+ (instancetype)taskWithTaskBlock:(TaskBlock)taskBlock {
	return [[self alloc] initWithTaskBlock:taskBlock];
}

- (void)dealloc {
	if (self.taskBlock) {
		self.taskBlock();
	}
}

@end
