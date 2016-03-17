//
//  MainViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "MainViewController.h"
#import "YTScanCodeViewController.h"
#import "MySearchViewController.h"
#import "ChangeAddressViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
//    back.title = @"返回";
//    self.navigationItem.backBarButtonItem = back;
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIImage *image = [[UIImage imageNamed:@"icon_black_scancode.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(scanCode:)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIImage *search = [[UIImage imageNamed:@"icon_search.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:search style:UIBarButtonItemStylePlain target:self action:@selector(searchResults:)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50,28,100,34);
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitle:@"人民大会堂" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeAddress:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = btn;
    
    // Do any additional setup after loading the view.
}
-(void)changeAddress:(UIButton *)btn {
    ChangeAddressViewController *address = [[ChangeAddressViewController alloc]init];
    [self.navigationController pushViewController:address animated:YES];
    
}

- (void)scanCode:(UIBarButtonItem *)item {
    YTScanCodeViewController *scan = [[YTScanCodeViewController alloc]init];
    [self.navigationController pushViewController:scan animated:YES];
}

- (void)searchResults:(UIBarButtonItem *)searchItem {
    MySearchViewController *mySearch = [[MySearchViewController alloc]init];
    [self.navigationController pushViewController:mySearch animated:YES];
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
