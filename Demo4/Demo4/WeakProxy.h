//
//  WeakProxy.h
//  Demo4
//
//  Created by quanlinghui on 2025/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSObject

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
