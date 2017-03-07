//
//  MedicalNavigatorViewController.m
//  HealthStation
//
//  Created by mobile manager on 16/12/15.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import "MedicalNavigatorViewController.h"
#import "NearbyHosModel.h"
#import "NearbyHospitalTableViewCell.h"
#import "NearbyDoctorModel.h"
#import "NearbyDoctorTableViewCell.h"
#import "HealthKnowledgeModel.h"
#import "HealthknowledgeTableViewCell.h"

#import "MoreDoctorViewController.h"
#import "MoreHosTableViewController.h"
#import "SDCycleScrollView.h"

#import "FreeInquiryViewController.h"
#import "SearchDepartmentViewController.h"
#import "MyInquiryTableViewController.h"


#import "DoctorDetailViewController.h"
//#import "HealthKnowledgeViewController.h"
#import "KnowledgeDetailViewController.h"


@interface MedicalNavigatorViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong)NearbyHosModel *hosModel;
@property (nonatomic,strong)NearbyDoctorModel *docModel;
@property (nonatomic,strong)HealthKnowledgeModel *healthModel;


@property (nonatomic,strong)NSArray *headerTitleArr;

//轮播器
@property (strong,nonatomic)SDCycleScrollView *cycleSV;

@end

@implementation MedicalNavigatorViewController


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
    //self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"医疗导航-未选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"医疗导航-选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSArray *headerTitleArr = @[@"医院推荐",@"名医问诊",@"健康知识汇"];
    _headerTitleArr = headerTitleArr;
    //NSArray *headerImageArr = @[@"医院推荐",@"名医问诊",@"健康知识汇"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createTestModel];
    [self createUI];
}

- (void)createTestModel {
    _hosModel = [[NearbyHosModel alloc]init];
    _hosModel.hosIconUrl = @"个人信息";
    _hosModel.hosName = @"第一人民医院";
    _hosModel.hosDistance = @"8.9km";
    
    
    _docModel = [[NearbyDoctorModel alloc]init];
    _docModel.docIconUrl = @"个人信息";
    _docModel.docHos = @"第一人民医院";
    _docModel.docName = @"黎明";
    _docModel.docDep = @"儿科";
    _docModel.docTitle = @"主任医师";
    _docModel.price = @"30¥";
    
    
    _healthModel = [[HealthKnowledgeModel alloc]init];
    _healthModel.picUrl = @"健康知识汇";
    _healthModel.title = @"健康知识汇";
}


- (void)createUI {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView *headerView = [self createTableHeaderView];
    tableView.tableHeaderView = headerView;
}


- (UIView *)createTableHeaderView {
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 175+70)];
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    //add rotator
    NSArray *imageNames = @[@"banner",@"banner",@"banner"];
    // 本地加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, 175) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [tableHeaderView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.autoScrollTimeInterval = 2.0;
    cycleScrollView.currentPageDotColor = UIColorFromHex(0x3bd793);
    cycleScrollView.pageDotColor = [UIColor whiteColor];
    cycleScrollView.pageControlDotSize = CGSizeMake(6, 6);
    //[se addSubview:carouselView];
    
    UILabel *PMLabel = ({
        //PM label
        UILabel *rowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 32, SCREENWIDTH, 12)];
        rowLabel.textColor = UIColorFromHex(0xffffff);
        rowLabel.font = [UIFont systemFontOfSize:12];
        rowLabel.text = @"成都 PM2.5：100  雾霾严重，请注意防护。";
        rowLabel.textAlignment = NSTextAlignmentCenter;
        
        rowLabel;
    });
    [tableHeaderView addSubview:PMLabel];
    
    
        //三个横排选型
        NSArray *rowTitleArr = @[@"免费问诊",@"查科室",@"我的问诊"];
    NSArray *rowImageArr = @[@"免费问诊",@"查看科室",@"我的问诊"];
        CGFloat rowWidth = (SCREENWIDTH)/3.0f;
        for (int i=0; i<rowTitleArr.count; i++) {
            UIView *rowView = [[UIView alloc]initWithFrame:CGRectMake(i*rowWidth, 175, rowWidth, 70)];
            [tableHeaderView addSubview:rowView];
    
            UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10+175, 27, 27)];
            rowImageView.centerX = rowView.centerX;
            //rowImageView.centerX = (Dis+i*(rowWidth+Dis/2)+rowWidth/2.0f);//要搞清楚自己是添加到哪个父view上面的。此时的坐标系是相对于哪个view来建立的。这里该参考的父亲view是rowView,而不是tableHeaderView。所以这里的centerx出现了问题。
            rowImageView.image = [UIImage imageNamed:rowImageArr[i]];
            [tableHeaderView addSubview:rowImageView];
    
            UILabel *rowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 43+175, 100, 12)];
            rowLabel.centerX = rowView.centerX;
            rowLabel.textColor = UIColorFromHex(0x73839b);
            rowLabel.font = [UIFont systemFontOfSize:12];
            rowLabel.text = rowTitleArr[i];
            rowLabel.textAlignment = NSTextAlignmentCenter;
            [tableHeaderView addSubview:rowLabel];
            
            
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*rowWidth, 175, rowWidth, 70+12)];
            [tableHeaderView addSubview:button];
            switch (i) {
                case 0:
                    [button addTarget:self action:@selector(freeInquiry) forControlEvents:UIControlEventTouchUpInside];
                    break;
                case 1:
                    [button addTarget:self action:@selector(searchDepartment) forControlEvents:UIControlEventTouchUpInside];
                    break;
                case 2:
                    [button addTarget:self action:@selector(myInquiry) forControlEvents:UIControlEventTouchUpInside];
                    break;
                    
                default:
                    break;
            }
        }
    
    
    return tableHeaderView;
}

- (void)freeInquiry {
    FreeInquiryViewController *freeVC = [[FreeInquiryViewController alloc]init];
    freeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:freeVC animated:YES];
}

- (void)searchDepartment {
    SearchDepartmentViewController *searchVC = [[SearchDepartmentViewController alloc]init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)myInquiry {
    MyInquiryTableViewController *inquiryVC = [[MyInquiryTableViewController alloc]init];
    inquiryVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:inquiryVC animated:YES];
}



//- (UIView *)createTableHeaderView {
//    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 165)];
//    tableHeaderView.backgroundColor = [UIColor whiteColor];
//    
//    //标题
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 17, 200, 16)];
//    titleLabel.font = [UIFont systemFontOfSize:16];
//    titleLabel.text = @"医疗导航";
//    titleLabel.textColor = UIColorFromHex(0x6f7f94);
//    [tableHeaderView addSubview:titleLabel];
//    
//    //三个横排选型
//    NSArray *rowTitleArr = @[@"免费问诊",@"医院挂号",@"查科室"];
//    NSArray *rowPicArr = @[@"免费问诊",@"医院挂号",@"查科室"];
//    NSInteger Dis = 12;
//    CGFloat rowWidth = (SCREENWIDTH-12*3)/3.0f;
//    for (int i=0; i<rowPicArr.count; i++) {
//        UIView *rowView = [[UIView alloc]initWithFrame:CGRectMake(Dis+i*(rowWidth+Dis/2), 60, rowWidth, 105)];
//        [tableHeaderView addSubview:rowView];
//        
//        UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake((rowWidth/2.0f-51/2.f), 17, 51, 51)];
//        //rowImageView.centerX = (Dis+i*(rowWidth+Dis/2)+rowWidth/2.0f);//要搞清楚自己是添加到哪个父view上面的。此时的坐标系是相对于哪个view来建立的。这里该参考的父亲view是rowView,而不是tableHeaderView。所以这里的centerx出现了问题。
//        rowImageView.image = [UIImage imageNamed:rowPicArr[i]];
//        [rowView addSubview:rowImageView];
//        
//        UILabel *rowLabel = [[UILabel alloc]initWithFrame:CGRectMake((rowWidth/2.0f-50), 75, 100, 14)];
//        rowLabel.textColor = UIColorFromHex(0x73839b);
//        //rowLabel.centerX = (Dis+i*(rowWidth+Dis/2)+rowWidth/2.0f)-10;
//        rowLabel.font = [UIFont systemFontOfSize:14];
//        rowLabel.text = rowTitleArr[i];
//        rowLabel.textAlignment = NSTextAlignmentCenter;
//        [rowView addSubview:rowLabel];
//    }
//    
//    
//    return tableHeaderView;
//}



#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section == 0) {
//        return 1;
//    }
    
    return 2;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 154;
    }
    
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *hosCellID = @"hosCell";
    static NSString *docCellID = @"docCell";
    static NSString *healthCellID = @"healthCell";
    
    switch (indexPath.section) {
        case 0:
        {
            NearbyHospitalTableViewCell *cell;
            cell = [[NearbyHospitalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hosCellID];
            cell.model = _hosModel;
            
            return cell;
        }
            break;
            
            
        case 2:
        {
            HealthknowledgeTableViewCell *cell;
            cell = [[HealthknowledgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:healthCellID];
            cell.model = _healthModel;
            
            return cell;
        }
            break;
            
        default:
        {
            NearbyDoctorTableViewCell *cell;
            cell = [[NearbyDoctorTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:docCellID];
            cell.model = _docModel;
            
            return cell;
        }
            
            break;
    }
    
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 13, 24, 24)];
    headerImageView.image = [UIImage imageNamed:_headerTitleArr[section]];
    [headerView addSubview:headerImageView];
    
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(48, 17, 100, 16)];
    [headerView addSubview:headerLabel];
    headerLabel.text = _headerTitleArr[section];
    headerLabel.textColor = UIColorFromHex(0x4f4c5f);
    headerLabel.font = [UIFont systemFontOfSize:16];
    
    //添加按钮
    if (section == 2) {
        //do nothing
    }else {
        UILabel *moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-116, 19, 100, 12)];
        moreLabel.textColor = UIColorFromHex(0x4f4c5f);
        moreLabel.font = [UIFont systemFontOfSize:12];
        moreLabel.textAlignment = NSTextAlignmentRight;
        if (section == 0) {
            moreLabel.text = @"更多";
        }else {
            moreLabel.text = @"更多";
        }
        [headerView addSubview:moreLabel];
        
        UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-116, 0, 116, 50)];
        moreBtn.backgroundColor = [UIColor clearColor];
        if (section == 0) {
            [moreBtn addTarget:self action:@selector(showMoreHos) forControlEvents:UIControlEventTouchUpInside];
        }else {
            [moreBtn addTarget:self action:@selector(showMoreDoc) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [headerView addSubview:moreBtn];
    }
    
    
    return headerView;
}


- (void)showMoreHos {
    MoreHosTableViewController *moreHosVC = [[MoreHosTableViewController alloc]init];
    moreHosVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:moreHosVC animated:YES];
}

- (void)showMoreDoc {
    MoreDoctorViewController *moreDocVC = [[MoreDoctorViewController alloc]init];
    moreDocVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:moreDocVC animated:YES];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            DoctorDetailViewController *docVC = [[DoctorDetailViewController alloc]init];
            docVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:docVC animated:YES];
        }
            break;
        case 2:
        {
            KnowledgeDetailViewController *healthVC = [[KnowledgeDetailViewController alloc]init];
            healthVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:healthVC animated:YES];
        }
            break;
            
        default:
            break;
    }
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
