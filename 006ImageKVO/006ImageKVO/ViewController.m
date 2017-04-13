//
//  ViewController.m
//  006ImageKVO
//
//  Created by 李达 on 2017/4/5.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "ViewController.h"
#import "LDImageBrowserView.h"
#import "KeyValueObserver.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) LDImageBrowserView *imageBrowserView;
@property (nonatomic, strong) id viewObserveToken;

@end

@implementation ViewController

- (void)setImageView:(UIImageView *)imageView
{
    _imageView = imageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_imageView setUserInteractionEnabled:YES];
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)]];
    
    self.imageBrowserView = [[LDImageBrowserView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.imageBrowserView.hidden = YES;
    [self.view addSubview:_imageBrowserView];
    self.viewObserveToken = [KeyValueObserver observeObject:_imageView keyPath:@"imageView" target:self selector:@selector(imageDidChange:) options:NSKeyValueObservingOptionInitial];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [_imageBrowserView showImageBrowser:@"https://pic2.zhimg.com/v2-c99883323c5e023d31be1ec237b7d40d_b.jpg"];
}

- (void)imageDidChange:(NSDictionary *)change {
    NSLog(@"%s",__func__);
    self.imageView.image = self.imageBrowserView.imageView.image;
}

@end
