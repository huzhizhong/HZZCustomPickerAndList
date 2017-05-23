//
//  CustomPickerViewController.m
//  HZZCustomPicker
//
//  Created by tgjr-Hzz on 2017/5/23.
//  Copyright © 2017年 Hzz. All rights reserved.
//

#import "CustomPickerViewController.h"
#define CustomColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface CustomPickerViewController ()

@end

@implementation CustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    self.view.backgroundColor=CustomColor(R, G, B, 1);

}


@end
