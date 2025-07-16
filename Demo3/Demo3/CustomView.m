//
//  CustomView.m
//  Demo3
//
//  Created by quanlinghui on 2025/4/3.
//

#import "CustomView.h"

@interface CustomView ()
@property (nonatomic, assign) int number1;
@end

@implementation CustomView

- (void)jjjjj {
    while (self.number1 < 5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.number1 ++;
        });
    }
    NSLog(@"%d", self.number1);
}

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"哈哈";self.layer.delegate;
        [UIView animateWithDuration:2 animations:^{
            self.name = @"哈哈";self.layer.delegate;
        }];
    }
    return self;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.alpha < 0.01 || self.hidden == YES || self.userInteractionEnabled == NO) {
        return nil;
    }
    
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    for (UIView * subView in [self.subviews reverseObjectEnumerator]) {
        CGPoint subViewPoint = [subView convertPoint:point fromView:self];
        if ([subView pointInside:subViewPoint withEvent:event]) {
            return [subView hitTest:subViewPoint withEvent:event];
        }
    }
    return self;
}


- (void)dealloc {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
