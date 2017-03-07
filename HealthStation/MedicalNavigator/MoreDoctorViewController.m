//
//  MoreDoctorViewController.m
//  HealthStation
//
//  Created by mobile manager on 16/12/21.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import "MoreDoctorViewController.h"
#import "NearbyDoctorModel.h"
#import "NearbyDoctorTableViewCell.h"
#import "DoctorDetailViewController.h"

@interface MoreDoctorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NearbyDoctorModel *docModel;

@end

@implementation MoreDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTestModel];
    [self createUI];
}

- (void)createTestModel {
    _docModel = [[NearbyDoctorModel alloc]init];
    _docModel.docIconUrl = @"个人信息";
    _docModel.docHos = @"第一人民医院";
    _docModel.docName = @"黎明";
    _docModel.docDep = @"儿科";
    _docModel.docTitle = @"主任医师";
    _docModel.price = @"30¥";
}


- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}


#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 73;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *docCellID = @"hosCell";
    
    NearbyDoctorTableViewCell *cell;
    cell = [[NearbyDoctorTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:docCellID];
    cell.model = _docModel;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorDetailViewController *docVC = [[DoctorDetailViewController alloc]init];
    [self.navigationController pushViewController:docVC animated:YES];
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
