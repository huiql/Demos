//
//  TextViewController.m
//  Demo3
//
//  Created by quanlinghui on 2025/5/7.
//

#import "TextViewController.h"
#import <objc/runtime.h>

@interface TextViewController ()
@property (nonatomic, copy) void (^myblock)(void);
@property (nonatomic, strong) NSMutableArray *mutableArray;
@property (nonatomic, strong) NSString *jjjjj;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSMutableArray *muArray;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.muArray = [NSMutableArray array];
    // Do any additional setup after loading the view.
    self.myblock = ^{
//        self.mutableArray = [NSMutableArray array];
//        for (int i = 0; i<10000; i++) {
//            [self.mutableArray addObject:@"捡垃圾塑料袋附件阿基德发啦久啊老师街坊邻居阿克苏两节课垃圾舒服多了久啊了解啦健身房垃圾啊逻辑算法的离开家阿里科技师范离开家阿拉法久啊两件事垃圾啊三六九等发啦结束啦放大机阿拉科技大"];
//        }
        
        for (int i = 0 ; i<10000; i++) {
            TextViewController *view = [[TextViewController alloc] init];
            [self.muArray addObject:view];
        }
        
        self.jjjjj = @"asljf垃圾啊龙卷风倒垃圾";
    };
    self.view.backgroundColor = UIColor.orangeColor;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 100, 100, 50);
    self.button.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc {
    
}

- (void)buttonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.myblock();
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        self.myblock();
    [self getMetaClass];
}

- (void)getMetaClass {
    Class personClass = [TextViewController class];
    Class personMetaClass = object_getClass(personClass); // 获取 Person 的元类

    NSLog(@"TextViewController 的元类: %@", personMetaClass);
    NSLog(@"TextViewController 元类的 isa: %@", object_getClass(personMetaClass)); // 输出 NSObject 的元类
    NSLog(@"TextViewController 元类的 superclass: %@", [personMetaClass superclass]); // 输出 NSObject 的元类（如果 Person 直接继承 NSObject）
    
    printMethodsOfClass(personMetaClass, YES);
}

// 打印类或元类的方法列表
void printMethodsOfClass(Class targetClass, BOOL isMetaClass) {
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(targetClass, &methodCount);
    
    NSLog(@"===== %@%@的方法列表（共 %d 个）=====",
          NSStringFromClass(targetClass),
          isMetaClass ? @" 的元类" : @"",
          methodCount);
    
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL methodName = method_getName(methods[i]);
        NSLog(@"%@", NSStringFromSelector(methodName));
    }
    
    free(methods); // 释放内存
}


@end
