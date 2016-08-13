//
//  MUHostClass+Association.m
//  Demo-PlanStep-2
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "MUHostClass+Association.h"
#import <objc/runtime.h>
#import "NSObject+MUWeakTask.h"

@implementation MUHostClass (Association)

const static char kValueObject = '0';

- (void)setValueObject:(MUValueClass *)valueObject {
	objc_setAssociatedObject(self, &kValueObject, valueObject, OBJC_ASSOCIATION_ASSIGN);
	__weak typeof(self) wself = self;
	[valueObject setWeakReferenceTask:^{
		objc_setAssociatedObject(wself, &kValueObject, nil, OBJC_ASSOCIATION_ASSIGN);
	}];
}

- (MUValueClass *)valueObject {
	return objc_getAssociatedObject(self, &kValueObject);
}

@end
