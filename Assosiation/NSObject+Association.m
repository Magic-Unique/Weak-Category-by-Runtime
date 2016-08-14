//
//  NSObject+Association.m
//  RuntimeWeak
//
//  Created by unique on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "NSObject+Association.h"

#import <objc/runtime.h>

#import "NSObject+Dealloc.h"

static NSMutableDictionary *keyBuffer;

@implementation NSObject (Association)

+ (void)load {
    keyBuffer = [NSMutableDictionary dictionary];
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(NSAssociation)association isAtomic:(BOOL)isAtomic {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        cKey = key.UTF8String;
        keyBuffer[key] = [NSValue valueWithPointer:cKey];
    }
    switch (association) {
        case NSAssociationAssign:
            objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
            break;
        case NSAssociationRetain:
            if (isAtomic) {
                objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_RETAIN);
            } else {
                
                objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            break;
        case NSAssociationCopy:
            if (isAtomic) {
                objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_COPY);
            } else {
                
                objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
            }
            break;
        case NSAssociationWeak:
            [self _setWeakObject:object forKey:key];
            break;
        default:
            break;
    }
}

- (void)_setWeakObject:(id)object forKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    __weak typeof(self) wself = self;
    
    id oldObj = objc_getAssociatedObject(self, cKey);
    [oldObj removeDeallocTaskForTarget:wself key:key];
    
    objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
    [object addDeallocTask:^{
        objc_setAssociatedObject(wself, cKey, nil, OBJC_ASSOCIATION_ASSIGN);
    } forTarget:wself key:key];
}

- (id)associatedObjectForKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        return nil;
    } else {
        return objc_getAssociatedObject(self, cKey);
    }
}

@end
