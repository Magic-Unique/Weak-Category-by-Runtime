//
//  MUDeallocTask.h
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)(void);

@interface MUDeallocTask : NSObject

- (void)addTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeTaskForTarget:(id)target key:(NSString *)key;

@end
