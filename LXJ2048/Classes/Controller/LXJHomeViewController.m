//
//  LXJHomeViewController.m
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import "LXJHomeViewController.h"
#import "LXJGameViewController.h"


@interface LXJHomeViewController ()
/* 按钮数组 */
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnArr;

@end

@implementation LXJHomeViewController

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /* 设置button */
    [self setupButton];
}

#pragma mark - function
/* 选择难度不同的游戏模式 */
- (IBAction)chooseType:(UIButton *)sender {
    NSInteger tag = sender.tag;
    LXJGameViewController *gVC = [[LXJGameViewController alloc]init];
    switch (tag) {
        case 0://3X3
            gVC.dimension = 3;
            gVC.threshold = 1024;
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:gVC animated:YES];
            NSLog(@"%ld",tag);
            break;
        case 1://4X4
            gVC.dimension = 4;
            gVC.threshold = 2048;
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:gVC animated:YES];
            NSLog(@"%ld",tag);
            break;
        case 2://5X5
            gVC.dimension = 5;
            gVC.threshold = 16384;
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:gVC animated:YES];
            NSLog(@"%ld",tag);
            break;
        case 3://6X6
            gVC.dimension = 6;
            gVC.threshold = 32768;
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:gVC animated:YES];
            NSLog(@"%ld",tag);
            break;
            
        default:
            break;
    }
}
/* 设置button */
- (void)setupButton{
    for (int i=0; i<self.btnArr.count; i++) {
        UIButton *btn = self.btnArr[i];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
    }
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
