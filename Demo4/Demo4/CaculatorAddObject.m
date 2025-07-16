//
//  CaculatorAddObject.m
//  Demo4
//
//  Created by quanlinghui on 2025/6/27.
//

#import "CaculatorAddObject.h"

@implementation CaculatorAddObject

- (NSInteger)caculate:(NSString *)left right:(NSString *)right {
    return [left integerValue] + [right integerValue];
}

@end
