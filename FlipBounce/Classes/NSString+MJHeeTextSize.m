//
//  NSString+MJHeeTextSize.m
//  zgzzzs
//
//  Created by MJHee on 16/4/26.
//  Copyright © 2016年 中国自主招生网. All rights reserved.
//

#import "NSString+MJHeeTextSize.h"

@implementation NSString (MJHeeTextSize)
//返回字符串所占用的尺寸.
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}
@end
