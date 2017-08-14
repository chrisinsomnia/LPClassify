//
//  XTabbarViewController.m
//  classify
//
//  Created by Chris Xu on 2017/8/11.
//  Copyright © 2017年 Chris Xu. All rights reserved.
//

#import "XTabbarViewController.h"
#import "classifyViewController.h"

@interface XTabbarViewController ()

@end

@implementation XTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *c1 = [[UIViewController alloc]init];
    c1.view.backgroundColor = [UIColor redColor];
    c1.tabBarItem.title = @"123";
    [self addChildViewController:c1];
    
    classifyViewController *classVc = [[classifyViewController alloc]init];
    classVc.tabBarItem.title = @"分类";
    [self addChildViewController:classVc];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
