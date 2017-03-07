//
//  DoctorDetailViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/25.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "DoctorDetailViewController.h"

@interface DoctorDetailViewController ()
{
    UIImageView *_line1;
}


@end

@implementation DoctorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}


- (void)layoutUI {
    self.title = @"医生详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-68)];
    [self.view addSubview:scrollView];
    
    //topView refer
    UIView *topView = [[UIView alloc]init];
    [scrollView addSubview:topView];
    topView.backgroundColor = UIColorFromHex(0xfe8484);
    
    UIImageView *avatar = [[UIImageView alloc]init];
    avatar.image = [UIImage imageNamed:@"个人中心-选中"];
    avatar.layer.masksToBounds = YES;
    avatar.layer.cornerRadius = 40.f;
    [topView addSubview:avatar];
    
    
    UILabel *docLabel = [[UILabel alloc]init];
    docLabel.font = [UIFont systemFontOfSize:20];
    docLabel.text = @"张三 副主任医师";
    docLabel.textAlignment = NSTextAlignmentCenter;
    docLabel.textColor = [UIColor whiteColor];
    [topView addSubview:docLabel];
    
    
    UILabel *hotDegreeLabel = [[UILabel alloc]init];
    hotDegreeLabel.font = [UIFont systemFontOfSize:12];
    hotDegreeLabel.text = @"患者推荐热度：4.1";
    hotDegreeLabel.textAlignment = NSTextAlignmentRight;
    hotDegreeLabel.textColor = [UIColor whiteColor];
    [topView addSubview:hotDegreeLabel];
    
    UIImageView *hotPic = [[UIImageView alloc]init];
    hotPic.image = [UIImage imageNamed:@"医生简介-火"];
    [topView addSubview:hotPic];
    
    
    UIImageView *praiseBtn = [[UIImageView alloc]init];
    praiseBtn.image = [UIImage imageNamed:@"医生简介点赞-未点"];
    [topView addSubview:praiseBtn];
    
    UILabel *helpLabel = [[UILabel alloc]init];
    helpLabel.font = [UIFont systemFontOfSize:12];
    helpLabel.text = @"帮助患者数：221";
    helpLabel.textAlignment = NSTextAlignmentCenter;
    helpLabel.textColor = [UIColor whiteColor];
    [topView addSubview:helpLabel];
    
    
    topView.sd_layout.leftEqualToView(scrollView).topEqualToView(scrollView).rightEqualToView(scrollView).heightIs(202);
    avatar.sd_layout.topSpaceToView(topView,12).centerXEqualToView(topView).widthIs(80).heightIs(80);
    docLabel.sd_layout.topSpaceToView(avatar,8).centerXEqualToView(topView).widthIs(280).heightIs(20);
    hotDegreeLabel.sd_layout.rightSpaceToView(avatar,-50).topSpaceToView(docLabel,14).widthIs(160).heightIs(12);
    hotPic.sd_layout.leftSpaceToView(hotDegreeLabel,5).topSpaceToView(docLabel,10).widthIs(20).heightIs(20);
    praiseBtn.sd_layout.leftSpaceToView(hotPic,8).topSpaceToView(docLabel,10).widthIs(70).heightIs(20);
    helpLabel.sd_layout.topSpaceToView(hotDegreeLabel,14).centerXEqualToView(topView).widthIs(200).heightIs(16);
    
    
    {
    //address and good at
    UIImageView *addressImageView = [[UIImageView alloc]init];
    [scrollView addSubview:addressImageView];
    addressImageView.image = [UIImage imageNamed:@"医生简介-出诊地点"];
    
    UILabel *addTitleLabel = [[UILabel alloc]init];
    addTitleLabel.font = [UIFont systemFontOfSize:16];
    addTitleLabel.text = @"出诊地点";
    addTitleLabel.textColor = UIColorFromHex(0x333333);
    [scrollView addSubview:addTitleLabel];
    
    UILabel *addDetailLabel = [[UILabel alloc]init];
    addDetailLabel.font = [UIFont systemFontOfSize:12];
    addDetailLabel.text = @"成都市第一人民医院";
    addDetailLabel.textColor = UIColorFromHex(0x666666);
    [scrollView addSubview:addDetailLabel];
    
    UIImageView *line = [[UIImageView alloc]init];
    [scrollView addSubview:line];
    line.image = [UIImage imageNamed:@"下划线"];
        _line1 = line;
    
    addressImageView.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(topView,18).widthIs(20).heightIs(20);
    addTitleLabel.sd_layout.leftSpaceToView(addressImageView,20).topSpaceToView(topView,20).widthIs(100).heightIs(16);
    addDetailLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(addTitleLabel,11).rightSpaceToView(scrollView,16).autoHeightRatio(0);
    line.sd_layout.leftEqualToView(scrollView).rightEqualToView(scrollView).topSpaceToView(addDetailLabel,20).heightIs(1);
    }
    
    
    {
        //good at refer
        UIImageView *addressImageView = [[UIImageView alloc]init];
        [scrollView addSubview:addressImageView];
        addressImageView.image = [UIImage imageNamed:@"医生简介-专业擅长"];
        
        UILabel *addTitleLabel = [[UILabel alloc]init];
        addTitleLabel.font = [UIFont systemFontOfSize:16];
        addTitleLabel.text = @"专业擅长";
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
        
        addressImageView.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(_line1,18).widthIs(20).heightIs(20);
        addTitleLabel.sd_layout.leftSpaceToView(addressImageView,20).topSpaceToView(_line1,20).widthIs(100).heightIs(16);
        addDetailLabel.sd_layout.leftSpaceToView(scrollView,16).topSpaceToView(addTitleLabel,11).rightSpaceToView(scrollView,16).autoHeightRatio(0);
        line.sd_layout.leftSpaceToView(scrollView,16).rightSpaceToView(scrollView,16).topSpaceToView(addDetailLabel,20).heightIs(1);
        
        
        [scrollView setupAutoContentSizeWithBottomView:line bottomMargin:10];
    }
    
    
    UIButton *consultBtn = [[UIButton alloc]init];
    [consultBtn setTitle:@"去咨询" forState:UIControlStateNormal];
    consultBtn.backgroundColor = [UIColor lightGrayColor];
    consultBtn.layer.masksToBounds = YES;
    consultBtn.layer.cornerRadius = 21.f;
    consultBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    consultBtn.layer.borderWidth = 1.f;
    [self.view addSubview:consultBtn];
    consultBtn.backgroundColor = [UIColor blueColor];
    consultBtn.sd_layout.rightSpaceToView(self.view,16).bottomSpaceToView(self.view,13).widthIs(170).heightIs(42);
    
    //设置富文本相关属性
    NSString *price = @"单词咨询：¥34";
    NSMutableAttributedString *attrPrice = [[NSMutableAttributedString alloc]initWithString:price];
    [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 5)];
    [attrPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(5, price.length-5)];
    [attrPrice addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0xfe3636) range:NSMakeRange(5, price.length-5)];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.attributedText = attrPrice;
    [self.view addSubview:priceLabel];
    priceLabel.sd_layout.leftSpaceToView(self.view,16).bottomSpaceToView(self.view,27).widthIs(150).heightIs(14);
    
    
    //[scrollView setupAutoContentSizeWithBottomView:line bottomMargin:10];

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
