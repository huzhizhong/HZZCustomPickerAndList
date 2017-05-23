//
//  UIPickerView+WS_Extension.m
//  sqjr
//
//  Created by zwtx on 16/11/22.
//  Copyright © 2016年 Hzz. All rights reserved.
//

#import "UIPickerView+WS_Extension.h"

@implementation UIPickerView (WS_Extension)
- (void)clearSpearatorLine
{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.frame.size.height < 1)
        {
            [obj setBackgroundColor:[UIColor clearColor]];
            [obj setHidden:YES];
        }
    }];
}
@end
