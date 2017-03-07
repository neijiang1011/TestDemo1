//
//  BarcodeViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/18.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "BarcodeViewController.h"

@interface BarcodeViewController ()

@end

@implementation BarcodeViewController


//- (void)viewWillAppear:(BOOL)animated {
//    self.hidesBottomBarWhenPushed = YES;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的二维码";
    
    
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI {
    UIView *allInfoView = [[UIView alloc]initWithFrame:CGRectMake(42, 64+73, SCREENWIDTH-42*2, 280)];
    allInfoView.layer.masksToBounds = YES;
    allInfoView.layer.cornerRadius = 5;
    allInfoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:allInfoView];
    allInfoView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    allInfoView.layer.borderWidth = 1;
    
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, allInfoView.frame.size.width, 40)];
    topView.backgroundColor = [UIColor colorWithRed:55.f/255 green:215.f/255 blue:153.f/255 alpha:1];
    [allInfoView addSubview:topView];
    //设置两个圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:topView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = topView.bounds;
    maskLayer.path = maskPath.CGPath;
    topView.layer.mask = maskLayer;
    topView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    topView.layer.borderWidth = 1;
    
    
    
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(42+23, 64+73-24, 55, 55)];
//    avatar.layer.masksToBounds = YES;
//    avatar.layer.cornerRadius = 15;
    [self.view addSubview:avatar];
    avatar.image = [UIImage imageNamed:@"性别标识女"];
    
    UIImageView *sexFlag = [[UIImageView alloc]initWithFrame:CGRectMake(18, 10, 20, 20)];
//    sexFlag.layer.masksToBounds = YES;
//    sexFlag.layer.cornerRadius = 5;
    [allInfoView addSubview:sexFlag];
    sexFlag.image = [UIImage imageNamed:@"性别标识女"];
    
    
    
    //barcode
    UIImageView *barcodeView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45+40, 150, 150)];
    barcodeView.centerX = self.view.centerX;
    barcodeView.backgroundColor = [UIColor blueColor];
    [allInfoView addSubview:barcodeView];
    barcodeView.image = [UIImage imageNamed:@"性别标识女"];
    
    //label
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64+73+240+20, SCREENWIDTH, 12)];
    titleLabel.text = @"扫一扫二维码图案，关注我的健康状况";
    [self.view addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = UIColorFromHex(0x333333);
    
    
    
    
    [barcodeView mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@140);
        make.height.equalTo(@140);
        make.centerX.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(30);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@(SCREENWIDTH));
        make.height.equalTo(@12);
        make.centerX.equalTo(self.view);
        make.top.equalTo(allInfoView.mas_bottom).offset(20);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
