//
//  FlipBounceView.m
//  FlipBounced
//
//  Created by MJHee on 2017/4/5.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import "FlipBounceView.h"


@interface FlipBounceView ()<CAAnimationDelegate>

/**
 *  前视图-view
 */
@property(nonatomic, strong) UIView *foregroundView;

/**
 *  前视图-背景图片
 */
@property(nonatomic, strong) UIImageView *backImg;

/**
 *  前视图-底部 View
 */
@property(nonatomic, strong) UIView *bottomView;

/**
 *  前视图-文理科选择数组
 */
@property(nonatomic, strong) NSArray<NSString *> *subjectArray;
@property(nonatomic, strong) UIView *subjectBtnsView;
@property(nonatomic, strong) UIButton *selectSubject;

/**
 *  前视图-考试分数输入框
 */
@property(nonatomic, strong) UIView *scoreView;
@property(nonatomic, strong) UIImageView *scoreIcon;
@property(nonatomic, strong) UITextField *scoreLabel;
/**
 *  前视图-城市点击选择框
 */
@property(nonatomic, strong) UIView *provinceView;
@property(nonatomic, strong) UIImageView *provinceIcon;
@property(nonatomic, strong) UILabel *provinceLabel;

/**
 *  前视图-确定按钮
 */
@property(nonatomic, strong) UIButton *foregroundDetermineBtn;

/**
 *  关闭按钮
 */
@property(nonatomic, strong) UIButton *closeBtn;

/**
 *  蒙版
 */
@property(nonatomic, strong) UIView *backView;

/**
 *  背面view
 */
@property(nonatomic, strong) UIView *backgroundView;

/**
 *  确定按钮
 */
@property(nonatomic, strong) UIButton *backgroundDetermineBtn;

@end

@implementation FlipBounceView {
    CGFloat HEIGHT;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(instancetype)initWithSubjectArray:(NSArray *)subjectArray province:(NSString *)province
{
    self = [super init];
    if (self) {
        self.subjectArray = subjectArray;
            
        HEIGHT = 340;
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
        [self.backView addGestureRecognizer:tap1];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
        self.backImg.userInteractionEnabled = YES;
        [self.backImg addGestureRecognizer:tap2];
        
        self.frame = [self getViewFrame];
        self.backgroundColor = [UIColor clearColor];
        [self show];
        [self addSubview:self.foregroundView];
        [self.foregroundView addSubview:self.backImg];
        [self.foregroundView addSubview:self.bottomView];
        [self roundedHandle];
        
        [self.bottomView addSubview:self.subjectBtnsView];
        
        [self.bottomView addSubview:self.scoreView];
        [self.scoreView addSubview:self.scoreIcon];
        [self.scoreView addSubview:self.scoreLabel];
        
        [self.bottomView addSubview:self.provinceView];
        [self.provinceView addSubview:self.provinceIcon];
        [self.provinceView addSubview:self.provinceLabel];
        
        [self.bottomView addSubview:self.foregroundDetermineBtn];
        
        [self.backView addSubview:self.closeBtn];
        [WindowView addSubview:self.backView];
        [WindowView bringSubviewToFront:self];
        
        [self addSubview:self.backgroundView];
        [self.backgroundView addSubview:self.tableView];
        [self.backgroundView addSubview:self.backgroundDetermineBtn];
        self.backgroundView.hidden = YES;
        
        if (province.length > 0) {
            self.provinceLabel.text = province;
        }
    }
    
    return self;
}

- (void)updateProvince:(NSString *)province {
    if (province.length > 0) {
        self.provinceLabel.text = province;
    }
}

-(void)layoutSubviews
{
    
    WeakSelf;
    [self.foregroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];
    
    [self.backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.height.mas_equalTo(ImgHeight);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.equalTo(strongSelf.backImg.mas_bottom).offset(-1);
        make.left.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
////
    [self.subjectBtnsView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(@25);
       make.left.equalTo(@19);
       make.right.equalTo(@-19);
       make.height.equalTo(@24);
    }];
////
    [self.scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.equalTo(strongSelf.subjectBtnsView.mas_bottom).offset(25);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@40);
    }];
    
    [self.scoreIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.height.equalTo(@15);
        make.width.equalTo(@10);
        make.centerY.equalTo(@0);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.equalTo(@0);
        make.left.equalTo(strongSelf.scoreIcon.mas_right).offset(6.5);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
////
    [self.provinceView mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.equalTo(strongSelf.scoreView.mas_bottom).offset(10);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@40);
    }];
    
    [self.provinceIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@8);
        make.height.equalTo(@15);
        make.width.equalTo(@15);
        make.centerY.equalTo(@0);
    }];
    
    [self.provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.equalTo(@0);
        make.left.equalTo(strongSelf.provinceIcon.mas_right).offset(6.5);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
////
    [self.foregroundDetermineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.left.equalTo(strongSelf.bottomView.mas_left).offset(20);
        make.right.equalTo(strongSelf.bottomView.mas_right).offset(-20);
        make.bottom.equalTo(strongSelf.bottomView.mas_bottom).offset(-18);
        make.height.mas_equalTo(40);
    }];
////
    if (DT_IS_IPHONE5 || DT_IS_IPHONE4) {

        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            StrongSelf;
            make.top.equalTo(strongSelf.mas_bottom).offset(20);
            make.width.height.mas_equalTo(30);
            make.centerX.equalTo(@0);
        }];
    }else {
    
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            StrongSelf;
            make.top.equalTo(strongSelf.mas_bottom).offset(40);
            make.width.height.mas_equalTo(30);
            make.centerX.equalTo(@0);
        }];
    }
////
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(WindowView);
    }];

    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];
    
    [self.backgroundDetermineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@-10);
        make.height.equalTo(@40);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongSelf;
        make.top.left.right.equalTo(@0);
        make.bottom.equalTo(strongSelf.backgroundDetermineBtn.mas_top).offset(-10);
    }];
    
}

- (void)roundedHandle {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, WIDTH, HEIGHT - ImgHeight) byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, WIDTH, HEIGHT - ImgHeight);
    maskLayer.path = maskPath.CGPath;
    maskLayer.strokeColor = [UIColor whiteColor].CGColor;
    maskLayer.lineWidth = 0.1;
    self.bottomView.layer.mask = maskLayer;
}

-(CGRect)getViewFrame
{
    CGRect frame = CGRectZero;
    frame.size.height = HEIGHT;
    frame.size.width = WIDTH;
    frame.origin.x = (kScreenW - WIDTH)/2;
    frame.origin.y = (kScreenH - HEIGHT + 17)/2 + SPACE;
    return frame;
}

- (void)setSubjectArray:(NSArray<NSString *> *)subjectArray {
    [self.subjectBtnsView removeFromSuperview];
    self.subjectBtnsView = nil;
    
    __block CGFloat x = 0;
    CGFloat margin = 10.5;
    
    [subjectArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.cornerRadius = 12;
        btn.layer.masksToBounds = YES;
        [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [btn setBackgroundColor:UIColorFromRGB(0xf4f4f4)];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.subjectBtnsView addSubview:btn];
        [btn addTarget:self action:@selector(selectSubject:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = (idx + 666666);
        
        if (idx == 0) {
            self.selectSubject = btn;
            [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
            [btn setBackgroundColor:UIColorFromRGB(0x3699ff)];
        }
        
        CGFloat width = [obj sizeWithFont:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, 24)].width;
        width += 22;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(x);
            make.width.mas_equalTo(width);
            make.top.bottom.equalTo(@0);
        }];
        x += (width + margin);
        
    }];
}

#pragma mark - action

- (void)keyboardHide {
    [self.scoreLabel resignFirstResponder];
}

- (void)removeView
{
    [UIView animateWithDuration:0.25 animations:^{
        [self setFrame:CGRectMake((kScreenW - WIDTH)/2, kScreenH, WIDTH, HEIGHT)];
    } completion:^(BOOL finished) {
        [self.backView removeFromSuperview];
        self.backView = nil;
        [self removeFromSuperview];
        if (self.removeUpdateViewBlock) {
            self.removeUpdateViewBlock();
        }
    }];
}

- (void)selectSubject: (UIButton *)btn {
    [self keyboardHide];

    if (self.selectSubject != nil) {
        
        if (self.selectSubject.tag == btn.tag) {
            
        }else {
            
            [self.selectSubject setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
            [self.selectSubject setBackgroundColor:UIColorFromRGB(0xf4f4f4)];
            
            [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
            [btn setBackgroundColor:UIColorFromRGB(0x3699ff)];
        }
        
        self.selectSubject = btn;
    }
    
}

- (void)foregroundDetermineClick
{
//    [self keyboardHide];
//    if (self.foregroundDetermineClickBlock) {
//        self.foregroundDetermineClickBlock();
//    }
//    [self removeView];
    
    
    NSLog(@"selectSubject.title = %@, score = %@, province = %@", self.selectSubject.titleLabel.text, self.scoreLabel.text, self.provinceLabel.text);
}

- (void)flipForegroundView {
    [self keyboardHide];
    //翻转
    //动画开始
    [UIView beginAnimations:@"doflip" context:nil];
    //时长
    [UIView setAnimationDuration:1];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
    //动画结束
    [UIView commitAnimations];
    self.foregroundView.hidden = YES;
    self.backgroundView.hidden = NO;
}

- (void)flipBackgroundView {
    //翻转
    //动画开始
    [UIView beginAnimations:@"doflip" context:nil];
    //时长
    [UIView setAnimationDuration:1];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    //动画结束
    [UIView commitAnimations];
    self.foregroundView.hidden = NO;
    self.backgroundView.hidden = YES;
}


- (void)show
{
    [WindowView addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        
        self.frame = CGRectMake((kScreenW - WIDTH)/2, (kScreenH - HEIGHT + 17)/2, WIDTH, HEIGHT);
    }];
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    [animation setDelegate:self];
    animation.values = @[@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(0)];
    animation.duration = 0.5;
    [animation setKeyPath:@"transform.rotation"];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
}

- (void)backgroundDetermineBtnClick {
    [self flipBackgroundView];
    if (self.backgroundDetermineClickBlock) {
        self.backgroundDetermineClickBlock();
    }
}
//分数最多输入3位数
- (void)textFieldDidChange:(UITextField *)textField {
     if (textField == self.scoreLabel) {
        if (textField.text.length > 3) {
            textField.text = [textField.text substringToIndex:3];
        }
    }
}

#pragma mark - 懒加载

-(UIImageView *)backImg{
    if (!_backImg) {
        _backImg = [[UIImageView alloc] init];
        _backImg.image = [UIImage imageNamed:@"fuceng"];
    }
    return _backImg;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIView *)subjectBtnsView {
    if (!_subjectBtnsView) {
        _subjectBtnsView = [[UIView alloc] init];
        _subjectBtnsView.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return _subjectBtnsView;
}

- (UIView *)scoreView{
    if (!_scoreView) {
        _scoreView = [[UIView alloc] init];
        _scoreView.backgroundColor = UIColorFromRGB(0xf4f4f4);
        _scoreView.layer.cornerRadius = 5;
        _scoreView.layer.masksToBounds = YES;
    }
    return _scoreView;
}

- (UIImageView *)scoreIcon {
    if (!_scoreIcon) {
        _scoreIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"score_icon"]];
    }
    return _scoreIcon;
}

- (UITextField *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UITextField alloc] init];
        _scoreLabel.attributedPlaceholder = [[NSAttributedString alloc] initWithString: @"输入考试分数" attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x999999), NSFontAttributeName: [UIFont systemFontOfSize:14]}];
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        _scoreLabel.keyboardType = UIKeyboardTypeNumberPad;
        [_scoreLabel addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _scoreLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _scoreLabel;
}

- (UIView *)provinceView{
    if (!_provinceView) {
        _provinceView = [[UIView alloc] init];
        _provinceView.backgroundColor = UIColorFromRGB(0xf4f4f4);
        _provinceView.layer.cornerRadius = 5;
        _provinceView.layer.masksToBounds = YES;
    }
    return _provinceView;
}

- (UIImageView *)provinceIcon {
    if (!_provinceIcon) {
        _provinceIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dingwei_icon"]];
    }
    return _provinceIcon;
}

- (UILabel *)provinceLabel {
    if (!_provinceLabel) {
        _provinceLabel = [[UILabel alloc] init];
        _provinceLabel.font = [UIFont systemFontOfSize:14];
        _provinceLabel.textColor = UIColorFromRGB(0x333333);
        _provinceLabel.text = @"北京市";
        _provinceLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipForegroundView)];
        [_provinceLabel addGestureRecognizer:tap];
    }
    return _provinceLabel;
}

-(UIButton *)foregroundDetermineBtn
{
    if (_foregroundDetermineBtn == nil) {
        _foregroundDetermineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_foregroundDetermineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_foregroundDetermineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _foregroundDetermineBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _foregroundDetermineBtn.backgroundColor = UIColorFromRGB(0x3699ff);
        _foregroundDetermineBtn.layer.cornerRadius = 2;
        _foregroundDetermineBtn.layer.masksToBounds = YES;
        [_foregroundDetermineBtn addTarget:self action:@selector(foregroundDetermineClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _foregroundDetermineBtn;
}

-(UIButton *)closeBtn
{
    if (_closeBtn == nil) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UIView *)backView
{
    if (_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.2f;
        _backView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _backView;
}

- (UIView *)foregroundView {
    if (!_foregroundView) {
        _foregroundView = [[UIView alloc] init];
    }
    return _foregroundView;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor whiteColor];
        _backgroundView.layer.cornerRadius = 5;
        _backgroundView.layer.masksToBounds = YES;
    }
    return _backgroundView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.backgroundView addSubview:_tableView];
    }
    return _tableView;
}

-(UIButton *)backgroundDetermineBtn
{
    if (!_backgroundDetermineBtn) {
        _backgroundDetermineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backgroundDetermineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_backgroundDetermineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _backgroundDetermineBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _backgroundDetermineBtn.backgroundColor = UIColorFromRGB(0x3699ff);
        _backgroundDetermineBtn.layer.cornerRadius = 2;
        _backgroundDetermineBtn.layer.masksToBounds = YES;
        [_backgroundDetermineBtn addTarget:self action:@selector(backgroundDetermineBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundDetermineBtn;
}


@end
