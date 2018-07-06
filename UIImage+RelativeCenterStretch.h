//
//  UIImage+RelativeCenterStretch.h
//  MasonryDemo
//
//  Created by kismet adler on 2018/7/4.
//  Copyright © 2018年 kismet adler. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (RelativeCenterStretch)

/**
 沿着中心对称横向拉伸图片

 @param finalWidth 拉伸后的宽度
 @param leftCapInset 左边拉伸开始的距离
 @param leftStretchSpacing 左边被拉伸部分的宽度
 @param rightCapInset 右边拉伸开始的距离
 @param rightStretchSpacing 右边被拉伸部分的宽度
 @return 拉伸后的图片,如果最终宽度比原宽度小，返回等比例缩小的图片
 */
- (UIImage *)stretchWithFinalWidth:(CGFloat)finalWidth
                      leftCapInset:(CGFloat)leftCapInset
                leftStretchSpacing:(CGFloat)leftStretchSpacing
                     rightCapInset:(CGFloat)rightCapInset
               rightStretchSpacing:(CGFloat)rightStretchSpacing;

/**
 沿着中心对称纵向拉伸图片

 @param finalHeight 拉伸后的高度
 @param topCapInset 顶部拉伸的点距离顶部的距离
 @param topStretchSpacing 顶部被拉伸部分的长度
 @param bottomCapInset 底部拉伸的点距离底部的距离
 @param bottomStretchSpacing 底部被拉伸部分的长度
 @return 拉伸后的图片,如果最终高度比原高度小，返回等比例缩小的图片
 */
- (UIImage *)stretchWithFinalHeight:(CGFloat)finalHeight
                        topCapInset:(CGFloat)topCapInset
                  topStretchSpacing:(CGFloat)topStretchSpacing
                     bottomCapInset:(CGFloat)bottomCapInset
               bottomStretchSpacing:(CGFloat)bottomStretchSpacing;
@end

NS_ASSUME_NONNULL_END
