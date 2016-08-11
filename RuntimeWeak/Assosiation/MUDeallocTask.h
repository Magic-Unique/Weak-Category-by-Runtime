//
//  MUDeallocTask.h
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)(void);

@interface MUDeallocTask : NSObject

- (void)setTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeTaskForTarget:(id)target key:(NSString *)key;

@end
