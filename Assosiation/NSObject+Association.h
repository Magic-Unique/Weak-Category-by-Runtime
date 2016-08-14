//
//  NSObject+Association.h
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NSAssociation) {
    NSAssociationAssign,//       = 0x0001,
    NSAssociationRetain,//       = 0x0010,
    NSAssociationCopy,//         = 0x0100,
    NSAssociationWeak,//         = 0x1000,
};

@interface NSObject (Association)

- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(NSAssociation)association isAtomic:(BOOL)isAtomic;

- (id)associatedObjectForKey:(NSString *)key;

@end
