//
//  AppleObject.h
//  RuntimeWeak
//
//  Created by TB-Mac-100 on 16/8/11.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppleObject : NSObject

@property (nonatomic, weak) NSObject *sourceObj;

@end
