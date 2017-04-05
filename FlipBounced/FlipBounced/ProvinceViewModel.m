//
//  ProvinceViewModel.m
//  FlipBounced
//
//  Created by MJHee on 2017/4/5.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import "ProvinceViewModel.h"

@implementation ProvinceViewModel

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"value"]) {
        [super setValue:value forKey:@"name"];
    }
    [super setValue:value forKey:key];
}

@end
