//
//
//  Created by tgjr-Hzz on 2017/5/23.
//  Copyright © 2017年 Hzz. All rights reserved.
//

#import "ViewController.h"

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SKOrangeColor    [UIColor colorWithRed:250/255. green:50/255. blue:100/255. alpha:1]
#import "TitleScrollView.h"
#import "WKChildViewController.h"
#import "UIView+Frame.h"
#import "UIColor+FlatUI.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *contentView;
@property (nonatomic,strong)TitleScrollView *titleScroll;
@property (nonatomic,strong)NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"HZZCustomPicker";
    
    self.titleArr=@[@"标签1",@"标签2",@"标签3",@"标签4",@"标签5"];
    [self addChildViewControllers];
    [self setupContentView];
}

#pragma mark - 懒加载 设置顶部标签栏  选如果你需要平分界面 scrollEnable 设为 NO lineEqualWidth ->YES  紧挨着  scrollEnable-->YES   lineEqualWidth-->NO
- (TitleScrollView *)titleScroll
{
    if (!_titleScroll)
    {
        WS(weakSelf)
        _titleScroll = [[TitleScrollView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, 47)  TitleArray:self.titleArr selectedIndex:0 scrollEnable:NO lineEqualWidth:YES selectColor:SKOrangeColor defaultColor:[UIColor colorFromHexCode:@"0ea3f0"] SelectBlock:^(NSInteger index) {
            [weakSelf titleClick:index];
        }];
        _titleScroll.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_titleScroll];
    }
    return _titleScroll;
}

#pragma mark 底部的scrollview
-(void)setupContentView {
    //不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = CGRectMake(0, self.titleScroll.height, ScreenWidth, ScreenHeight);
    contentView.delegate = self;
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    
    self.contentView = contentView;
    self.contentView.contentOffset = CGPointMake(0*ScreenWidth, 0);
    //添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
    
}
#pragma mark 便签栏按钮点击
-(void)titleClick:(NSInteger)index {
    //滚动,切换子控制器
    CGPoint offset = self.contentView.contentOffset;
    offset.x = index * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //添加子控制器的view
    //当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;//设置控制器的y值为0(默认为20)
    vc.view.height = scrollView.height;//设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
    [scrollView addSubview:vc.view];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    //当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //点击butto
    [self.titleScroll setSelectedIndex:index];
}



-(void)addChildViewControllers{
    for (int i = 0; i < self.titleArr.count; i++) {
        WKChildViewController *child = [[WKChildViewController alloc]init];
        child.index = i;
        [self addChildViewController:child];
    }
}


@end
