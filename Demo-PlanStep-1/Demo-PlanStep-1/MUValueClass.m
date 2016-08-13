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
	NSString *_hostKey;
}

@end

@implementation MUValueClass

- (void)setWeakReference:(id)hostObj forKey:(NSString *)key {
	_hostObj = hostObj;
	_hostKey = key;
}

- (void)dealloc {
	[_hostObj performSelector:NSSelectorFromString(_hostKey) withObject:nil];
}

@end
