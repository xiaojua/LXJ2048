
//
//  LXJTitleView.m
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import "LXJTitleView.h"

@interface LXJTitleView ()
{
    /* 每个小方块label */
    UILabel *titleLabel;
    /* 每个小方块上的数字字典 */
    NSDictionary *title_Dict;
    /* 每个小方块的颜色字典 */
    NSDictionary *color_Dict;
}
@end

@implementation LXJTitleView

/* 重新init方法，初始化lable */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        /* 把数字字典和颜色字典给默认值 */
        title_Dict = @{@2:@"2",@4:@"4",@8:@"8",@16:@"16",@32:@"32",@64:@"64",@128:@"128",@256:@"256",@512:@"512",@1024:@"1024",@2048:@"2048"};
        color_Dict = @{@2:[UIColor colorWithHexString:@"AEEEEE"],
                       @4:[UIColor colorWithHexString:@"C0FF3E"],
                       @8:[UIColor colorWithHexString:@"FFEC8B"],
                       @16:[UIColor colorWithHexString:@"FFDAB9"],
                       @32:[UIColor colorWithHexString:@"FFC125"],
                       @64:[UIColor colorWithHexString:@"FFB6C1"],
                       @128:[UIColor colorWithHexString:@"FF83FA"],
                       @256:[UIColor colorWithHexString:@"FF7F24"],
                       @512:[UIColor colorWithHexString:@"FF6A6A"],
                       @1024:[UIColor colorWithHexString:@"FF4040"],
                       @2048:[UIColor colorWithHexString:@"FF0000"]};
        /* 创建小方块label */
        [self createTitleView];
    }
    return self;
}
/* 创建小方块label */
- (void)createTitleView{
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:30];
    [self addSubview:titleLabel];
}

/* 根据传入的数字显示不同的数字 */
- (void)getTitleWithData:(NSNumber *)data
{
    NSLog(@"%@",data);
    //使用objectForKey当传入的data在key中没有时，返回nil，用valueForKey是则会崩溃
    titleLabel.text = [title_Dict objectForKey:data];
    titleLabel.backgroundColor = [color_Dict objectForKey:data];
}


@end
