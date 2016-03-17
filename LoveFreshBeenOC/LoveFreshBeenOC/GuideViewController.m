//
//  GuideViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "GuideViewController.h"
#import "ViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *imageArray = @[@"guide_40_1.png",@"guide_40_2.png",@"guide_40_3.png",@"guide_40_4.png"];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, self.view.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    for(int i=0;i<imageArray.count;i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        img.image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        [scrollView addSubview:img];
        if(i == 3) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(self.view.frame.size.width/2-48,self.view.frame.size.height-130,100,50);
            [btn setImage:[UIImage imageNamed:@"icon_next.png"] forState:UIControlStateNormal];
            img.userInteractionEnabled = YES;
            [img addSubview:btn];
            [btn addTarget:self action:@selector(goToMainVC:) forControlEvents:UIControlEventTouchUpInside];
        }
    }

    // Do any additional setup after loading the view.
}
-(void)goToMainVC:(UIButton *)btn {
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
