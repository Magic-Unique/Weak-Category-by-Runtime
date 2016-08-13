//
//  NSObject+MUWeakTask.h
//  Demo-PlanStep-2
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TaskBlock)(void);

@interface NSObject (MUWeakTask)

- (void)setWeakReferenceTask:(TaskBlock)task;

@end
