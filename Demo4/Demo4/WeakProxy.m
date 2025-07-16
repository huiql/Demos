//
//  WeakProxy.m
//  Demo4
//
//  Created by quanlinghui on 2025/7/12.
//

#import "WeakProxy.h"
@interface WeakProxy ()
@property (nonatomic, weak, readonly) id target;
@end



@implementation WeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    return [[ self alloc] initWithTarget:target];
}

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.target methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self.target respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.target];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSDictionary *jjj;
}


@end
