//
//  ADViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "ADViewController.h"
#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://img01.bqstatic.com/upload/activity/2016011111271981.jpg"];
    [imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(image == nil){
            [self loadMainPage];
        }
        
    }];
    [self.view addSubview:imageView];
    
    [self performSelector:@selector(loadMainPage) withObject:nil afterDelay:1.f];
    

    
    // Do any additional setup after loading the view.
}

-(void)loadMainPage {
    //广告显示3秒之后进入
    ViewController *vc = [[ViewController alloc]init];
    
   
    [UIView transitionFromView:self.view toView:vc.view duration:0.f options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    }];
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
