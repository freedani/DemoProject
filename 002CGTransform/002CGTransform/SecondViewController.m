//
//  SecondViewController.m
//  002CGTransform
//
//  Created by 李达 on 2017/2/25.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *transformView;
@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UISlider *slider3;
@property (weak, nonatomic) IBOutlet UISlider *slider4;
@property (weak, nonatomic) IBOutlet UISlider *slider5;
@property (nonatomic) CGFloat angle;
@property (nonatomic) CGFloat sx;
@property (nonatomic) CGFloat sy;
@property (nonatomic) CGFloat tx;
@property (nonatomic) CGFloat ty;
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (weak, nonatomic) IBOutlet UILabel *Label3;
@property (weak, nonatomic) IBOutlet UILabel *Label4;
@property (weak, nonatomic) IBOutlet UILabel *Label5;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _angle = 0;
    _sx = 1;
    _sy = 1;
    _tx = 0;
    _ty = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(UISlider *)sender {
    switch (sender.tag) {
        case 1:
            _angle = sender.value * 2 * M_PI;
            _Label1.text = [NSString stringWithFormat:@"%.1f°",sender.value * 360];
            _transformView.transform = CGAffineTransformMakeRotation(_angle);
            break;
        case 2:
            _sx = sender.value;
            _Label2.text = [NSString stringWithFormat:@"%.1f",sender.value];
            _transformView.transform = CGAffineTransformMakeScale(_sx, _sy);
            break;
        case 3:
            _sy = sender.value;
            _Label3.text = [NSString stringWithFormat:@"%.1f",sender.value];
            _transformView.transform = CGAffineTransformMakeScale(_sx, _sy);
            break;
        case 4:
            _tx = sender.value;
            _Label4.text = [NSString stringWithFormat:@"%.1f",sender.value];
            _transformView.transform = CGAffineTransformMakeTranslation(_tx, _ty);
            break;
        case 5:
            _ty = sender.value;
            _Label5.text = [NSString stringWithFormat:@"%.1f",sender.value];
            _transformView.transform = CGAffineTransformMakeTranslation(_tx, _ty);
            break;
    }
}

- (IBAction)reset:(UIButton *)sender {
    _transformView.transform = CGAffineTransformIdentity;
    _angle = 0;
    _sx = 1;
    _sy = 1;
    _tx = 0;
    _ty = 0;
    _slider1.value = 0;
    _slider2.value = 1;
    _slider3.value = 1;
    _slider4.value = 0;
    _slider5.value = 0;
    _Label1.text = @"0.0°";
    _Label2.text = @"1.0";
    _Label3.text = @"1.0";
    _Label4.text = @"0.0";
    _Label5.text = @"0.0";
}

@end
