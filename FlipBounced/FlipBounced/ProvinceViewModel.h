//
//  ProvinceViewModel.h
//  FlipBounced
//
//  Created by MJHee on 2017/4/5.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceViewModel : NSObject
/** id */
@property (strong, nonatomic) NSString *id;
/** 名称 */
@property (strong, nonatomic) NSString *name;
/** 是否被选中 */
@property (nonatomic, assign) BOOL isSelected;

@end
