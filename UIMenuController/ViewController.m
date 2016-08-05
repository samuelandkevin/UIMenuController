//
//  ViewController.m
//  UIMenuController
//
//  Created by YHIOS002 on 16/8/5.
//  Copyright © 2016年 YHSoft. All rights reserved.
//  控制器作为第一响应者

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"控制器作为第一响应者";
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
    [self.view addSubview:label];
    self.label = label;
}

/**
 * 说明控制器可以成为第一响应者
 * 因为控制器是因为比较特殊的对象,它找控制器的方法,不找label的方法
 */
- (BOOL)canBecomeFirstResponder{
    return YES;
}

/**
 * 通过这个方法告诉UIMenuController它内部应该显示什么内容
 * 返回YES，就代表支持action这个操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    NSLog(@"%@",NSStringFromSelector(action));
    if (action == @selector(cut:)
        || action == @selector(copy:)
        || action == @selector(paste:))
    {
        return YES;
    }
    return YES;
}

//监听事情需要对应的方法 冒号之后传入的是UIMenuController
- (void)cut:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}

- (void)copy:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}

- (void)paste:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}


#pragma mark - Gesture
- (void)labelClick{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    CGRect rect = CGRectMake(0, 0, self.label.bounds.size.width,0);
    [menu setTargetRect:rect inView:self.label];
    [menu setMenuVisible:YES animated:YES];
}

#pragma mark - Life


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
