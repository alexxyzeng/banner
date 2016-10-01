//
//  AppDelegate.m
//  banner
//
//  Created by xiayao on 16/9/30.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BannerNotice : NSObject

+(id)bannerWith:(UIImage *)bannerImage
     bannerName:(NSString *)bannerName
  bannerContent:(NSString *)bannerContent;
@end
