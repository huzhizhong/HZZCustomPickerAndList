//
//  SQ_FangXingPickerview.m
//  sqjr
//
//  Created by tgjr-Hzz on 16/12/5.
//  Copyright © 2016年 Hzz. All rights reserved.
//

#import "SQ_FangXingPickerview.h"
#define SQ_SCREEN_HEIGHT                [[UIScreen mainScreen] bounds].size.height
#define SQ_SCREEN_WIDTH                 [[UIScreen mainScreen] bounds].size.width
#import "UIColor+FlatUI.h"
#import "UIPickerView+WS_Extension.h"

@interface SQ_FangXingPickerview()

@property (nonatomic, strong) UILabel *shiLabel;
@property (nonatomic, strong) UILabel *tingLabel;
@property (nonatomic, strong) UILabel *chuLabel;
@property (nonatomic, strong) UILabel *weiLabel;

@end

@implementation SQ_FangXingPickerview

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData;
{
    self = [super initWithFrame:frame];
    if (self) {
        dataArray = [NSMutableArray arrayWithArray:addressData];
        arr1 = [[NSMutableArray alloc]init];
        for (NSInteger i=0; i<=9; i++) {
            NSString *datastr = [NSString stringWithFormat:@"%ld",i];
            [arr1 addObject:datastr];
        }
        arr2 = [[NSMutableArray alloc]init];
        for (NSInteger i=0; i<=9; i++) {
            NSString *datastr = [NSString stringWithFormat:@"%ld",i];
            [arr2 addObject:datastr];
        }
        arr3 = [[NSMutableArray alloc]init];
        for (NSInteger i=0; i<=9; i++) {
            NSString *datastr = [NSString stringWithFormat:@"%ld",i];
            [arr3 addObject:datastr];
        }
        arr4 = [[NSMutableArray alloc]init];
        for (NSInteger i=0; i<=9; i++) {
            NSString *datastr = [NSString stringWithFormat:@"%ld",i];
            [arr4 addObject:datastr];
        }
        
        thePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SQ_SCREEN_WIDTH-30, 100)];
        thePickerView.dataSource = self;
        thePickerView.delegate = self;
        thePickerView.showsSelectionIndicator = YES;
        thePickerView.backgroundColor = [UIColor clearColor];
        [self addSubview:thePickerView];
        

        if ([addressData count]) {
            selectRow1 = [[dataArray objectAtIndex:0] integerValue];
            selectRow2 = [[dataArray objectAtIndex:1] integerValue];
            selectRow3 = [[dataArray objectAtIndex:2] integerValue];
            selectRow4 = [[dataArray objectAtIndex:3] integerValue];
        } else {
            selectRow1 = 1;selectRow2 = 0;selectRow3 = 0;selectRow4 = 0;
        }
        [thePickerView selectRow:selectRow1 inComponent:0 animated:YES];
        [thePickerView selectRow:selectRow2  inComponent:1 animated:YES];
        [thePickerView selectRow:selectRow3 inComponent:2 animated:YES];
        [thePickerView selectRow:selectRow4  inComponent:3 animated:YES];
        
        self.shiLabel.frame = (CGRect){self.frame.size.width *0.25 -22 ,thePickerView.frame.size.height *0.5 -10 , 20,20};
        self.shiLabel.font = [UIFont systemFontOfSize:13.0f];
        self.shiLabel.textColor = [UIColor whiteColor];
        [thePickerView addSubview:self.shiLabel];
        
        self.tingLabel.frame = (CGRect){self.frame.size.width *0.25*2 -30,thePickerView.frame.size.height *0.5 -10 , 20,20};
        self.tingLabel.font = [UIFont systemFontOfSize:13.0f];
        self.tingLabel.textColor = [UIColor whiteColor];
        [thePickerView addSubview:self.tingLabel];
        
        self.chuLabel.frame = (CGRect){self.frame.size.width *0.25*3 -40,thePickerView.frame.size.height *0.5 -10 , 20,20};
        self.chuLabel.font = [UIFont systemFontOfSize:13.0f];
        self.chuLabel.textColor = [UIColor whiteColor];
        [thePickerView addSubview:self.chuLabel];
        
        self.weiLabel.frame = (CGRect){self.frame.size.width *0.25*4 -50,thePickerView.frame.size.height *0.5 -10 , 20,20};
        self.weiLabel.font = [UIFont systemFontOfSize:13.0f];
        self.weiLabel.textColor = [UIColor whiteColor];
        [thePickerView addSubview:self.weiLabel];
    }
    return self;
}

- (UILabel *)shiLabel
{
    if (!_shiLabel) {
        _shiLabel = [[UILabel alloc] init];
        _shiLabel.text = @"室";
    }
    return _shiLabel;
}

- (UILabel *)tingLabel
{
    if (!_tingLabel) {
        _tingLabel = [[UILabel alloc] init];
        _tingLabel.text = @"厅";
    }
    return _tingLabel;
}

- (UILabel *)chuLabel
{
    if (!_chuLabel) {
        _chuLabel = [[UILabel alloc] init];
        _chuLabel.text = @"厨";
    }
    return _chuLabel;
}

- (UILabel *)weiLabel
{
    if (!_weiLabel) {
        _weiLabel = [[UILabel alloc] init];
        _weiLabel.text = @"卫";
    }
    return _weiLabel;
}


#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [arr1 count];
            break;
        case 1:
            return [arr2 count];
            break;
        case 2:
            return [arr3 count];
            break;
        case 3:
            return [arr4 count];
            break;
            
        default:
            break;
    }
    return 0;
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    return (SQ_SCREEN_WIDTH-80)/4;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [arr1 objectAtIndex:row];
            break;
        case 1:
            return [arr2 objectAtIndex:row];
            break;
        case 2:
            return [arr3 objectAtIndex:row];
            break;
        case 3:
            return [arr4 objectAtIndex:row];
            break;
            
        default:
            break;
    }
    sting1 = [arr1 objectAtIndex:row];
    sting2 = [arr2 objectAtIndex:row];
    sting3 = [arr3 objectAtIndex:row];
    sting4 = [arr4 objectAtIndex:row];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [arr addObject:sting1];
    [arr addObject:sting2];
    [arr addObject:sting3];
    [arr addObject:sting4];
    if (_pickerDelegate && [_pickerDelegate respondsToSelector:@selector(selectFangXing:)]) {
        [_pickerDelegate selectFangXing:arr];
    }

    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:{
            sting1 = [arr1 objectAtIndex:row];
            selectRow1 = row;
            break;
        }
        case 1:{
            sting2 = [arr2 objectAtIndex:row];
            selectRow2 = row;
            break;
        }
        case 2:{
            sting3 = [arr3 objectAtIndex:row];
            selectRow3 = row;
            break;
        }
        case 3:{
            sting4 = [arr4 objectAtIndex:row];
            selectRow4 = row;
            break;
        }
        default:
            break;
    }
    sting1 = [arr1 objectAtIndex:selectRow1];
    sting2 = [arr2 objectAtIndex:selectRow2];
    sting3 = [arr3 objectAtIndex:selectRow3];
    sting4 = [arr4 objectAtIndex:selectRow4];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [arr addObject:sting1];
    [arr addObject:sting2];
    [arr addObject:sting3];
    [arr addObject:sting4];
    if (_pickerDelegate && [_pickerDelegate respondsToSelector:@selector(selectFangXing:)]) {
        [_pickerDelegate selectFangXing:arr];
    }
    [pickerView selectRow:row inComponent:component animated:NO];
    [pickerView reloadComponent:component];
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    [pickerView clearSpearatorLine];
    UILabel *myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SQ_SCREEN_WIDTH/4, 30)];
    myView.backgroundColor = [UIColor clearColor];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.font = [UIFont systemFontOfSize:13];
    myView.textColor = [UIColor colorFromHexCode:@"999999"];
    if (component == 0) {
        myView.text = [arr1 objectAtIndex:row] ;
        if (selectRow1 == row) {
            myView.font = [UIFont systemFontOfSize:24.f];
            myView.textColor = [UIColor whiteColor];
        }
    }
   else if (component == 1) {
        myView.text = [arr2 objectAtIndex:row] ;
       if (selectRow2 == row) {
           myView.font = [UIFont systemFontOfSize:24.f];
           myView.textColor = [UIColor whiteColor];
       }
    }
   else if (component == 2) {
        myView.text = [arr3 objectAtIndex:row] ;
       if (selectRow3 == row) {
           myView.font = [UIFont systemFontOfSize:24.f];
           myView.textColor = [UIColor whiteColor];
       }

    }
   else if (component == 3) {
        myView.text = [arr4 objectAtIndex:row] ;
       if (selectRow4 == row) {
           myView.font = [UIFont systemFontOfSize:24.f];
           myView.textColor = [UIColor whiteColor];
       }
    }
    return myView;
    
}
//返回指定列，行的高度，就是自定义行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 25.0f;
}

@end
