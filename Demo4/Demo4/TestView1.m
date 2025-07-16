//
//  TestView1.m
//  Demo4
//
//  Created by quanlinghui on 2025/7/14.
//

#import "TestView1.h"
#import "TextView2.h"

@implementation TestView1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        TextView2 *textview2 = [[TextView2 alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        textview2.backgroundColor = UIColor.greenColor;
        [self addSubview:textview2];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            textview2.frame = CGRectMake(0, 0, 70, 45);
        });
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"%@", @"layoutSubviews");
}

@end
