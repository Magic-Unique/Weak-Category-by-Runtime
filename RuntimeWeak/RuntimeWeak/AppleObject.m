//
//  AppleObject.m
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "AppleObject.h"

@implementation AppleObject

- (void)dealloc {
    NSLog(@"%s:%@", __FUNCTION__, self);
}

@end
