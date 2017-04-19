//
//  FlipBounceView.h
//  FlipBounced
//
//  Created by MJHee on 2017/4/5.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RemoveUpdateViewBlock)();

@interface FlipBounceView : UIView

@property (nonatomic, copy) RemoveUpdateViewBlock removeUpdateViewBlock;

@property (nonatomic, copy) dispatch_block_t foregroundDetermineClickBlock;
@property (nonatomic, copy) dispatch_block_t backgroundDetermineClickBlock;

@property (nonatomic, strong) UITableView *tableView;

-(instancetype)initWithSubjectArray:(NSArray *)subjectArray province:(NSString *)province;

- (void)updateProvince:(NSString *)province;

@end
