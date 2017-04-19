//
//  ProvinceViewCell.m
//  FlipBounced
//
//  Created by MJHee on 2017/4/5.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import "ProvinceViewCell.h"

@interface ProvinceViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *dividerView;

@end

@implementation ProvinceViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dividerView];
    }
    return self;
}

- (void)updateWithTitle:(NSString *)province isSelect:(BOOL)isSelect {
    self.nameLabel.text = province;
    if (isSelect) {
        
        _nameLabel.textColor = UIColorFromRGB(0x3699ff);
    }else {
        _nameLabel.textColor = UIColorFromRGB(0x333333);
    }
}

- (void)layoutSubviews {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(@25);
       make.top.equalTo(@0);
       make.bottom.equalTo(@-0.5);
    }];
    
    [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.bottom.equalTo(@0);
       make.height.equalTo(@0.5);
    }];
}

#pragma mark - lazy
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UIView *)dividerView {
    if (!_dividerView) {
        _dividerView = [[UIView alloc] init];
        _dividerView.backgroundColor = UIColorFromRGB(0xEEEEEE);
    }
    return _dividerView;
}

@end
