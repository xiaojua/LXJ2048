//
//  LXJGameView.h
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXJGameView : UIView

/* initGameView */
- (instancetype)initWithFrame:(CGRect)frame andContent:(NSInteger)demension;

/* 滑动手势 */
- (void)getChangeWithDirection:(NSInteger)direct;


@end
