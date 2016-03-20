//
//  AddressCell.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "AddressCell.h"
#import "Masonry.h"

@implementation AddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        self.nameLab = [[UILabel alloc]init];
        self.nameLab.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.nameLab];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.superview).offset(10);
            make.top.equalTo(self.nameLab.superview).offset(12);
            make.width.greaterThanOrEqualTo(@30);
            make.height.equalTo(@(28));
        }];
        
        
        self.telePhoneLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.telePhoneLab];
        [self.telePhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.telePhoneLab.superview).offset(10);
            make.left.equalTo(self.nameLab.mas_right).offset(8);
            make.width.greaterThanOrEqualTo(@40);
            make.height.equalTo(@(30));
            
        }];
        
        self.addressLab = [[UILabel alloc]init];
        self.addressLab.font = [UIFont systemFontOfSize:13];
        self.addressLab.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0];
        [self.contentView addSubview:self.addressLab];
        
        
        
    }
    return self;
    
}

-(void)configWithModel:(AddressModel *)model {
//    self.nameLab.text = model.tex
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
