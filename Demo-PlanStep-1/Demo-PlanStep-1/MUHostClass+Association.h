//
//  MUHostClass+Association.h
//  Demo-PlanStep-1
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "MUHostClass.h"
#import "MUValueClass.h"

@interface MUHostClass (Association)

@property (nonatomic, weak) MUValueClass *valueObject;

@end
