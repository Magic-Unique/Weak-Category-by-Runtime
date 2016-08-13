//
//  MUValueClass.h
//  Demo-PlanStep-1
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

// 这是值对象的实现

#import <Foundation/Foundation.h>

@interface MUValueClass : NSObject

- (void)setWeakReference:(id)hostObj forWipeSEL:(SEL)wipeSEL;

@end
