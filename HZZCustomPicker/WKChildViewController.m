//
//  WKChildViewController.m
//
//  Created by tgjr-Hzz on 2017/5/23.
//  Copyright © 2017年 Hzz. All rights reserved.
//

//自定义颜色
#define CustomColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#import "WKChildViewController.h"
#import "CustomPickerViewController.h"
#import "UIColor+FlatUI.h"
#import "SQ_FangXingPickerview.h"
#import "UIViewExt.h"
#import "SQCoustomPickerView.h"
@interface WKChildViewController () <SQHouseLeixingPickerViewDelegate,SQCoustomPickerViewDelegate> {

    SQ_FangXingPickerview *picker;
    NSString *fangZhuangXiuBaocun;
    NSString *zxzkID;
}

@end

@implementation WKChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    self.view.backgroundColor=CustomColor(R, G, B, 1);
    
    [self addHouseType];
    [self addCustomPicker];
}

- (void) addHouseType
{
    UILabel *fangxing = [[UILabel alloc] init];
    fangxing.frame = CGRectMake(15, 100, 120, 15);
    fangxing.text = @"房型";
    fangxing.font = [UIFont systemFontOfSize:15.f];
    fangxing.textColor = [UIColor whiteColor];
    [self.view addSubview:fangxing];
  
    NSMutableArray *fangXingSelectArray = [@[@"2",@"1",@"1",@"1"] mutableCopy];
    picker = [[SQ_FangXingPickerview alloc] initWithFrame: CGRectMake(15, fangxing.bottom+20, self.view.frame.size.width-30, 100) AddressData:fangXingSelectArray];
    picker.pickerDelegate = self;
    picker.backgroundColor = [UIColor clearColor];
    [self.view addSubview:picker];
}

- (void) addCustomPicker
{
#pragma mark 房屋类型
    UILabel *zhuangxiu= [[UILabel alloc] init];
    zhuangxiu.frame = CGRectMake(15, picker.bottom+30, 120, 15);
    zhuangxiu.text = @"房屋类型";
    zhuangxiu.font = [UIFont systemFontOfSize:15.f];;
    zhuangxiu.textColor = [UIColor whiteColor];
    [self.view addSubview:zhuangxiu];
    
    NSMutableArray * fnagleixingArray =[@[@{@"id":@1,@"name":@"简装"},@{@"id":@2,@"name":@"毛坯"},@{@"id":@3,@"name":@"精装"},@{@"id":@4,@"name":@"豪装"}] mutableCopy];
    NSString* fangLeiXingBaocun = [fnagleixingArray objectAtIndex:1];
    SQCoustomPickerView *fangwuleixingPicker = [[SQCoustomPickerView alloc] initWithFrame: CGRectMake((self.view.frame.size.width-150)/2, zhuangxiu.bottom+20, 150, 100) AddressData:fnagleixingArray withStr:fangLeiXingBaocun withType:nil];
    fangwuleixingPicker.pickerdelegate = self;
//    fangwuleixingPicker.pickerType =SQHouseFangWuLeiXingType;
    fangwuleixingPicker.backgroundColor = [UIColor clearColor];
    [self.view addSubview:fangwuleixingPicker];
}

#pragma mark -
#pragma mark  SQHousePickerdelegate

- (void)selectCustom:(NSString *)str customId:(NSString *)strID type:(SQHousePickerType)pickertype
{
    
}

@end
