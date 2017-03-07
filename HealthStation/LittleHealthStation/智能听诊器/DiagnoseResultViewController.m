//
//  DiagnoseResultViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/27.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "DiagnoseResultViewController.h"

@interface DiagnoseResultViewController ()

{
    UIImageView *_line1;
    UIImageView *_line2;
    UIImageView *_line3;
}

@end

@implementation DiagnoseResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}


- (void)layoutUI {
    self.title = @"诊断结果";
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
    
    
    {
        //富文本
        NSInteger breakPoint = 3;
        NSString *price = @"心率：80";
        NSMutableAttributedString *attrPrice = [[NSMutableAttributedString alloc]initWithString:price];
        [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, breakPoint)];
        [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(breakPoint, price.length-breakPoint)];
        [attrPrice addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x333333) range:NSMakeRange(0, breakPoint)];
        [attrPrice addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x666666) range:NSMakeRange(breakPoint, price.length-breakPoint)];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.attributedText = attrPrice;
        [scrollView addSubview:priceLabel];
        
        UIImageView *line = [[UIImageView alloc]init];
        [scrollView addSubview:line];
        line.image = [UIImage imageNamed:@"下划线"];
        _line1 = line;
        
        priceLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(topView,15).widthIs(200).heightIs(16);
        line.sd_layout.leftSpaceToView(scrollView,16).rightSpaceToView(scrollView,16).topSpaceToView(priceLabel,16).heightIs(1);
    }
    
    {
        //富文本
        NSInteger breakPoint = 5;
        NSString *price = @"杂音描述：未发现杂音";
        NSMutableAttributedString *attrPrice = [[NSMutableAttributedString alloc]initWithString:price];
        [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, breakPoint)];
        [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(breakPoint, price.length-breakPoint)];
        [attrPrice addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x333333) range:NSMakeRange(0, breakPoint)];
        [attrPrice addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x666666) range:NSMakeRange(breakPoint, price.length-breakPoint)];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.attributedText = attrPrice;
        [scrollView addSubview:priceLabel];
        
        UIImageView *line = [[UIImageView alloc]init];
        [scrollView addSubview:line];
        line.image = [UIImage imageNamed:@"下划线"];
        _line2 = line;
        
        priceLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(_line1,15).widthIs(200).heightIs(16);
        line.sd_layout.leftSpaceToView(scrollView,16).rightSpaceToView(scrollView,16).topSpaceToView(priceLabel,16).heightIs(1);
    }
    
    
    {
        UILabel *addTitleLabel = [[UILabel alloc]init];
        addTitleLabel.font = [UIFont systemFontOfSize:16];
        addTitleLabel.text = @"描述：";
        addTitleLabel.textColor = UIColorFromHex(0x333333);
        [scrollView addSubview:addTitleLabel];
        
        UILabel *addDetailLabel = [[UILabel alloc]init];
        addDetailLabel.font = [UIFont systemFontOfSize:12];
        addDetailLabel.text = @"擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病擅长各种疾病皮肤病";
        addDetailLabel.textColor = UIColorFromHex(0x666666);
        [scrollView addSubview:addDetailLabel];
        
        UIImageView *line = [[UIImageView alloc]init];
        [scrollView addSubview:line];
        //line.backgroundColor = [UIColor blueColor];
        line.image = [UIImage imageNamed:@"下划线"];
        _line3 = line;
        
        addTitleLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(_line2,20).widthIs(100).heightIs(16);
        addDetailLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(addTitleLabel,11).rightSpaceToView(scrollView,16).autoHeightRatio(0);
        line.sd_layout.leftSpaceToView(scrollView,16).rightSpaceToView(scrollView,16).topSpaceToView(addDetailLabel,40).heightIs(1);
    }
    
    [scrollView setupAutoContentSizeWithBottomView:_line3 bottomMargin:10];
    
    
    UIButton *consultBtn = [[UIButton alloc]init];
    [consultBtn setTitle:@"完成听诊" forState:UIControlStateNormal];
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
