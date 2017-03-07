//
//  LittleHealthStationViewController.m
//  HealthStation
//
//  Created by mobile manager on 16/12/15.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import "LittleHealthStationViewController.h"

#import "HealthKnowledgeViewController.h"
#import "DeviceConnectViewController.h"
#import "DiagnoseResultViewController.h"
#import "InDiagnoseViewController.h"



@interface LittleHealthStationViewController ()
{
    UIView *_dataView;
    //UIView *_bottomView;
    
    HealthKnowledgeViewController *_healthKnowledgeVC;
    DeviceConnectViewController *_deviceVC;
}


@end

@implementation LittleHealthStationViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"tab健康小站-未选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"健康小站-选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self layoutUI];
}

- (void)layoutUI {
    _dataView = [[UIView alloc]init];
    _dataView.backgroundColor = UIColorFromHex(0x3cd793);
    //_bottomView = [[UIView alloc]init];
    [self.view addSubview:_dataView];
    //[self.view addSubview:_bottomView];
    
    if (SCREENHEIGHT == 480) {
        _dataView.frame = CGRectMake(0, 0, SCREENWIDTH, 374.f*IPhone4SScaling);
    }else {
        _dataView.frame = CGRectMake(0, 0, SCREENWIDTH, 374.f);
    }
    
    //_bottomView.frame = CGRectMake(0, _dataView.frame.size.height, SCREENWIDTH, SCREENHEIGHT-_dataView.frame.size.height);
    //_bottomView.backgroundColor = [UIColor orangeColor];
    
    
    [self addSomeViewToDataView];
    [self addViewToBottomView];
}

- (void)addSomeViewToDataView {
    UILabel *healthScoreTitleLabel = [[UILabel alloc]init];
    [_dataView addSubview:healthScoreTitleLabel];
    if (SCREENHEIGHT == 480) {
        healthScoreTitleLabel.frame = CGRectMake(0, 75*IPhone4SScaling, 200, 20);
    }else if (SCREENHEIGHT == 568) {
        healthScoreTitleLabel.frame = CGRectMake(0, 75*IPhone5SScaling, 200, 20);
    }else if (SCREENHEIGHT == 736) {
        healthScoreTitleLabel.frame = CGRectMake(0, 75*IPhone6PlusScaling, 200, 20);
    }
    else {
        healthScoreTitleLabel.frame = CGRectMake(0, 75, 200, 20);
    }
    healthScoreTitleLabel.centerX = self.view.centerX;
    healthScoreTitleLabel.font = [UIFont systemFontOfSize:20];
    healthScoreTitleLabel.textColor = [UIColor whiteColor];
    healthScoreTitleLabel.textAlignment = NSTextAlignmentCenter;
    healthScoreTitleLabel.text = @"健康得分";
    
    
    UILabel *healthScoreLabel = [[UILabel alloc]init];
    [_dataView addSubview:healthScoreLabel];
    if (SCREENHEIGHT == 480) {
        healthScoreLabel.frame = CGRectMake(0, 75*IPhone4SScaling+20+13, 250, 100);
    }else if (SCREENHEIGHT == 568) {
        healthScoreLabel.frame = CGRectMake(0, 75*IPhone5SScaling+20+13, 250, 100);
    }else if (SCREENHEIGHT == 736) {
        healthScoreLabel.frame = CGRectMake(0, 75*IPhone6PlusScaling+20+13, 250, 100);
    }
    else {
        healthScoreLabel.frame = CGRectMake(0, 75+20+13, 250, 100);
    }
    healthScoreLabel.centerX = self.view.centerX;
    healthScoreLabel.font = [UIFont systemFontOfSize:135];
    healthScoreLabel.textColor = [UIColor whiteColor];
    healthScoreLabel.textAlignment = NSTextAlignmentCenter;
    healthScoreLabel.text = @"80";
    //healthScoreLabel.backgroundColor = [UIColor greenColor];
    
    
    UILabel *descriptionLabel = [[UILabel alloc]init];
    [_dataView addSubview:descriptionLabel];
    if (SCREENHEIGHT == 480) {
        descriptionLabel.frame = CGRectMake(0, 75*IPhone4SScaling+20+13+100+23, 250, 12);
    }else if (SCREENHEIGHT == 568) {
        descriptionLabel.frame = CGRectMake(0, 75*IPhone5SScaling+20+13+100+23, 250, 12);
    }else if (SCREENHEIGHT == 736) {
        descriptionLabel.frame = CGRectMake(0, 75*IPhone6PlusScaling+20+13+100+23, 250, 12);
    }
    else {
        descriptionLabel.frame = CGRectMake(0, 75+20+13+100+23, 250, 12);
    }
    descriptionLabel.centerX = self.view.centerX;
    descriptionLabel.font = [UIFont systemFontOfSize:12];
    descriptionLabel.textColor = [UIColor whiteColor];
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.text = @"您的身体比较健康，但要注意休息哦";
    
    //底部四个数据label
    NSInteger dataViewHeight = _dataView.frame.size.height;
    CGFloat gap = SCREENWIDTH/4.0f;
    NSArray *dataBottomTitleArr = @[@"收缩压",@"舒张压",@"心率",@"心脏杂音"];
    NSArray *dataBottomDetailArr = @[@"100",@"80",@"95",@"无"];
    for (int i=0; i<dataBottomTitleArr.count; i++) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, dataViewHeight-27-20-10-12, gap, 12)];
        [_dataView addSubview:titleLabel];
        titleLabel.centerX = i*gap + 0.5*gap;
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = dataBottomTitleArr[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, dataViewHeight-27-20, gap, 20)];
        [_dataView addSubview:detailLabel];
        detailLabel.centerX = i*gap + 0.5*gap;
        detailLabel.font = [UIFont systemFontOfSize:20];
        detailLabel.textColor = [UIColor whiteColor];
        detailLabel.text = dataBottomDetailArr[i];
        detailLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((i+1)*gap, dataViewHeight-27-37, 1, 37)];
        imageView.image = [UIImage imageNamed:@"分割线"];
        [_dataView addSubview:imageView];
    }
}


- (void)addViewToBottomView {
    NSInteger dataViewHeight = _dataView.frame.size.height;
    CGFloat gap = SCREENWIDTH/4.0f;
    //_bottomView.userInteractionEnabled = YES;
    
    UIButton *stethoscopeView = [[UIButton alloc]init];
    stethoscopeView.userInteractionEnabled = YES;
    //[_bottomView addSubview:stethoscopeView];
    [self.view addSubview:stethoscopeView];
    //stethoscopeView.backgroundColor = [UIColor orangeColor];
    [stethoscopeView setBackgroundImage:[UIImage imageNamed:@"智能听诊器icon"] forState:UIControlStateNormal];
    [stethoscopeView addTarget:self action:@selector(clickStethoscope) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *boxView = [[UIButton alloc]init];
    [self.view addSubview:boxView];
    [boxView setBackgroundImage:[UIImage imageNamed:@"智能药盒icon"] forState:UIControlStateNormal];
    [boxView addTarget:self action:@selector(clickBox) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *stethoscopeLabel = [[UILabel alloc]init];
    [self.view addSubview:stethoscopeLabel];
    stethoscopeLabel.font = [UIFont systemFontOfSize:12];
    stethoscopeLabel.textColor = UIColorFromHex(0x666666);
    stethoscopeLabel.text = @"智能听诊器";
    stethoscopeLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UILabel *boxLabel = [[UILabel alloc]init];
    [self.view addSubview:boxLabel];
    boxLabel.font = [UIFont systemFontOfSize:12];
    boxLabel.textColor = UIColorFromHex(0x666666);
    boxLabel.text = @"智能药盒";
    boxLabel.textAlignment = NSTextAlignmentCenter;
    
    
    
    if (SCREENHEIGHT == 480) {
        stethoscopeView.frame = CGRectMake(0, 64*IPhone4SScaling+dataViewHeight, 50, 50);
        boxView.frame = CGRectMake(0, 64*IPhone4SScaling+dataViewHeight, 50, 50);
        
        stethoscopeLabel.frame = CGRectMake(0, 64*IPhone4SScaling+dataViewHeight+50+14, 200, 20);
        boxLabel.frame = CGRectMake(0, 64*IPhone4SScaling+dataViewHeight+50+14, 200, 20);
    }else if (SCREENHEIGHT == 568) {
        stethoscopeView.frame = CGRectMake(0, 64*IPhone5SScaling+dataViewHeight, 50, 50);
        boxView.frame = CGRectMake(0, 64*IPhone5SScaling+dataViewHeight, 50, 50);
        
        stethoscopeLabel.frame = CGRectMake(0, 64*IPhone5SScaling+dataViewHeight+50+14, 200, 20);
        boxLabel.frame = CGRectMake(0, 64*IPhone5SScaling+dataViewHeight+50+14, 200, 20);
    }else if (SCREENHEIGHT == 736) {
        stethoscopeView.frame = CGRectMake(0, 64*IPhone6PlusScaling+dataViewHeight, 50, 50);
        boxView.frame = CGRectMake(0, 64*IPhone6PlusScaling+dataViewHeight, 50, 50);
        
        stethoscopeLabel.frame = CGRectMake(0, 64*IPhone6PlusScaling+dataViewHeight+50+14, 200, 20);
        boxLabel.frame = CGRectMake(0, 64*IPhone6PlusScaling+dataViewHeight+50+14, 200, 20);
    }
    else {
        stethoscopeView.frame = CGRectMake(0, 64+dataViewHeight, 50, 50);
        boxView.frame = CGRectMake(0, 64+dataViewHeight, 50, 50);
        
        stethoscopeLabel.frame = CGRectMake(0, 64+dataViewHeight+50+14, 100, 12);
        boxLabel.frame = CGRectMake(0, 64+dataViewHeight+50+14, 100, 12);
    }
    //stethBtn.frame = stethoscopeView.frame;
    //boxBtn.frame = boxView.frame;
    
    //centerX的赋值要放在frame赋值操作后，否则会得不到想要的结果。
    boxView.centerX = 3*gap;
    stethoscopeView.centerX = gap;
    stethoscopeLabel.centerX = gap;
    boxLabel.centerX = 3*gap;
}


- (void)clickStethoscope {
//    DiagnoseResultViewController *diagVC = [[DiagnoseResultViewController alloc]init];
//    [self.navigationController pushViewController:diagVC animated:YES];
    InDiagnoseViewController *inDiaVC = [[InDiagnoseViewController alloc]init];
    inDiaVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:inDiaVC animated:YES];
}

- (void)clickBox {
    
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //_healthKnowledgeVC = [[HealthKnowledgeViewController alloc]init];
////    _deviceVC = [[DeviceConnectViewController alloc]init];
////    [self.navigationController pushViewController:_deviceVC animated:YES];
//    
//    //DiagnoseResultViewController *diagVC = [[DiagnoseResultViewController alloc]init];
//    InDiagnoseViewController *inDiagVC = [[InDiagnoseViewController alloc]init];
//    [self.navigationController pushViewController:inDiagVC animated:YES];
//}




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
