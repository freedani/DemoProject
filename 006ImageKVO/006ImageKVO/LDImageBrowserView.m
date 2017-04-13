//
//  LDImageBrowerView.m
//  WebViewImageClick
//
//  Created by 李达 on 2017/3/13.
//  Copyright © 2017年 杨萧玉. All rights reserved.
//

#import "LDImageBrowserView.h"

@implementation LDImageBrowserView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    
    return self;
}

- (void)initUI {
    [self setBackgroundColor:[UIColor colorWithRed:0.3
                                             green:0.3
                                              blue:0.3
                                             alpha:0.7]];
    _imageView = [[UIImageView alloc] init];
}

- (void)showImageBrowser:(NSString *)imageUrl{
    [self showImageBrowser:imageUrl completedBlock:nil];
}

- (void)showImageBrowser:(NSString *)imageUrl completedBlock:(SDExternalCompletionBlock)block{
    self.hidden = NO;
    [self addSubview:_imageView];
    _imageView.userInteractionEnabled = YES;
    NSLog(@"%@",imageUrl);
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:block];
    _imageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_imageView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)]];
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)]];
}

- (void)removeImageBrowser
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@""]];
    [_imageView removeFromSuperview];
    self.hidden = YES;
}

- (void)handlePinch:(UIPinchGestureRecognizer*) recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self removeImageBrowser];
}

@end
