//
//  ViewController.m
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ViewController.h"

#import "AppleObject+Category.h"
#import "UIViewController+Delegate.h"

/**
 *  关联对象：key、policy
 *  容器类: isEqual:比较法
 */

@interface ViewController () <UIViewControllerDelegate>

@property (nonatomic, strong) AppleObject *big;

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.delegate viewControllerViewDidLoad:self];
	NSString *name = @"name";
	NSString *newName = [@"na" stringByAppendingString:@"me"];
	NSLog(@"%p, %p", name.UTF8String, newName.UTF8String);
}

- (void)viewControllerViewDidLoad:(UIViewController *)viewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.btn.frame = CGRectMake(0, 0, self.view.bounds.size.width / 2, self.view.frame.size.height / 2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"before:%p", self.big.cateObj);
    @autoreleasepool {
        AppleObject *new = [[AppleObject alloc] init];
        self.big.cateObj = new;
        NSLog(@"doing:%p", self.big.cateObj);
    }
    NSLog(@"after 0s:%p", self.big.cateObj);
}

- (void)btnClick {
    NSLog(@"%s", __FUNCTION__);
}

- (void)btnTouch {
    NSLog(@"%s", __FUNCTION__);
}

- (AppleObject *)big {
    if (!_big) {
        _big = [[AppleObject alloc] init];
    }
    return _big;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"button" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}


@end
