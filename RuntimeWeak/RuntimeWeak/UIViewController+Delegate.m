//
//  UIViewController+Delegate.m
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "UIViewController+Delegate.h"

#import "NSObject+Association.h"

@implementation UIViewController (Delegate)

- (void)setDelegate:(id<UIViewControllerDelegate>)delegate {
    [self setAssociatedObject:delegate forKey:@"delegate" association:NSAssociationWeak isAtomic:YES];
}

- (id<UIViewControllerDelegate>)delegate {
    return [self associatedObjectForKey:@"delegate"];
}

@end
