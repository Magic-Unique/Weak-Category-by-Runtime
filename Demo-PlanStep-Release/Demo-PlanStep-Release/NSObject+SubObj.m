//
//  NSObject+SubObj.m
//  Demo-PlanStep-Release
//
//  Created by 吴双 on 16/8/14.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "NSObject+SubObj.h"
#import "MUAssosiation.h"

@implementation NSObject (SubObj)

- (void)setSubObj:(NSObject *)subObj {
	[self setAssociatedObject:subObj forKey:@"subObj" association:NSAssociationWeak isAtomic:NO];
}

- (NSObject *)subObj {
	return [self associatedObjectForKey:@"subObj"];
}

- (void)setSuperObj:(NSObject *)superObj {
	[self setAssociatedObject:superObj forKey:@"superObj" association:NSAssociationWeak isAtomic:NO];
}

- (NSObject *)superObj {
	return [self associatedObjectForKey:@"superObj"];
}

@end
