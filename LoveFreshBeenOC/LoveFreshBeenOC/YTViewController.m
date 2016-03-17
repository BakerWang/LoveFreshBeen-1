//
//  YTViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "YTViewController.h"

@implementation YTViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewDidLoad {
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
//    back.title = @"返回";
//    self.navigationItem.backBarButtonItem = back;
}


@end
