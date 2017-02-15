//
//  ViewController.m
//  testProject
//
//  Created by 李达 on 2017/2/15.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *imageTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleRightLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@property (weak, nonatomic) IBOutlet UISlider *imageTopSlider;
@property (weak, nonatomic) IBOutlet UISlider *imageLeftSlider;
@property (weak, nonatomic) IBOutlet UISlider *imageBottomSlider;
@property (weak, nonatomic) IBOutlet UISlider *imageRightSlider;
@property (weak, nonatomic) IBOutlet UISlider *titleTopSlider;
@property (weak, nonatomic) IBOutlet UISlider *titleLeftSlider;
@property (weak, nonatomic) IBOutlet UISlider *titleBottomSlider;
@property (weak, nonatomic) IBOutlet UISlider *titleRightSlider;
@property (nonatomic) float imageTopValue;
@property (nonatomic) float imageLeftValue;
@property (nonatomic) float imageBottomValue;
@property (nonatomic) float imageRightValue;
@property (nonatomic) float titleTopValue;
@property (nonatomic) float titleLeftValue;
@property (nonatomic) float titleBottomValue;
@property (nonatomic) float titleRightValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_resetButton setBackgroundColor:[UIColor darkGrayColor]];
}
- (IBAction)resetAllSlider:(id)sender {
    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    _imageTopSlider.value = 0;
    _imageTopValue = 0;
    _imageTopLabel.text = @"0.0";
    _imageLeftSlider.value = 0;
    _imageLeftValue = 0;
    _imageLeftLabel.text = @"0.0";
    _imageBottomSlider.value = 0;
    _imageBottomValue = 0;
    _imageBottomLabel.text = @"0.0";
    _imageRightSlider.value = 0;
    _imageRightValue = 0;
    _imageRightLabel.text = @"0.0";
    _titleTopSlider.value = 0;
    _titleTopValue = 0;
    _titleTopLabel.text = @"0.0";
    _titleLeftSlider.value = 0;
    _titleLeftValue = 0;
    _titleLeftLabel.text = @"0.0";
    _titleBottomSlider.value = 0;
    _titleBottomValue = 0;
    _titleBottomLabel.text = @"0.0";
    _titleRightSlider.value = 0;
    _titleRightValue = 0;
    _titleRightLabel.text = @"0.0";
    [self valueChanged];
}
- (IBAction)imageTop:(id)sender {
    UISlider *slider = sender;
    _imageTopValue = slider.value;
    _imageTopLabel.text = [NSString stringWithFormat:@"%.1f",_imageTopValue];
    [self valueChanged];
}
- (IBAction)imageLeft:(id)sender {
    UISlider *slider = sender;
    _imageLeftValue = slider.value;
    _imageLeftLabel.text = [NSString stringWithFormat:@"%.1f",_imageLeftValue];
    [self valueChanged];
}
- (IBAction)imageBottom:(id)sender {
    UISlider *slider = sender;
    _imageBottomValue = slider.value;
    _imageBottomLabel.text = [NSString stringWithFormat:@"%.1f",_imageBottomValue];
    [self valueChanged];
}
- (IBAction)imageRight:(id)sender {
    UISlider *slider = sender;
    _imageRightValue = slider.value;
    _imageRightLabel.text = [NSString stringWithFormat:@"%.1f",_imageRightValue];
    [self valueChanged];
}
- (IBAction)titleTop:(id)sender {
    UISlider *slider = sender;
    _titleTopValue = slider.value;
    _titleTopLabel.text = [NSString stringWithFormat:@"%.1f",_titleTopValue];
    [self valueChanged];
}
- (IBAction)titleLeft:(id)sender {
    UISlider *slider = sender;
    _titleLeftValue = slider.value;
    _titleLeftLabel.text = [NSString stringWithFormat:@"%.1f",_titleLeftValue];
    [self valueChanged];
}
- (IBAction)titleBottom:(id)sender {
    UISlider *slider = sender;
    _titleBottomValue = slider.value;
    _titleBottomLabel.text = [NSString stringWithFormat:@"%.1f",_titleBottomValue];
    [self valueChanged];
}
- (IBAction)titleRight:(id)sender {
    UISlider *slider = sender;
    _titleRightValue = slider.value;
    _titleRightLabel.text = [NSString stringWithFormat:@"%.1f",_titleRightValue];
    [self valueChanged];
}

- (void)valueChanged {
    
    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(_imageTopValue, _imageLeftValue, _imageBottomValue, _imageRightValue);
    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(_titleTopValue, _titleLeftValue, _titleBottomValue, _titleRightValue);
//    _resetButton.contentEdgeInsets = UIEdgeInsetsMake(_imageTopValue, _imageLeftValue, _imageBottomValue, _imageRightValue);
//    NSLog(@"imageFrame.x:%.1f",_resetButton.imageView.frame.origin.x);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)imageUpLabelDown:(id)sender {
    
    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(-_resetButton.imageView.bounds.size.height, _resetButton.bounds.size.width/2 - _resetButton.imageView.bounds.size.width/2, 0, 0);
    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(_resetButton.titleLabel.bounds.size.height, _resetButton.bounds.size.width/2 - _resetButton.titleLabel.bounds.size.width/2 - _resetButton.imageView.bounds.size.width, 0, 0);
    
//理论上在水平居中环境下下述情况应该也能成立，但是实际效果并不能实现，原因不明。
//    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(-_resetButton.imageView.bounds.size.height, _resetButton.titleLabel.bounds.size.width, 0, 0);
//    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(_resetButton.titleLabel.bounds.size.height, -_resetButton.imageView.bounds.size.width, 0, 0);
    
}

- (IBAction)imageDownLabelUp:(id)sender {
    
    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(_resetButton.imageView.bounds.size.height, _resetButton.bounds.size.width/2 - _resetButton.imageView.bounds.size.width/2, 0, 0);
    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(-_resetButton.titleLabel.bounds.size.height, _resetButton.bounds.size.width/2 - _resetButton.titleLabel.bounds.size.width/2 - _resetButton.imageView.bounds.size.width, 0, 0);
    
}

- (IBAction)imageCenterLabelCenter:(id)sender {
    
    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(0, _resetButton.bounds.size.width/2 - _resetButton.imageView.bounds.size.width/2, 0, 0);
    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(0, _resetButton.bounds.size.width/2 - _resetButton.titleLabel.bounds.size.width/2 - _resetButton.imageView.bounds.size.width, 0, 0);
}

- (IBAction)imageRightLabelLeft:(id)sender {
    
    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(0, _resetButton.bounds.size.width/2 - _resetButton.imageView.bounds.size.width/2 + _resetButton.titleLabel.bounds.size.width/2, 0, 0);
    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(0, _resetButton.bounds.size.width/2 - 3 *_resetButton.imageView.bounds.size.width/2 - _resetButton.titleLabel.bounds.size.width/2, 0, 0);
//理论上在水平居中环境下下述情况应该也能成立，但是实际效果并不能实现，原因不明。
//    [_resetButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//    _resetButton.imageEdgeInsets = UIEdgeInsetsMake(0, _resetButton.titleLabel.bounds.size.width*2, 0, 0);
//    _resetButton.titleEdgeInsets = UIEdgeInsetsMake(0, -_resetButton.imageView.bounds.size.width*2, 0, 0);
    
}

@end
