//
//  NSObject+SubObj.h
//  Demo-PlanStep-Release
//
//  Created by 吴双 on 16/8/14.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SubObj)

@property (nonatomic, weak) NSObject *subObj;

@property (nonatomic, weak) NSObject *superObj;

@end
