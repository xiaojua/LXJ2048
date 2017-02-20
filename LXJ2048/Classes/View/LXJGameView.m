//
//  LXJGameView.m
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import "LXJGameView.h"
#import "LXJTitleView.h"
#import "LXJGameModel.h"

typedef enum :NSInteger{
    titleLabelTags = 10
}tags;



@interface LXJGameView ()<UIAlertViewDelegate>
{
    /* 边长是几 */
    NSInteger _demen;
    /* 总共有几个titlelabel */
    NSInteger _totalNum;
    /* 每个titleLabel间距 */
    CGFloat _titlePadding;
    /* GameView顶部距计分label底部的距离 */
    CGFloat _viewPadding;
    /* GameView的宽和高 */
    CGFloat _widthHeight;
    
    /* 计分label */
//    UILabel *scoreLabel;
    
    /* 数据模型 */
    LXJGameModel *model;
    
//    int score;
}
/* 存储数据的数组 */
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, strong)UILabel *scoreLabel;
@property (nonatomic, assign)int score;
@end


#define titleAndPadding = ((_widthHeight-_titlePadding*(_demen+1))/_demen+_titlePadding)
#define halftitleAndPadding = ((_widthHeight-_titlePadding*(_demen+1))/_demen/2+_titlePadding)




@implementation LXJGameView

#pragma mark - lazy
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


/* initGameView */
-(instancetype)initWithFrame:(CGRect)frame andContent:(NSInteger)demension{
    self = [super initWithFrame:frame];
    if (self) {
        _demen = demension;
        _totalNum = demension*demension;
        _titlePadding = 3.0;
        _viewPadding = 10.0;
        _widthHeight = frame.size.height;
        [self createGameView];
        //初始化计分label分数
        
        
        //初始化数据模型
        model = [[LXJGameModel alloc]init];
        model.demn = _demen;
        self.score = 0;
        WK(weakSelf)
        [model addNumberWithBlock:^(int addNum) {
            weakSelf.score = weakSelf.score + addNum;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.scoreLabel.text = [NSString stringWithFormat:@"分数：%d", weakSelf.score];
            });
        }];
        
    }
    return self;
}
/* createGameView */
- (void)createGameView{
    //创建每一个小的titleview组成一个GameView，把titlelabel放在titleView的位置上
    for (int i = 0; i<_totalNum; i++) {
        UIView *titleView = [[UIView alloc]init];
        titleView.center = CGPointMake(((_widthHeight-_titlePadding*(_demen+1))/_demen+_titlePadding)*(i%_demen)+((_widthHeight-_titlePadding*(_demen+1))/_demen/2+_titlePadding), ((_widthHeight-_titlePadding*(_demen+1))/_demen+_titlePadding)*(i/_demen)+((_widthHeight-_titlePadding*(_demen+1))/_demen/2+_titlePadding));
        titleView.bounds = CGRectMake(0, 0, (_widthHeight-_titlePadding*(_demen+1))/_demen, (_widthHeight-_titlePadding*(_demen+1))/_demen);
        titleView.backgroundColor = [UIColor colorWithRed:197/255.0 green:195/255.0 blue:179/255.0 alpha:1];
        titleView.layer.cornerRadius = 5;
        titleView.clipsToBounds = YES;
        [self addSubview:titleView];
        
        //创建titleview
        LXJTitleView *title = [[LXJTitleView alloc]initWithFrame:titleView.frame];
        //标记这些titlelabel的tag，后面根据这些tag值找出对应位置的titlelabel
        title.tag = titleLabelTags+i;
        [self addSubview:title];
        
    }
    //创建计分label
    self.scoreLabel = [[UILabel alloc]init];
    self.scoreLabel.center = CGPointMake(self.frame.size.width/2, -60);
    self.scoreLabel.bounds = CGRectMake(0, 0, 100, 40);
    self.scoreLabel.backgroundColor = [UIColor blueColor];
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.scoreLabel];
    //初始化界面，视图已经准备好了，在随机位置出现随机数
    [self getInitialize];
}
#pragma mark - 初始化界面，视图已经准备好了，在随机位置出现随机数
- (void)getInitialize{
    //先清空存储数据的数组
    [self.dataArr removeAllObjects];
    //刚开始的时候成绩为0
    self.scoreLabel.text = @"分数：0";
    //随机出两个位置
    NSInteger locationA = arc4random()%_totalNum;
    NSInteger locationB = arc4random()%_totalNum;
    //如果这个位置相同，则再随机出一个位置，两个位置不同
    if (locationA == locationB) {
        locationA = (locationB+1)%_totalNum;
    }
    
    //两个位置不同则在这两个位置随机出2或者4，其余位置是1
    for (NSInteger i=0; i<_totalNum; i++) {
        if (i == locationA || i == locationB) {
            [self.dataArr addObject:[NSNumber numberWithInt:(arc4random()%2+1)*2]];
        }else{
            [self.dataArr addObject:@1];
        }
    }
    //把随机位置上的数字显示出来
    [self getTitleLabe];
}
/* 把随机位置上的数字显示出来 */
- (void)getTitleLabe{
    
    for (NSInteger i=0; i<self.dataArr.count; i++) {
        LXJTitleView *titleLabel = [self viewWithTag:titleLabelTags+i];
        [titleLabel getTitleWithData:self.dataArr[i]];
    }
}
/* 滑动手势 */
-(void)getChangeWithDirection:(NSInteger)direct{
    switch (direct) {
        case 1:
            //移动
            self.dataArr = [model getRightNewArrayWithOldArray:self.dataArr];
            //判断是否结束，如果结束则跳出是否重新开始的弹窗，不结束则把移动后的数字显示出来
            if (![model JudgeGameOverWithArray:self.dataArr]) {
                //结束
                [self showAlert];
            }
            [self getTitleLabe];
            NSLog(@"向右");
            break;
        case 2:
            self.dataArr = [model getLeftNewArrayWithOldArray:self.dataArr];
            if (![model JudgeGameOverWithArray:self.dataArr]) {
                [self showAlert];
            }
            [self getTitleLabe];
            
            NSLog(@"向左");
            break;
        case 4:
            self.dataArr = [model getUpNewArrayWithOldArray:self.dataArr];
            if (![model JudgeGameOverWithArray:self.dataArr]) {
                [self showAlert];
            }
            [self getTitleLabe];
            NSLog(@"向上");
            break;
        case 8:
            self.dataArr = [model getDownArrayWithOldArray:self.dataArr];
            if (![model JudgeGameOverWithArray:self.dataArr]) {
                [self showAlert];
            }
            [self getTitleLabe];
            NSLog(@"向下");
            break;
            
        default:
            break;
    }
}
/* 提醒游戏结束弹框 */
- (void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"游戏结束" delegate:self cancelButtonTitle:@"再来一局" otherButtonTitles:@"ok", nil];
    [alert show];
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //重新玩，初始化界面
        [self getInitialize];
    }else{
        //不做任何处理，或者返回首页
    }
}
@end
