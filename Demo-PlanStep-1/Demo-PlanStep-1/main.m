//
//  main.m
//  Demo-PlanStep-1
//
//  Created by 吴双 on 16/8/13.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUHostClass+Association.h"


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		MUHostClass *hostObj = [MUHostClass new];
		@autoreleasepool {
			MUValueClass *valueObj = [MUValueClass new];
			hostObj.valueObject = valueObj;
			NSLog(@"%@", hostObj.valueObject);
		}
		NSLog(@"%@", hostObj.valueObject);
	}
    return 0;
}
