//
//  Caculator.m
//  Demo4
//
//  Created by quanlinghui on 2025/6/26.
//

#import "Caculator.h"

@interface Caculator ()
@property (nonatomic, copy) NSMutableDictionary *servicesDict;
@end

@implementation Caculator

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super init]) {
//
//    }
//    return self;
//}


- (NSMutableDictionary *)servicesDict {
    if (!_servicesDict) {
        _servicesDict = [NSMutableDictionary dictionary];
    }
    return _servicesDict;
}
- (instancetype)init {
    if (self = [super init]) {
//        self.cacuSyms = @[@"+", @"-", @"*", @"/"];
    }
    return self;
}

//- (float)caculateWithOriStr:(NSString *)OriStr {
//    if (!OriStr.length) {
//        return nil;
//    }
//
//    CGFloat jjj;
//    NSMutableArray *strArray = [NSMutableArray array];
//    for (int i = 0; i<OriStr.length; i++) {
//        [strArray addObject:[OriStr substringWithRange:NSMakeRange(i, 1)]];
//    }
//
//    __block NSInteger symIndex;
//
//    [self.cacuSyms enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([strArray containsObject:obj]) {
//            symIndex = idx;
//            *stop = YES;
//        };
//    }];
//
//
//
//
//}

//- (void)caculateValue:(NSString *)symIndex oriStr:(NSString *)oriStr {
//    NSString *sym = [oriStr substringWithRange:NSMakeRange(symIndex, 0)];
//    NSString *former = [oriStr substringToIndex:symIndex];
//    NSString *after = [oriStr substringFromIndex:symIndex];
//
//    if ([sym isEqualToString:@"+"]) {
//        return for;
//    }
//}

- (void)registerWithName:(NSString *)name service:(id)service {
    if (![self.servicesDict objectForKey:name]) {
        [self.servicesDict setObject:service forKey:name];
    }
}


@end
