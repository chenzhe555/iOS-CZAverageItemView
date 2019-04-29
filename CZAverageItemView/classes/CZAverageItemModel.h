//
//  CZAverageItemModel.h
//  CZAverageItemView
//
//  Created by yunshan on 2019/4/29.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZAverageItemModel : NSObject
/**
 @brief 显示文本
 */
@property (nonatomic, copy) NSString * content;

/**
 @brief 本地图片名
 */
@property (nonatomic, copy) NSString * imageName;

/**
 @brief 图片网络地址
 */
@property (nonatomic, copy) NSString * imageUrl;

/**
 @brief 图片宽度
 */
@property (nonatomic, assign) CGFloat imageWidth;

/**
 @brief 图片高度
 */
@property (nonatomic, assign) CGFloat imageHeight;
@end

NS_ASSUME_NONNULL_END
