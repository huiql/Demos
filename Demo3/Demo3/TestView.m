//
//  TestView.m
//  Demo3
//
//  Created by quanlinghui on 2025/4/25.
//

#import "TestView.h"

@implementation TestView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.alpha < 0.001 || self.hidden == YES || self.userInteractionEnabled == NO) {
        return nil;
    }
    
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    __block UIView *findView;
    [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint subPoint = [obj convertPoint:point fromView:self];
        BOOL contailn = [obj pointInside:subPoint withEvent:event];
        if (contailn) {
            findView = obj;
            *stop = YES;
        }
    }];
    
    return findView;
    
    
}


@end
