//
//  CZAverageItem.m
//  CZAverageItemView
//
//  Created by yunshan on 2019/4/29.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "CZAverageItem.h"
#import <CZCategorys/CZCategory.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define ContentImageSpace 5

@interface CZAverageItem ()
@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UILabel * contentLabel;
@end

@implementation CZAverageItem
-(void)updateInfo:(CZAverageItemModel *)model
{
    CGSize textSize = CGSizeZero;
    CGSize imageSize = (model.imageWidth > 0 && model.imageHeight > 0) ? CGSizeMake(model.imageWidth, model.imageHeight) : CGSizeZero;
    if (model.content.length > 0) textSize = [model.content getTextActualSize:self.contentLabel.font lines:0 maxWidth:[UIScreen mainScreen].bounds.size.width];
    
    // 获取y值
    CGFloat y = (self.height - imageSize.height - textSize.height - ((imageSize.height > 0 && textSize.height > 0) ? ContentImageSpace : 0))/2;
    
    // 显示图片
    self.imgView.frame = CGRectMake((self.width - imageSize.width)/2, y, imageSize.width, imageSize.height);
    [self.imgView sd_setImageWithURL:(model.imageUrl.length ? [NSURL URLWithString:model.imageUrl] : nil) placeholderImage:(model.imageName.length ? [UIImage imageNamed:model.imageName] : nil)];
    
    // 显示文本
    self.contentLabel.frame = CGRectMake((self.width - textSize.width)/2, self.imgView.yPlushHeight + (self.imgView.height > 0 ? ContentImageSpace : 0), textSize.width, textSize.height);
    self.contentLabel.text = model.content;
}

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [self addSubview:_imgView];
    }
    return _imgView;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor redColor];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_contentLabel];
    }
    return _contentLabel;
}
@end
