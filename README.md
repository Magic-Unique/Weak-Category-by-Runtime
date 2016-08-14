# Weak-Category-by-Runtime

A tool to create weakly property in category. **explain**

一个在分类中创建弱引用属性的工具，**原文链接**。

## USAGE 使用

```objective-c
// in a category...

#import "MUAssociation.h"

// @property (nonatomic, weak) id someProperty; // write in .h file

@implementation SomeClass (SomeCategory)
  
- (void)setSomeProperty:(id)someProperty {
	[self setAssociatedObject:someProperty forKey:@"someProperty" association:NSAssociationWeak isAtomic:NO];
}

- (id)someProperty {
	return [self associatedObjectForKey:@"someProperty"];
}

@end
```

