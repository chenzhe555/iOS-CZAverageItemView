//
//  CZAverageItemView.m
//  CZAverageItemView
//
//  Created by yunshan on 2019/4/29.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "CZAverageItemView.h"
#import "CZAverageItem.h"
#import <CZCategorys/UIView+CZCategory.h>

@implementation CZAverageItemView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineCount = 4;
    }
    return self;
}

#pragma mark 属性
-(void)setDataArray:(NSArray<CZAverageItemModel *> *)dataArray
{
    _dataArray = dataArray;
    [self updateAllViews];
}

#pragma mark .h文件实现
-(void)updateInfoAtIndex:(NSInteger)index model:(CZAverageItemModel *)model
{
    UIView<CZAverageItemViewDelegate> * view = [self viewWithTag:(100 + index)];
    [view updateInfo:model];
}

#pragma mark 自定义方法

/**
 @brief 更新视图
 */
-(void)updateAllViews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat itemWidth = self.width/self.lineCount;
    for (int i = 0; i < self.dataArray.count; ++i) {
        UIView<CZAverageItemViewDelegate> * view = nil;
        CGRect rect = CGRectMake((i%self.lineCount)*itemWidth, (i/self.lineCount), itemWidth, self.height);
        if (self.delegate && [self.delegate respondsToSelector:@selector(averageItemViewAtIndex:rect:)]) {
            view = [self.delegate averageItemViewAtIndex:i rect:rect];
        } else {
            view = [[CZAverageItem alloc] init];
        }
        view.tag = i + 100;
        // 赋值坐标并更新信息
        view.frame = rect;
        [view updateInfo:self.dataArray[i]];
        [self addSubview:view];
    }
}
@end
