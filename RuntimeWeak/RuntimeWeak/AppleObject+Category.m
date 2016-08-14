//
//  AppleObject+Category.m
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "AppleObject+Category.h"

#import <objc/runtime.h>

#import "NSObject+Association.h"

@implementation AppleObject (Category)

//static const char kCateObj = '0';

- (void)setCateObj:(NSObject *)cateObj {
    //objc_setAssociatedObject(self, &kCateObj, cateObj, OBJC_ASSOCIATION_ASSIGN);
    [self setAssociatedObject:cateObj forKey:@"cateObj" association:NSAssociationWeak isAtomic:YES];
}

- (NSObject *)cateObj {
    //return objc_getAssociatedObject(self, &kCateObj);
    return [self associatedObjectForKey:@"cateObj"];
}

@end
