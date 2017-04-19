//
//  ViewController.m
//  FlipBounced
//
//  Created by MJHee on 2017/4/1.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import "ViewController.h"
#import "FlipBounceView.h"
#import "ProvinceViewCell.h"
#import "ProvinceViewModel.h"


#define WeakSelf __weak typeof(self) weakSelf = self
#define StrongSelf __strong __typeof(self) strongSelf = weakSelf

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) FlipBounceView *bounce;

@property (nonatomic, strong) ProvinceViewModel *selectData;

@property (nonatomic, strong) NSArray<ProvinceViewModel *> *provinceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *provinceArray = @[@{@"name":@"北京市", @"isSelected": @1}, @{@"name":@"上海市", @"isSelected": @0}, @{@"name":@"江苏", @"isSelected": @0}, @{@"name":@"山东", @"isSelected": @0}, @{@"name":@"天津市", @"isSelected": @0}, @{@"name":@"河南省", @"isSelected": @0}, @{@"name":@"厦门", @"isSelected": @0}, @{@"name":@"海南", @"isSelected": @0}];
    NSMutableArray *province = [NSMutableArray array];
    for (int i = 0; i < provinceArray.count; i++) {
        ProvinceViewModel *model = [[ProvinceViewModel alloc] init];
        model.name = provinceArray[i][@"name"];
        model.isSelected = [provinceArray[i][@"isSelected"] boolValue];
        NSLog(@"111model.isSelected = %d", model.isSelected);
        [province addObject:model];
        if (model.isSelected) {
            self.selectData = model;
        }
    }
    self.provinceArray = province;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FlipBounceView *bounce = [[FlipBounceView alloc] initWithSubjectArray:@[@"理科", @"文科", @"不分文理科"] province:[self.selectData.name description].length > 0 ? self.selectData.name : @"北京市"];
    WeakSelf;
    bounce.removeUpdateViewBlock = ^() {
        StrongSelf;
        [strongSelf removeBounceView];
    };
    __weak typeof(bounce) weakBounce = bounce;
    bounce.backgroundDetermineClickBlock = ^() {
        //选中
        NSLog(@"self.selectData = %@", self.selectData);
        [weakBounce updateProvince:self.selectData.name];
    };
    bounce.tableView.delegate = self;
    bounce.tableView.dataSource = self;
    self.bounce = bounce;
}

- (void)removeBounceView {
    [self.bounce removeFromSuperview];
    self.bounce = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.provinceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ProvinceViewCellId = @"ProvinceViewCell";
    
    ProvinceViewModel *model = self.provinceArray[indexPath.row];
 
    ProvinceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProvinceViewCellId];
    if (cell == nil) {
        cell = [[ProvinceViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProvinceViewCellId];
    }
    NSLog(@"model.isSelected = %d", model.isSelected);
    [cell updateWithTitle:model.name isSelect:model.isSelected];
    
    return cell;
}

#pragma mark -  UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProvinceViewModel *model = self.provinceArray[indexPath.row];
    
    if ([self.selectData.name description].length > 0) {
        if ([[self.selectData.name description] isEqualToString: model.name]) {
            
        }else {
            [self.provinceArray enumerateObjectsUsingBlock:^(ProvinceViewModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([[self.selectData.name description] isEqualToString: obj.name]) {
                    obj.isSelected = NO;
                    *stop = YES;
                }
            }];
            model.isSelected = YES;
            self.selectData = model;
        }
    }else {
        
        model.isSelected = YES;
        self.selectData = model;
    }
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

@end
