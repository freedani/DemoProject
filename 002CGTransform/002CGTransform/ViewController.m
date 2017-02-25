//
//  ViewController.m
//  002CGTransform
//
//  Created by 李达 on 2017/2/25.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *transformView;
@property (nonatomic) CGFloat a;
@property (nonatomic) CGFloat b;
@property (nonatomic) CGFloat c;
@property (nonatomic) CGFloat d;
@property (nonatomic) CGFloat tx;
@property (nonatomic) CGFloat ty;
@property (weak, nonatomic) IBOutlet UISlider *slidera;
@property (weak, nonatomic) IBOutlet UISlider *sliderb;
@property (weak, nonatomic) IBOutlet UISlider *sliderc;
@property (weak, nonatomic) IBOutlet UISlider *sliderd;
@property (weak, nonatomic) IBOutlet UISlider *slidertx;
@property (weak, nonatomic) IBOutlet UISlider *sliderty;
@property (weak, nonatomic) IBOutlet UILabel *Labela;
@property (weak, nonatomic) IBOutlet UILabel *Labelb;
@property (weak, nonatomic) IBOutlet UILabel *Labelc;
@property (weak, nonatomic) IBOutlet UILabel *Labeld;
@property (weak, nonatomic) IBOutlet UILabel *Labeltx;
@property (weak, nonatomic) IBOutlet UILabel *Labelty;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _a = 1;
    _b = 0;
    _c = 0;
    _d = 1;
    _tx = 0;
    _ty = 0;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)valueChanged:(UISlider*)sender {
    switch (sender.tag) {
        case 1:
            _a = sender.value;
            _Labela.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
        case 2:
            _b = sender.value;
            _Labelb.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
        case 3:
            _c = sender.value;
            _Labelc.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
        case 4:
            _d = sender.value;
            _Labeld.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
        case 5:
            _tx = sender.value;
            _Labeltx.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
        case 6:
            _ty = sender.value;
            _Labelty.text = [NSString stringWithFormat:@"%.1f",sender.value];
            break;
    }
    [self transform];
}
- (IBAction)reset:(UIButton *)sender {
    _a = 1;
    _b = 0;
    _c = 0;
    _d = 1;
    _tx = 0;
    _ty = 0;
    _slidera.value = _a;
    _sliderb.value = _b;
    _sliderc.value = _c;
    _sliderd.value = _d;
    _slidertx.value = _tx;
    _sliderty.value = _ty;
    _Labela.text = [NSString stringWithFormat:@"%.1f",_slidera.value];
    _Labelb.text = [NSString stringWithFormat:@"%.1f",_sliderb.value];
    _Labelc.text = [NSString stringWithFormat:@"%.1f",_sliderc.value];
    _Labeld.text = [NSString stringWithFormat:@"%.1f",_sliderd.value];
    _Labeltx.text = [NSString stringWithFormat:@"%.1f",_slidertx.value];
    _Labelty.text = [NSString stringWithFormat:@"%.1f",_sliderty.value];
    [self transform];
}


- (void)transform {
    _transformView.transform = CGAffineTransformMake(_a, _b, _c, _d, _tx, _ty);
}

@end
