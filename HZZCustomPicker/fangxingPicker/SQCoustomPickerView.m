//
//  SQCoustomPickerView.m
//  sqjr
//
//  Created by tgjr-Hzz on 16/10/12.
//  Copyright © 2016年 Hzz. All rights reserved.
//

#import "SQCoustomPickerView.h"
#define SQ_SCREEN_HEIGHT                [[UIScreen mainScreen] bounds].size.height
#define SQ_SCREEN_WIDTH                 [[UIScreen mainScreen] bounds].size.width
#import "UIColor+FlatUI.h"
#import "UIPickerView+WS_Extension.h"
#import "Masonry.h"

#define iOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

@implementation SQCoustomPickerView

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData ;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [NSMutableArray arrayWithArray:addressData];
        self.thePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
        [self.thePickerView clearSpearatorLine];
        self.thePickerView.dataSource = self;
        self.thePickerView.delegate = self;
        self.thePickerView.showsSelectionIndicator = YES;
        self.thePickerView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.thePickerView];
        [self setBottomLine];
    }
    return self;
}

- (void)setBottomLine{
    
    UIImageView *businessStylePickerLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sq_xiaoshou_xian"]];
    businessStylePickerLine.userInteractionEnabled = YES;
    [self addSubview:businessStylePickerLine];
    self.businessStylePickerLine = businessStylePickerLine;
    
    [businessStylePickerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iOS9) {
            make.centerY.equalTo(self.thePickerView).offset(15);
        }
        else{
            make.bottom.equalTo(self.thePickerView).offset(-2);
        }
        
        make.centerX.equalTo(self.thePickerView);
    }];
    
}

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData withStr:(NSInteger )row
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [NSMutableArray arrayWithArray:addressData];
        self.thePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self.thePickerView clearSpearatorLine];
        self.thePickerView.dataSource = self;
        self.thePickerView.delegate = self;
        self.thePickerView.showsSelectionIndicator = YES;
        self.thePickerView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.thePickerView];
        selectRow = row;
        [self.thePickerView selectRow:selectRow inComponent:0 animated:YES];
        [self setBottomLine];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame AddressData:(id)addressData withStr:(NSString *)str withType:(NSString *)strType
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
        idArray = [[NSMutableArray alloc] init];
        self.thePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
        self.thePickerView.dataSource = self;
        self.thePickerView.delegate = self;
        self.thePickerView.showsSelectionIndicator = YES;
        self.thePickerView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.thePickerView];
        [self setBottomLine];
        for (NSDictionary *dic in addressData) {
            [self.dataArray addObject:[dic objectForKey:@"name"]];
            [idArray addObject:[dic objectForKey:@"id"]];
        }
        if (strType) {
            if ([idArray containsObject:str]) {
                selectRow = [idArray indexOfObject:str];
            } else {
                selectRow = 1;
            }
            [self.thePickerView selectRow:selectRow inComponent:0 animated:YES];
        } else {
            if ([self.dataArray containsObject:str]) {
                selectRow = [self.dataArray indexOfObject:str];
                [self.thePickerView selectRow:selectRow inComponent:0 animated:YES];
            } else {
                selectRow = 1;
                [self.thePickerView selectRow:selectRow inComponent:0 animated:YES];
            }
        }
    }
    return self;
}

#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    [pickerView clearSpearatorLine];
    return [self.dataArray count];
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    return 100;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    string = [self.dataArray objectAtIndex:row];
    selectRow = row;
    [pickerView selectRow:row inComponent:component animated:NO];
    [pickerView reloadComponent:component];
    
    if (_pickerdelegate && [_pickerdelegate respondsToSelector:@selector(selectCustom:customId:type:)]) {
        [_pickerdelegate selectCustom:string customId:[idArray objectAtIndex:row] type:_pickerType];
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    [pickerView clearSpearatorLine];
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        if (selectRow == row) {
            if(self.contentLabelFont)
            {
                pickerLabel.textColor = [UIColor whiteColor];
                pickerLabel.font = [UIFont systemFontOfSize:self.contentLabelFont];
            }
            else
            {
                pickerLabel.textColor = [UIColor whiteColor];
                pickerLabel.font = [UIFont systemFontOfSize:22.f];
            }
            
        } else {
            if(self.contentLabelFont)
            {
                pickerLabel.textColor = [UIColor whiteColor];
                pickerLabel.font = [UIFont systemFontOfSize:self.contentLabelFont-8];
            }
            else
            {
                pickerLabel.textColor = [UIColor whiteColor];
                pickerLabel.font = [UIFont systemFontOfSize:16.f];
            }
            
        }
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

@end
