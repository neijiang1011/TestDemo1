//
//  POPViewController.m
//  智能药盒
//
//  Created by 刘明鸣 on 2017/2/17.
//  Copyright © 2017年 刘明鸣. All rights reserved.
//

#import "POPViewController.h"
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

@interface POPViewController ()

@end

@implementation POPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    label1.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0-50);
    label1.textColor = UIColorFromHex(0x333333);
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"收到了一条医生的回复";
    label1.font = [UIFont systemFontOfSize:16];
    [self.view addSubview: label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label2.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0 -25-15-50);
    label2.textColor = UIColorFromHex(0x666666);
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"问诊提醒";
    label2.font = [UIFont systemFontOfSize:23];
    [self.view addSubview: label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    label3.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0 + 8 +10-50);
    label3.textColor = UIColorFromHex(0x333333);
    label3.textAlignment = NSTextAlignmentCenter;
    label3.text = @"请马上查看";
    label3.font = [UIFont systemFontOfSize:16];
    [self.view addSubview: label3];
    
    CGFloat btnWidth = 150;
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnWidth, 50)];
    btn1.center = CGPointMake(self.view.frame.size.width/2.0-btnWidth/2.0-6,label3.frame.origin.y+label3.frame.size.height+67);
    btn1.layer.masksToBounds = YES;
    btn1.layer.cornerRadius = 25;
    btn1.layer.borderColor = UIColorFromHex(0x3cd793).CGColor;
    btn1.layer.borderWidth = 2.f;
    [btn1 setTitle:@"忽略" forState:UIControlStateNormal];
    [btn1 setTitleColor:UIColorFromHex(0x3cd793) forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnWidth, 50)];
    btn2.center = CGPointMake(self.view.frame.size.width/2.0+btnWidth/2.0+6,label3.frame.origin.y+label3.frame.size.height+67);
    btn2.layer.masksToBounds = YES;
    btn2.layer.cornerRadius = 25;
    [btn2 setTitle:@"马上查看" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.backgroundColor = UIColorFromHex(0x3cd793);
    [self.view addSubview:btn2];

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
