//
//  LXJGameModel.m
//  LXJ2048
//
//  Created by xiaojuan on 17/2/16.
//  Copyright © 2017年 xiaojuan. All rights reserved.
//

#import "LXJGameModel.h"

@interface LXJGameModel ()

//移动时候需要的数组，3个或4个或5个或6个
@property (nonatomic, strong)NSMutableArray *firstArr;
@property (nonatomic, strong)NSMutableArray *secondArr;
@property (nonatomic, strong)NSMutableArray *thirdArr;
@property (nonatomic, strong)NSMutableArray *fourArr;
@property (nonatomic, strong)NSMutableArray *fiveArr;
@property (nonatomic, strong)NSMutableArray *sixArr;



@end

@implementation LXJGameModel

#pragma mark - lazy
- (NSMutableArray *)firstArr{
    if (!_firstArr) {
        _firstArr = [NSMutableArray array];
    }
    return _firstArr;
}
- (NSMutableArray *)secondArr{
    if (!_secondArr) {
        _secondArr = [NSMutableArray array];
    }
    return _secondArr;
}
- (NSMutableArray *)thirdArr{
    if (!_thirdArr) {
        _thirdArr = [NSMutableArray array];
    }
    return _thirdArr;
}
- (NSMutableArray *)fourArr{
    if (!_fourArr) {
        _fourArr = [NSMutableArray array];
    }
    return _fourArr;
}
- (NSMutableArray *)fiveArr{
    if (!_fiveArr) {
        _fiveArr = [NSMutableArray array];
    }
    return _fiveArr;
}
- (NSMutableArray *)sixArr{
    if (!_sixArr) {
        _sixArr = [NSMutableArray array];
    }
    return _sixArr;
}
#pragma mark - 初始化数据
- (void)getInitializeDataArr{
    [self.firstArr removeAllObjects];
    [self.secondArr removeAllObjects];
    [self.thirdArr removeAllObjects];
    [self.fourArr removeAllObjects];
    [self.fiveArr removeAllObjects];
    [self.sixArr removeAllObjects];
}


#pragma mark - 四个方向滑动
//右滑
- (NSMutableArray *)getRightNewArrayWithOldArray:(NSMutableArray *)oldArray{
    NSMutableArray *arr = [NSMutableArray array];
    //初始化每行的数据
    [self getInitializeDataArr];
    //每行的数据换成现在的
    for (NSInteger i=0; i<oldArray.count; i++) {
        if (i/self.demn == 0) {
            [self.firstArr addObject:oldArray[i]];
        }else if (i/self.demn == 1){
            [self.secondArr addObject:oldArray[i]];
        }else if (i/self.demn == 2){
            [self.thirdArr addObject:oldArray[i]];
        }else if (i/self.demn == 3){
            [self.fourArr addObject:oldArray[i]];
        }
        else if (i/self.demn == 4){
            [self.fiveArr addObject:oldArray[i]];
        }else if (i/self.demn == 5){
            [self.sixArr addObject:oldArray[i]];
        }
    }
    
    NSMutableArray *newFirstArr = nil;
    NSMutableArray *newSecondArr = nil;
    NSMutableArray *newThirdArr = nil;
    NSMutableArray *newFourArr = nil;
    NSMutableArray *newFiveArr = nil;
    NSMutableArray *newSixArr = nil;
    
    switch (self.demn) {
        case 3:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            [arr addObjectsFromArray:newFirstArr];
            [arr addObjectsFromArray:newSecondArr];
            [arr addObjectsFromArray:newThirdArr];

            break;
        case 4:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            [arr addObjectsFromArray:newFirstArr];
            [arr addObjectsFromArray:newSecondArr];
            [arr addObjectsFromArray:newThirdArr];
            [arr addObjectsFromArray:newFourArr];
            break;
        case 5:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            [arr addObjectsFromArray:newFirstArr];
            [arr addObjectsFromArray:newSecondArr];
            [arr addObjectsFromArray:newThirdArr];
            [arr addObjectsFromArray:newFourArr];
            [arr addObjectsFromArray:newFiveArr];
            break;
        case 6:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            newSixArr = [self moveWithDataArray:self.sixArr];
            [arr addObjectsFromArray:newFirstArr];
            [arr addObjectsFromArray:newSecondArr];
            [arr addObjectsFromArray:newThirdArr];
            [arr addObjectsFromArray:newFourArr];
            [arr addObjectsFromArray:newFiveArr];
            [arr addObjectsFromArray:newSixArr];
            break;
        default:
            break;
    }
    
    
    //在新数组空的位置随机一个2或者4
    NSMutableArray *returnArr = [self getNewArrayWithOldArray:arr];
    
    
    return returnArr;
}
//左滑
- (NSMutableArray *)getLeftNewArrayWithOldArray:(NSMutableArray *)oldArray{
    NSMutableArray *arr = [NSMutableArray array];
    [self getInitializeDataArr];
    for (NSInteger i=0; i<oldArray.count; i++) {
        if (i/self.demn == 0) {
            [self.firstArr insertObject:oldArray[i] atIndex:0];
        }else if (i/self.demn == 1){
            [self.secondArr insertObject:oldArray[i] atIndex:0];
        }else if (i/self.demn == 2){
            [self.thirdArr insertObject:oldArray[i] atIndex:0];
        }else if (i/self.demn == 3){
            [self.fourArr insertObject:oldArray[i] atIndex:0];
        }
        else if (i/self.demn == 4){
            [self.fiveArr addObject:oldArray[i]];
        }else if (i/self.demn == 5){
            [self.sixArr addObject:oldArray[i]];
        }
    }
    
    NSMutableArray *newFirstArr = nil;
    NSMutableArray *newSecondArr = nil;
    NSMutableArray *newThirdArr = nil;
    NSMutableArray *newFourArr = nil;
    NSMutableArray *newFiveArr = nil;
    NSMutableArray *newSixArr = nil;
    
    switch (self.demn) {
        case 3:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFirstArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newSecondArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newThirdArr]];
            break;
        case 4:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFirstArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newSecondArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newThirdArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFourArr]];
            break;
        case 5:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFirstArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newSecondArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newThirdArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFourArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFiveArr]];
            break;
        case 6:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            newSixArr = [self moveWithDataArray:self.sixArr];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFirstArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newSecondArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newThirdArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFourArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newFiveArr]];
            [arr addObjectsFromArray:[self changeArrayDircetionWithOldArray:newSixArr]];
            break;
        default:
            break;
    }
    
    
    
    
    
    
    NSMutableArray *returenArr = [self getNewArrayWithOldArray:arr];
    
    return returenArr;
}
//下滑
- (NSMutableArray *)getDownArrayWithOldArray:(NSMutableArray *)oldArray{
    [self getInitializeDataArr];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<oldArray.count; i++) {
        if (i%self.demn == 0) {
            [self.firstArr addObject:oldArray[i]];
        }else if (i%self.demn == 1){
            [self.secondArr addObject:oldArray[i]];
        }else if (i%self.demn == 2){
            [self.thirdArr addObject:oldArray[i]];
        }else if (i%self.demn == 3){
            [self.fourArr addObject:oldArray[i]];
        }
        else if (i%self.demn == 4){
            [self.fiveArr addObject:oldArray[i]];
        }else if (i%self.demn == 5){
            [self.sixArr addObject:oldArray[i]];
        }
    }
    
    
    NSMutableArray *newFirstArr = nil;
    NSMutableArray *newSecondArr = nil;
    NSMutableArray *newThirdArr = nil;
    NSMutableArray *newFourArr = nil;
    NSMutableArray *newFiveArr = nil;
    NSMutableArray *newSixArr = nil;
                                 
    switch (self.demn) {
        case 3:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:newFirstArr[i]];
                [arr addObject:newSecondArr[i]];
                [arr addObject:newThirdArr[i]];
            }
            break;
        case 4:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:newFirstArr[i]];
                [arr addObject:newSecondArr[i]];
                [arr addObject:newThirdArr[i]];
                [arr addObject:newFourArr[i]];
                
            }
            break;
        case 5:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:newFirstArr[i]];
                [arr addObject:newSecondArr[i]];
                [arr addObject:newThirdArr[i]];
                [arr addObject:newFourArr[i]];
                [arr addObject:newFiveArr[i]];
            }
            break;
        case 6:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            newSixArr = [self moveWithDataArray:self.sixArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:newFirstArr[i]];
                [arr addObject:newSecondArr[i]];
                [arr addObject:newThirdArr[i]];
                [arr addObject:newFourArr[i]];
                [arr addObject:newFiveArr[i]];
                [arr addObject:newSixArr[i]];
            }
            break;
        default:
            break;
    }
    
    
    
    NSMutableArray *returnArr = [self getNewArrayWithOldArray:arr];
    return returnArr;
}
//上滑
- (NSMutableArray *)getUpNewArrayWithOldArray:(NSMutableArray *)oldArray{
    [self getInitializeDataArr];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<oldArray.count; i++) {
        if (i%self.demn == 0) {
            [self.firstArr insertObject:oldArray[i] atIndex:0];
        }else if (i%self.demn == 1){
            [self.secondArr insertObject:oldArray[i] atIndex:0];
        }else if (i%self.demn == 2){
            [self.thirdArr insertObject:oldArray[i] atIndex:0];
        }else if (i%self.demn == 3){
            [self.fourArr insertObject:oldArray[i] atIndex:0];
        }
        else if (i%self.demn == 4){
            [self.fiveArr addObject:oldArray[i]];
        }else if (i%self.demn == 5){
            [self.sixArr addObject:oldArray[i]];
        }
    }
    
    NSMutableArray *newFirstArr = nil;
    NSMutableArray *newSecondArr = nil;
    NSMutableArray *newThirdArr = nil;
    NSMutableArray *newFourArr = nil;
    NSMutableArray *newFiveArr = nil;
    NSMutableArray *newSixArr = nil;
    
    switch (self.demn) {
        case 3:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:[self changeArrayDircetionWithOldArray:newFirstArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newSecondArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newThirdArr][i]];
                
            }
            break;
        case 4:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:[self changeArrayDircetionWithOldArray:newFirstArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newSecondArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newThirdArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newFourArr][i]];
            }
            break;
        case 5:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:[self changeArrayDircetionWithOldArray:newFirstArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newSecondArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newThirdArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newFourArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newFiveArr[i]]];
            }
            break;
        case 6:
            newFirstArr = [self moveWithDataArray:self.firstArr];
            newSecondArr = [self moveWithDataArray:self.secondArr];
            newThirdArr = [self moveWithDataArray:self.thirdArr];
            newFourArr = [self moveWithDataArray:self.fourArr];
            newFiveArr = [self moveWithDataArray:self.fiveArr];
            newSixArr = [self moveWithDataArray:self.sixArr];
            for (NSInteger i=0; i<self.demn; i++) {
                [arr addObject:[self changeArrayDircetionWithOldArray:newFirstArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newSecondArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newThirdArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newFourArr][i]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newFiveArr[i]]];
                [arr addObject:[self changeArrayDircetionWithOldArray:newSixArr[i]]];
            }
            break;
        default:
            break;
    }
    
    
    NSMutableArray *returnArr = [self getNewArrayWithOldArray:arr];
    return returnArr;
}


/* 移动每行数据 */
- (NSMutableArray *)moveWithDataArray:(NSMutableArray *)oldArray{
    //如果传入的数组为空则直接返回空
    if (oldArray.count>0) {
        //现在位置的下标
        NSInteger nowIndex = oldArray.count-1;
        for (NSInteger i=0; i<oldArray.count; i++) {
            //如果oldArray.count-1-i位置为空则执行下一个循环
            if ([oldArray[oldArray.count-1-i] isEqual:@1]) {
                continue;
            }else{//否则移动
                //把oldArray.count-1-i这个位置的数字移到nowIndex上
                NSNumber *nowNumb = oldArray[oldArray.count-1-i];
                [oldArray replaceObjectAtIndex:nowIndex withObject:nowNumb];
                //看oldArray.count-1-i和nowIndex是否是同一位置，不是的话把oldArray.count-1-i位置数字置1，否则执行下一步
                if (oldArray.count-1-i != nowIndex) {
                    [oldArray replaceObjectAtIndex:oldArray.count-1-i withObject:@1];
                }
                //移动完了，判断是否有相同的数字,
                if (nowIndex < oldArray.count-1) {//首先数字要有相同的前提是，nowIndex的位置不是数组的最后一个位置,不是的话直接这个for循环结束，nowIndex-1
                    //判断nowIndex位置和nowIndex+1位置上的数是否相同
                    if (oldArray[nowIndex] == oldArray[nowIndex+1]) {
                        //相同的话，nowIndex+1位置的数翻倍，nowIndex位置的数置1
                        [oldArray replaceObjectAtIndex:nowIndex+1 withObject:[NSNumber numberWithInt:2*[oldArray[nowIndex] intValue]]];
                        //得分加2*[oldArray[nowIndex]
#pragma mark - 得分加2*[oldArray[nowIndex]
                        self.addNumBlock([oldArray[nowIndex] intValue]*2);
                        [oldArray replaceObjectAtIndex:nowIndex withObject:@1];
                    }else{//不同的话nowIndex-1
                        nowIndex--;
                    }
                }else{
                    nowIndex--;
                }
            }
        }
        return oldArray;
    }else{
        return nil;
    }
    
}
/* 数组反向，左移或者上移时 */
- (NSMutableArray *)changeArrayDircetionWithOldArray:(NSMutableArray *)oldArr{
    if (oldArr.count>0) {
        NSMutableArray *newArr = [NSMutableArray array];
        for (int i=0; i<oldArr.count; i++) {
            [newArr addObject:oldArr[oldArr.count-1-i]];
        }
        return newArr;
    }else{
        return nil;
    }
    
}


/* 移动后在随机位置生成随机数 */
- (NSMutableArray *)getNewArrayWithOldArray:(NSMutableArray *)oldArr{
    //位置为1的那些下标组成的数组
    NSMutableArray *indexArr = [NSMutableArray array];
    //先找到数字为1的位置，再在这些位置上随便找个位置生成一个数
    for (int i=0; i<oldArr.count; i++) {
        if ([oldArr[i] isEqual:@1]) {
            [indexArr addObject:[NSNumber numberWithInt:i]];
        }
        
    }
    //有空位置则随机空位置处生成一个随机数
    if (indexArr.count>0) {
        //生成一个随机位置
        int randomIndex = [indexArr[arc4random()%indexArr.count] intValue];
        //在这个随机位置上生成一个随机数
        [oldArr replaceObjectAtIndex:randomIndex withObject:[self getRandomNumber]];
    }
    
    
    return oldArr;
}
/* 生成随机数 */
- (NSNumber *)getRandomNumber{
    NSNumber *random;
    random = [NSNumber numberWithInt:(arc4random()%2+1)*2];
    return random;
}


#pragma mark - 判断游戏是否结束 no结束
- (BOOL)JudgeGameOverWithArray:(NSMutableArray *)array{
    int a = 0;
    for (NSNumber *num in array) {
        if ([num isEqual:@1]) {
            a++;
        }
    }
    if (a == 0) {
        for (int i=0; i<array.count; i++) {
            if ([self isEqualWithGroup:array andIndex:i]) {
                return YES;
            }
        }
    }else{
        //有空余
        return YES;
    }
    
    return NO;
}

- (BOOL)isEqualWithGroup:(NSMutableArray *)arr  andIndex:(int)index{
    if (index/self.demn == 0) {//第一行
        if (index%self.demn == 0) {
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
        }else if (index%self.demn == self.demn-1){
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
        }else{
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
        }
        if ([self isEqualForDownWithArray:arr andIndex:index]) {
            return YES;
        }
    }else if (index/self.demn == self.demn-1){//最后一行
        if (index%self.demn == 0) {
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
        }else if (index%self.demn == self.demn-1){
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
        }else{
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
        }
        if ([self isEqualForUpWithArray:arr andIndex:index]) {
            return YES;
        }
    }else{
        if (index%self.demn == 0) {
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
        }else if (index%self.demn == self.demn-1){
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
        }else{
            if ([self isEqualForLeftWithArrary:arr andIndex:index]) {
                return YES;
            }
            if ([self isEqualForRightWithArray:arr andIndex:index]) {
                return YES;
            }
        }
        if ([self isEqualForUpWithArray:arr andIndex:index]) {
            return YES;
        }
        if ([self isEqualForDownWithArray:arr andIndex:index]) {
            return YES;
        }
        
    }
    

    return NO;
}

//和左边对比
- (BOOL)isEqualForLeftWithArrary:(NSMutableArray *)arr andIndex:(int)index{
    BOOL isequal = NO;
    if ([arr[index-1] isEqual:arr[index]]) {
        isequal = YES;
    }
    return isequal;
}

//和右边的对比
- (BOOL)isEqualForRightWithArray:(NSMutableArray *)arr andIndex:(int)index{
    BOOL isequal = NO;
    if ([arr[index+1] isEqual:arr[index]]) {
        isequal = YES;
    }
    return YES;
}

//和上边的对比
- (BOOL)isEqualForUpWithArray:(NSMutableArray *)arr andIndex:(int)index{
    BOOL isequal = NO;
    if ([arr[index-self.demn] isEqual:arr[index]]) {
        isequal = YES;
    }
    return YES;
}
//和下边的对比
- (BOOL)isEqualForDownWithArray:(NSMutableArray *)arr andIndex:(int)index{
    BOOL isequal = NO;
    if ([arr[index+self.demn] isEqual:arr[index]]) {
        isequal = YES;
    }
    return YES;
}


/* 计分方法 */
- (void)addNumberWithBlock:(ReturnBlock)numBlock{
    self.addNumBlock = numBlock;
}

@end
