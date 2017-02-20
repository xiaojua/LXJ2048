//
//  LXJTitleView.h
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 每一个小方块view
 */

@interface LXJTitleView : UIView

/* 根据传入的数字显示不同的数字 */
- (void)getTitleWithData:(NSNumber *)data;

@end
