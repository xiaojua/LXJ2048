//
//  LXJGameModel.h
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 计分block */
typedef void (^ReturnBlock)(int addNum);

@interface LXJGameModel : NSObject

/* 计分属性 */
@property (nonatomic, copy)ReturnBlock addNumBlock;

/* 计分方法 */
- (void)addNumberWithBlock:(ReturnBlock)numBlock;

/* 边长 */
@property (nonatomic, assign)NSInteger demn;

/* 右划 */
- (NSMutableArray *)getRightNewArrayWithOldArray:(NSMutableArray *)oldArray;
/* 左划 */
- (NSMutableArray *)getLeftNewArrayWithOldArray:(NSMutableArray *)oldArray;
/* 上划 */
- (NSMutableArray *)getUpNewArrayWithOldArray:(NSMutableArray *)oldArray;
/* 下划 */
- (NSMutableArray *)getDownArrayWithOldArray:(NSMutableArray *)oldArray;

/* 判断游戏是否结束no为结束 */
- (BOOL)JudgeGameOverWithArray:(NSMutableArray *)array;





@end
