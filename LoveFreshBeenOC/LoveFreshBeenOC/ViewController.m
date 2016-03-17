//
//  ViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "MineViewController.h"
#import "GouWuViewController.h"
#import "MarketViewController.h"
#import "YTNavigationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.automaticallyAdjustsScrollViewInsets = NO;

    
    [self initWithChildViewControllers];
    [self changeTabBarApprance];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changeTabBarApprance {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor grayColor];
    UITabBarItem  *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:dict forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    
}

- (void)initWithChildViewControllers {
    
    MainViewController *main = [[MainViewController alloc]init];
    [self addChildViewController:main title:@"首页" image:@"v2_home.png" selectedImage:@"v2_home_r.png"];
    
    MarketViewController *market = [[MarketViewController alloc]init];
    [self addChildViewController:market title:@"闪电超市" image:@"v2_order.png" selectedImage:@"v2_order_r.png"];
    
    GouWuViewController *gouWu = [[GouWuViewController alloc]init];
    [self addChildViewController:gouWu title:@"购物车" image:@"shopCart.png" selectedImage:@"shopCart_r.png"];
    
    MineViewController *mine = [[MineViewController alloc]init];
    [self addChildViewController:mine title:@"我的" image:@"v2_my.png" selectedImage:@"v2_my_r.png"];
    
    
}

- (void)addChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    
    YTNavigationController *nav = [[YTNavigationController alloc]initWithRootViewController:childVC];

    UIImage *nomalImage = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:nomalImage selectedImage:selectedImage];
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
