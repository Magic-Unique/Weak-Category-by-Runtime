//
//  main.m
//  Demo-PlanStep-Release
//
//  Created by 吴双 on 16/8/14.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+SubObj.h"

void scene0() {
	// 场景零，一般情况
	@autoreleasepool {
		NSObject *hostObj = [NSObject new];
		@autoreleasepool {
			NSObject *valueObj = [NSObject new];
			hostObj.subObj = valueObj;
			NSLog(@"SENE-0 set value: %@", hostObj.subObj);
		}
		NSLog(@"SENE-0 after release: %@", hostObj.subObj);
	}
}

void scene1() {
	// 场景一，host 重复设置值
	
	@autoreleasepool {
		// 旧值先销毁
		NSObject *hostObj = NSObject.new;
		NSObject *newValue = NSObject.new;
		@autoreleasepool {
			NSObject *oldValue = NSObject.new;
			hostObj.subObj = oldValue;
			NSLog(@"SENE-1.1 set old value: %@", hostObj.subObj);
			hostObj.subObj = newValue;
			NSLog(@"SENE-1.1 set new value: %@", hostObj.subObj);
		}
		NSLog(@"SENE-1.1 after release old: %@", hostObj.subObj);
	}
	
	NSLog(@"-------------------------");
	
	@autoreleasepool {
		// 新值先销毁
		NSObject *hostObj = NSObject.new;
		NSObject *oldValue = NSObject.new;
		hostObj.subObj = oldValue;
		NSLog(@"SENE-1.2 set old value: %@", hostObj.subObj);
		@autoreleasepool {
			NSObject *newValue = NSObject.new;
			hostObj.subObj = newValue;
			NSLog(@"SENE-1.2 set new value: %@", hostObj.subObj);
		}
		NSLog(@"SENE-1.2 after release new: %@", hostObj.subObj);
	}
}

void scene2() {
	// 场景二 【同 host + 不同属性】
	@autoreleasepool {
		NSObject *hostObj = NSObject.new;
		@autoreleasepool {
			NSObject *valueObj = NSObject.new;
			hostObj.subObj = valueObj;
			hostObj.superObj = valueObj;
			NSLog(@"%@, %@", hostObj.subObj, hostObj.superObj);
		}
		NSLog(@"%@, %@", hostObj.subObj, hostObj.superObj);
	}
}

void scene3() {
	// 场景三 【不同 host + 同属性】
	@autoreleasepool {
		NSObject *hostObj1 = NSObject.new;
		NSObject *hostObj2 = NSObject.new;
		@autoreleasepool {
			NSObject *valueObj = NSObject.new;
			hostObj1.subObj = valueObj;
			hostObj2.subObj = valueObj;
			NSLog(@"%@, %@", hostObj1.subObj, hostObj2.subObj);
		}
		NSLog(@"%@, %@", hostObj1.subObj, hostObj2.subObj);
	}
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		scene2();
	}
    return 0;
}
