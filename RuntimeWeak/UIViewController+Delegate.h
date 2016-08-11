//
//  UIViewController+Delegate.h
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewControllerDelegate <NSObject>

- (void)viewControllerViewDidLoad:(UIViewController *)viewController;

@end

@interface UIViewController (Delegate)

@property (nonatomic, weak) id<UIViewControllerDelegate> delegate;

@end
