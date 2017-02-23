//
//  ViewController.m
//  TanchuangZhezao
//
//  Created by xia on 2017/2/22.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>{
    NSArray *titleArray;
}

@property (nonatomic, strong) UIView *zheZhaoView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation ViewController

- (UIView *)zheZhaoView{
    if (_zheZhaoView) {
        return _zheZhaoView;
    }
    _zheZhaoView = [[UIView alloc] init];
    _zheZhaoView.backgroundColor = [UIColor blackColor];
    _zheZhaoView.alpha = 0.6f;
    return  _zheZhaoView;
}

- (UIView *)topView{
    if (_topView) {
        return _topView;
    }
    _topView = [[UIView alloc] init];
    _topView.backgroundColor = [UIColor whiteColor];
    return  _topView;
}

- (UIView *)centerView{
    if (_centerView) {
        return _centerView;
    }
    _centerView = [[UIView alloc] init];
    _centerView.backgroundColor = [UIColor whiteColor];
    return  _centerView;
}

- (UIView *)bottomView{
    if (_bottomView) {
        return _bottomView;
    }
    _bottomView = [[UIView alloc] init];
    _bottomView.backgroundColor = [UIColor whiteColor];
    return  _bottomView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    titleArray = @[@"顶部弹窗 - 遮罩",@"中间弹窗 - 遮罩",@"底部弹窗 - 遮罩"];
    
    float buttonWidth = self.view.frame.size.width/3;
    UIColor *titleColor = [UIColor colorWithRed:0/255.0f green:143/255.0f blue:232/255.0f alpha:1.0f];
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *titleButton = [[UIButton alloc] init];
        titleButton.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, 50);
        titleButton.backgroundColor = [UIColor blackColor];
        titleButton.tag = i + 100;
        [titleButton setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:titleColor forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [titleButton addTarget:self action:@selector(titleButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:titleButton];
    }
    [self setViewWithFrame];
    //添加手势，触摸遮罩层时隐藏视图
    /*
     * UI轻击手势识别器 UITapGestureRecognizer
     
     * UI捏合手势识别器 UIPinchGestureRecognizer
     
     * UI旋转手势识别器 UIRotationGestureRecognizer
     
     * UI滑动手势识别器 UISwipeGestureRecognizer
     
     * UI平移手势识别器 UIPanGestureRecognizer
     
     * UI屏幕边缘平移手势识别器 UIScreenEdgePanGestureRecognizer
     
     * UI长按手势识别器 UILongPressGestureRecognizer
     */
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zheZhao:)];
    tgr.delegate = self;
    [self.zheZhaoView addGestureRecognizer:tgr];
}

- (void)titleButtonOnclick:(UIButton *)sender{
    if (self.titleButton.tag != sender.tag) {
        self.titleButton.selected = NO;
        self.titleButton = sender;
    }
    self.titleButton.selected = YES;
    self.zheZhaoView.hidden = NO;
    switch (sender.tag) {
        case 100:
            self.topView.hidden = NO;
            break;
            
        case 101:
            self.centerView.hidden = NO;
            break;
            
        case 102:
            self.bottomView.hidden = NO;
            break;
    }
}

- (void)zheZhao:(UITapGestureRecognizer *)pgr{
    if (!self.zheZhaoView.hidden) {
        [self subViewisShow];
    }
}

- (void)setViewWithFrame{
    self.zheZhaoView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.topView.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height*0.3);
    self.centerView.frame = CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.4, self.view.frame.size.width*0.4, self.view.frame.size.height*0.2);
    self.bottomView.frame = CGRectMake(0, self.view.frame.size.height*0.7, self.view.frame.size.width, self.view.frame.size.height*0.3);
    
    [self.view addSubview:self.zheZhaoView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.centerView];
    [self.view addSubview:self.bottomView];
    
    [self subViewisShow];
}


- (void)subViewisShow{
    self.zheZhaoView.hidden = YES;
    self.topView.hidden = YES;
    self.centerView.hidden = YES;
    self.bottomView.hidden = YES;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
