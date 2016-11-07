//
//  Image.swift
//  ImageTool
//
//  Created by 李鹏飞 on 16/11/7.
//  Copyright © 2016年 com.lipengfei. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    // 图片处理
    // 指定大小缩放图片 返回图片
   
    public func imageCompressForSizeToTargetSize(sourceImage:UIImage,targetSize:CGSize) ->UIImage{
        // 创建新的图片
        var newImage:UIImage = UIImage()
        let imageSize:CGSize = sourceImage.size
        // 旧图片的宽 高
        let width = imageSize.width
        let height = imageSize.height
        //  新图片的宽 高
        let targetWidth = targetSize.width
        let targetHeight = targetSize.height
        // 缩放比例
        var scaleFactor:CGFloat = 0.0
        var scaledWidth = targetWidth
        var scaledHeight = targetHeight
        var thumbnailPoint = CGPointZero
        if CGSizeEqualToSize(imageSize, size) {
            return sourceImage
        }else{
            // 缩放比例
            let widthFactor = targetWidth / width
            let heightFactor = targetHeight / height
            if widthFactor > heightFactor {
                // 为了避免图片缩放后被拉伸，缩放比例 按照长的进行计算
                scaleFactor = widthFactor
            }else{
                scaleFactor = heightFactor
            }
            scaledWidth = width * scaleFactor
            scaledHeight = height * scaleFactor
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            }else{
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        // 绘制图形 
        UIGraphicsBeginImageContext(targetSize)
        var thumbnailRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        sourceImage.drawInRect(thumbnailRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage;
    }
    
    // 指定宽度按比例缩放
    public func imageCompressForWidth(sourceImage:UIImage,targetWidth:CGFloat) ->UIImage{
        // 创建新的图片
        var newImage:UIImage = UIImage()
        let imageSize:CGSize = sourceImage.size
        // 旧图片的宽 高
        let width = imageSize.width
        let height = imageSize.height
        //  新图片的宽 高
        let targetWidth = targetWidth
        let targetHeight = height / width * targetWidth
        let size = CGSizeMake(targetWidth, targetHeight)
        // 缩放比例
        var scaleFactor:CGFloat = 0.0
        var scaledWidth = targetWidth
        var scaledHeight = targetHeight
        var thumbnailPoint = CGPointZero
        if CGSizeEqualToSize(imageSize, size) {
            let widthFactor = targetWidth / width
            let heightFactor = targetHeight / height
            scaleFactor = widthFactor > heightFactor ? widthFactor : heightFactor
            scaledWidth = width * scaleFactor
            scaledHeight = height * scaleFactor
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            }else{
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        UIGraphicsBeginImageContext(size)
        var thumbnailRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        sourceImage.drawInRect(thumbnailRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    
    }
    
    
}