//
//  ChangeAddressViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "ChangeAddressViewController.h"
#import "AddressCell.h"

@interface ChangeAddressViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ChangeAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)makeUI {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *foot = [[UIView alloc]init];
    foot.backgroundColor = [UIColor whiteColor];
    [self.tableView setTableFooterView:foot];
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ident = @"ident";
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if(cell == nil) {
        cell = [[AddressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}



@end
