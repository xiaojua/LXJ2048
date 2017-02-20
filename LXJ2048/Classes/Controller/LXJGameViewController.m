//
//  LXJGameViewController.m
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import "LXJGameViewController.h"
#import "LXJGameView.h"

@interface LXJGameViewController ()
{
    /* GameView的宽和高 */
    CGFloat _gameWH;
    /* GameView */
    LXJGameView *gameView;
}
@end

@implementation LXJGameViewController

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* 添加返回按钮 */
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 30, 50, 50)];
    [backBtn addTarget:self action:@selector(clickBtnBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /* 初始化参数 */
    [self initialize];
    /* 创建GameView */
    [self createGameView];
}

#pragma mark - function
/* 初始化参数 */
- (void)initialize{
    _gameWH = 260.0;
    self.dimension = self.dimension<2 ? 2 : self.dimension;
    self.threshold = self.threshold<8 ? 8 : self.threshold;
}
/* 创建GameView */
- (void)createGameView{
    gameView = [[LXJGameView alloc]initWithFrame:CGRectMake((SCREEN_W-_gameWH)/2, (SCREEN_H-_gameWH)/2, _gameWH, _gameWH) andContent:self.dimension];
    gameView.backgroundColor = [UIColor colorWithRed:142/255.0 green:138/255.0 blue:125/255.0 alpha:1];
    [self.view addSubview:gameView];
    
    //添加手势
    //右滑
    UISwipeGestureRecognizer *swipeR =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDirection:)];
    [swipeR setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeR];
    //左滑
    UISwipeGestureRecognizer *swipeL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDirection:)];
    [swipeL setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeL];
    //上滑
    UISwipeGestureRecognizer *swipeU = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDirection:)];
    [swipeU setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeU];
    //下滑
    UISwipeGestureRecognizer *swipeD = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDirection:)];
    [swipeD setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipeD];
    
}

- (void)chooseDirection:(UISwipeGestureRecognizer *)sender{
    NSLog(@"kkkk%lu",(unsigned long)sender.direction);
    [gameView getChangeWithDirection:sender.direction];
    //需要传入的参数是NSInteger类型，但是这个direction是UISwipeGestureRecognizerDirection类型
    //向下8，向上4，向右1，向左2
    
}



/* 点击返回按钮返回 */
- (void)clickBtnBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
