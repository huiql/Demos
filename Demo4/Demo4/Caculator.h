//
//  Caculator.h
//  Demo4
//
//  Created by quanlinghui on 2025/6/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CaculatorProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Caculator : NSObject

//- (CGFloat)caculateWithOriStr:(NSString *)OriStr;

//- (void)registerWithName:(NSString *)name service:(id)service;
//
//
//- (void)serviceForKey:(NSString *)key;


@property (nonatomic, strong) id<CaculatorProtocol> service;

@end

NS_ASSUME_NONNULL_END
