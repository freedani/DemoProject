//
//  LDImageBrowerView.h
//  WebViewImageClick
//
//  Created by 李达 on 2017/3/13.
//  Copyright © 2017年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LDImageBrowserView : UIView

@property(nonatomic, strong) UIImageView *imageView;

- (void)showImageBrowser:(NSString *)imageUrl;
- (void)showImageBrowser:(NSString *)imageUrl completedBlock:(SDExternalCompletionBlock)block;

@end
