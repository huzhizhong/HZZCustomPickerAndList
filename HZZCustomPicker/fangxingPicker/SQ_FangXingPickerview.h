//
//  SQ_FangXingPickerview.h
//  sqjr
//
//  Created by tgjr-Hzz on 16/12/5.
//  Copyright © 2016年 Hzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SQHouseLeixingPickerViewDelegate <NSObject>

-(void) selectFangXing:(NSMutableArray *)selectArray;

@end

@interface SQ_FangXingPickerview : UIView  <
UIPickerViewDelegate
, UIPickerViewDataSource
>{
    NSMutableArray *dataArray;
    
    UIPickerView *thePickerView;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    
    NSString *sting1;
    NSString *sting2;
    NSString *sting3;
    NSString *sting4;
    
    NSInteger selectRow1;
    NSInteger selectRow2;
    NSInteger selectRow3;
    NSInteger selectRow4;
    NSInteger selectRow;
}

@property (nonatomic, assign) id <SQHouseLeixingPickerViewDelegate> pickerDelegate;

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData;

@end
