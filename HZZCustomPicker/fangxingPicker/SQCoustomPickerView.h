//
//  SQCoustomPickerView.h
//  sqjr
//
//  Created by tgjr-Hzz on 16/10/12.
//  Copyright © 2016年 Hzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SQHouseFangXingType = 0,
    SQHouseFangWuLeiXingType,
    SQHouseZhuangXiuType,
    SQOneType,
    SQXSFangZhiyeType,
    SQXSFangPeiouZhiyeType,
    SQXSJieKuanYTType,
    SQXSFangLeiXingType,
    SQXSCheGpsTpye,
    sqChangeHouseTpye,
    sqChangeCarTpye,
    sqChangeHouse,
    sqRebatePeriods,
}SQHousePickerType;

@protocol SQCoustomPickerViewDelegate <NSObject>

- (void) selectCustom:(NSString *)str customId:(NSString *)strID type:(SQHousePickerType )pickertype;

@end

@interface SQCoustomPickerView : UIView <
UIPickerViewDelegate
, UIPickerViewDataSource
>{
    NSMutableArray *idArray;
    NSString *string;
    NSInteger selectRow;
}

@property (nonatomic, assign) id <SQCoustomPickerViewDelegate> pickerdelegate;
@property (nonatomic, assign) SQHousePickerType pickerType;
@property (nonatomic, strong) NSString *rowStr;
@property (nonatomic,strong)NSMutableArray* dataArray;
@property (nonatomic,strong)UIPickerView *thePickerView;
@property (nonatomic,weak)UIImageView *businessStylePickerLine;
@property (nonatomic, assign) CGFloat contentLabelFont;

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData ;
- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData withStr:(NSString *)str withType:(NSString *)strType;
- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData withStr:(NSInteger )row;
//- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData withStr:(NSString *)str;

@end
