//
//  YTNavigationController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "YTNavigationController.h"

@implementation YTNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
//    back.title = @"返回";
//    self.navigationItem.backBarButtonItem = back;
    
    [self setUpNavBarTheme];
    
}

- (void)setUpNavBarTheme
{
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:253/255.0 green:207/255.0 blue:11/255.0 alpha:1.0]];

}



@end
