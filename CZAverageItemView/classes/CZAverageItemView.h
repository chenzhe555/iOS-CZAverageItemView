//
//  CZAverageItemView.h
//  CZAverageItemView
//
//  Created by yunshan on 2019/4/29.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZAverageItemModel.h"
#import "CZAverageItemViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZAverageItemView : UIView
@property (nonatomic, weak) id<CZAverageItemViewDelegate> delegate;

/**
 @brief 每行数量 默认4个
 */
@property (nonatomic, assign) NSInteger lineCount;

/**
 @brief 数据源数组
 */
@property (nonatomic, strong) NSArray<CZAverageItemModel *> * dataArray;

/**
 @brief 更新特定索引值下的数据

 @param index 更新Item索引值
 @param model 更新Item数据对象
 */
-(void)updateInfoAtIndex:(NSInteger)index model:(CZAverageItemModel *)model;
@end


NS_ASSUME_NONNULL_END
