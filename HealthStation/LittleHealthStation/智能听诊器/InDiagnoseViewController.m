//
//  InDiagnoseViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/27.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "InDiagnoseViewController.h"

@interface InDiagnoseViewController ()

@end

@implementation InDiagnoseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}


- (void)layoutUI {
    self.title = @"智能听诊器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-68)];
    [self.view addSubview:scrollView];
    
    //topView refer
    UIView *topView = [[UIView alloc]init];
    [scrollView addSubview:topView];
    topView.backgroundColor = UIColorFromHex(0x3bd793);
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.text = @"心肌收缩能力";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    [topView addSubview:titleLabel];
    
    
    UILabel *scoreLabel = [[UILabel alloc]init];
    scoreLabel.font = [UIFont systemFontOfSize:120];
    scoreLabel.text = @"80";
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.textColor = [UIColor whiteColor];
    [topView addSubview:scoreLabel];
    
    
    UILabel *unitLabel = [[UILabel alloc]init];
    unitLabel.font = [UIFont systemFontOfSize:20];
    unitLabel.text = @"分";
    unitLabel.textAlignment = NSTextAlignmentCenter;
    unitLabel.textColor = [UIColor whiteColor];
    [topView addSubview:unitLabel];
    
    
    topView.sd_layout.leftEqualToView(scrollView).topEqualToView(scrollView).rightEqualToView(scrollView).heightIs(275);
    titleLabel.sd_layout.topSpaceToView(topView,24).centerXEqualToView(topView).widthIs(280).heightIs(20);
    scoreLabel.sd_layout.centerXEqualToView(topView).topSpaceToView(titleLabel,13).widthIs(200).heightIs(145);
    unitLabel.sd_layout.topSpaceToView(scoreLabel,20).centerXEqualToView(topView).widthIs(200).heightIs(20);
    
    
   
    
    //肺音波形图相关
    UIImageView *lungVoiceImageView = [[UIImageView alloc]init];
    [scrollView addSubview:lungVoiceImageView];
    lungVoiceImageView.image = [UIImage imageNamed:@"心波图bg"];
    lungVoiceImageView.sd_layout.leftEqualToView(scrollView).rightEqualToView(scrollView).topSpaceToView(topView,0).heightIs(190);
    
    {
        UIImageView *line = [[UIImageView alloc]init];
        [scrollView addSubview:line];
        line.image = [UIImage imageNamed:@"肺音"];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = [UIFont systemFontOfSize:11];
        priceLabel.textColor = UIColorFromHex(0x666666);
        priceLabel.text = @"肺音";
        [scrollView addSubview:priceLabel];
        
        line.sd_layout.leftSpaceToView(scrollView,16).widthIs(24).topSpaceToView(lungVoiceImageView,6).heightIs(24);
        priceLabel.sd_layout.leftSpaceToView(line,4).topSpaceToView(lungVoiceImageView,11).widthIs(100).heightIs(11);
        
       
    }
    
    {
        UILabel *timerLabel = [[UILabel alloc]init];
        timerLabel.font = [UIFont systemFontOfSize:20];
        timerLabel.textColor = UIColorFromHex(0x333333);
        timerLabel.textAlignment = NSTextAlignmentCenter;
        timerLabel.text = @"00:20";
        [scrollView addSubview:timerLabel];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.font = [UIFont systemFontOfSize:10];
        priceLabel.textColor = UIColorFromHex(0x666666);
        priceLabel.text = @"20秒之后才能停止检测";
        [scrollView addSubview:priceLabel];
        
        timerLabel.sd_layout.centerXEqualToView(scrollView).widthIs(200).topSpaceToView(lungVoiceImageView,50).heightIs(20);
        priceLabel.sd_layout.centerXEqualToView(scrollView).widthIs(200).topSpaceToView(timerLabel,13).heightIs(10);
        
        [scrollView setupAutoContentSizeWithBottomView:priceLabel bottomMargin:10];
    }
    
    
    //bottom button
    UIButton *consultBtn = [[UIButton alloc]init];
    [consultBtn setTitle:@"停止检测" forState:UIControlStateNormal];
    consultBtn.backgroundColor = [UIColor lightGrayColor];
    consultBtn.layer.masksToBounds = YES;
    consultBtn.layer.cornerRadius = 21.f;
    consultBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    consultBtn.layer.borderWidth = 1.f;
    [self.view addSubview:consultBtn];
    consultBtn.backgroundColor = [UIColor blueColor];
    consultBtn.sd_layout.rightSpaceToView(self.view,38).bottomSpaceToView(self.view,13).leftSpaceToView(self.view,38).heightIs(42);
    
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
