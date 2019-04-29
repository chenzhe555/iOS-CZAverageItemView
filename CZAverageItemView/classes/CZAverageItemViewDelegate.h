//
//  CZAverageItemViewDelegate.h
//  CZAverageItemView
//
//  Created by yunshan on 2019/4/29.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZAverageItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CZAverageItemViewDelegate <NSObject>
@optional

/**
 @brief 自定义Item视图

 @param index 当前索引值
 @param rect 当前Item坐标
 */
-(UIView<CZAverageItemViewDelegate> *)averageItemViewAtIndex:(NSInteger)index rect:(CGRect)rect;

/**
 @brief 更新特定Item信息

 @param model Item数据对象
 */
-(void)updateInfo:(CZAverageItemModel *)model;
@end

NS_ASSUME_NONNULL_END
