//
//  AppDelegate.m
//  banner
//
//  Created by xiayao on 16/9/30.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "BannerNotice.h"
#import <AudioToolbox/AudioToolbox.h>
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)

@implementation BannerNotice

+ (id)bannerWith:(UIImage *)bannerImage
     bannerName:(NSString *)bannerName
  bannerContent:(NSString *)bannerContent
{
    //  横幅
    UIView *bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, -70, SCREEN_WIDTH, 70)];
    bannerView.backgroundColor = [UIColor blackColor];
    bannerView.alpha = 0.85;
    
    //  通知图片
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 16, 20, 20)];
    [imageView setImage:bannerImage];
    [bannerView addSubview:imageView];
    
    //  通知应用名称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(38, 16, 39, 16);
    nameLabel.textColor = [UIColor whiteColor];
    UIFont *font = [UIFont fontWithName:@"Arial" size:14];
    nameLabel.font = font;
    nameLabel.text = bannerName;
    [bannerView addSubview:nameLabel];
    
    //  通知时间
    UILabel *newLabel = [[UILabel alloc] init];
    newLabel.frame = CGRectMake(83, 15, 24, 18);
    newLabel.textColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
    newLabel.font = [UIFont fontWithName:@"Arial" size:12];
    newLabel.text = @"现在";
    [bannerView addSubview:newLabel];
    
    //  通知内容
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.frame = CGRectMake(30, 37, SCREEN_WIDTH-70, 29);
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.font = font;
    contentLabel.text = bannerContent;
    [bannerView addSubview:contentLabel];
    
    //  执行平移动画，4s后收回
    [UIView animateWithDuration:0.5 animations:^{
        bannerView.transform = CGAffineTransformMakeTranslation(0, 70);
    }];
    
    double delayInSeconds = 4.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.5 animations:^{
            bannerView.transform = CGAffineTransformMakeTranslation(0, -70);
        }];
    });
    
    return bannerView;
    
}


@end
