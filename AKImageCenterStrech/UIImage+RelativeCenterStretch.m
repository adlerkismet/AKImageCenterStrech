//
//  UIImage+RelativeCenterStretch.m
//  MasonryDemo
//
//  Created by kismet adler on 2018/7/4.
//  Copyright © 2018年 kismet adler. All rights reserved.
//

#import "UIImage+RelativeCenterStretch.h"

@implementation UIImage (RelativeCenterStretch)
- (UIImage *)stretchWithFinalWidth:(CGFloat)finalWidth
                      leftCapInset:(CGFloat)leftCapInset
                leftStretchSpacing:(CGFloat)leftStretchSpacing
                     rightCapInset:(CGFloat)rightCapInset
               rightStretchSpacing:(CGFloat)rightStretchSpacing{
    CGSize originImageSize = self.size;
    //if final width is less than origin image width,return ratio zoom out image.
    if (finalWidth <= originImageSize.width) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(finalWidth, (finalWidth / originImageSize.width) * originImageSize.height), NO, [UIScreen mainScreen].scale);
        [self drawInRect:CGRectMake(0, 0, finalWidth, (finalWidth / originImageSize.width) * originImageSize.height)];
        UIImage *zoomOutImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return zoomOutImage;
    }
    //first stretch,stretch the part of left
    UIImage *imageStretchOnce = [self resizableImageWithCapInsets:UIEdgeInsetsMake(0, leftCapInset, 0, self.size.width - (leftCapInset + leftStretchSpacing))];
    CGFloat tempWidth = finalWidth / 2.0 + originImageSize.width / 2.0;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, originImageSize.height), NO, [UIScreen mainScreen].scale);
    [imageStretchOnce drawInRect:CGRectMake(0, 0, tempWidth, originImageSize.height)];
    UIImage *imageStretchTwice = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //second stretch,stretch the part of right
    UIImage *tempImage = [imageStretchTwice resizableImageWithCapInsets:UIEdgeInsetsMake(0, imageStretchTwice.size.width - (rightCapInset + rightStretchSpacing), 0, rightCapInset)];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(finalWidth, originImageSize.height), NO, [UIScreen mainScreen].scale);
    [tempImage drawInRect:CGRectMake(0, 0, finalWidth, originImageSize.height)];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

- (UIImage *)stretchWithFinalHeight:(CGFloat)finalHeight
                        topCapInset:(CGFloat)topCapInset
                  topStretchSpacing:(CGFloat)topStretchSpacing
                     bottomCapInset:(CGFloat)bottomCapInset
               bottomStretchSpacing:(CGFloat)bottomStretchSpacing {
    CGSize originImageSize = self.size;
    //if final width is less than origin image width,return ratio zoom out image.
    if (finalHeight <= originImageSize.height) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake((finalHeight / originImageSize.height) * originImageSize.width, finalHeight), NO, [UIScreen mainScreen].scale);
        [self drawInRect:CGRectMake(0, 0, (finalHeight / originImageSize.height) * originImageSize.width, finalHeight)];
        UIImage *zoomOutImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return zoomOutImage;
    }
    //first stretch,stretch the part of top
    UIImage *imageStretchOnce = [self resizableImageWithCapInsets:UIEdgeInsetsMake(topCapInset, 0, self.size.height - (topCapInset + topStretchSpacing), 0)];
    CGFloat tempHeight = finalHeight / 2.0 + originImageSize.height / 2.0;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(originImageSize.width, tempHeight), NO, [UIScreen mainScreen].scale);
    [imageStretchOnce drawInRect:CGRectMake(0, 0, originImageSize.width, tempHeight)];
    UIImage *imageStretchTwice = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //second stretch,stretch the part of bottom
    UIImage *tempImage = [imageStretchTwice resizableImageWithCapInsets:UIEdgeInsetsMake(imageStretchTwice.size.height - (bottomCapInset + bottomStretchSpacing), 0, bottomCapInset, 0)];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(originImageSize.width, finalHeight), NO, [UIScreen mainScreen].scale);
    [tempImage drawInRect:CGRectMake(0, 0, originImageSize.width, finalHeight)];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}
@end
