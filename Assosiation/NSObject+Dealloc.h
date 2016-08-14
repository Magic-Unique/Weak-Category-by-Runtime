//
//  NSObject+Dealloc.h
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)(void);

@interface NSObject (Dealloc)

- (void)addDeallocTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key;

@end
