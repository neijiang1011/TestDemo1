//
//  DeviceConnectViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "DeviceConnectViewController.h"
#import "DeviceReferModel.h"
#import "DeviceConnectTableViewCell.h"


@interface DeviceConnectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)DeviceReferModel *model;

@end

@implementation DeviceConnectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设备连接";
    // Do any additional setup after loading the view.
    
    [self createTestModel];
    
    BOOL foundDevice = NO;
    if (foundDevice) {
        [self createUI];
    }else {
        UIImageView *notFoundDeviceImageViiew = [[UIImageView alloc]initWithFrame:CGRectMake(0, 190, 100, 100)];
        notFoundDeviceImageViiew.centerX = self.view.centerX;
        notFoundDeviceImageViiew.image = [UIImage imageNamed:@"没可用设备"];
        [self.view addSubview:notFoundDeviceImageViiew];
        
        UILabel *notFoundLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 290+19, 200, 14)];
        notFoundLabel.centerX = self.view.centerX;
        notFoundLabel.textColor = UIColorFromHex(0x999999);
        notFoundLabel.text = @"未检测到可用设备";
        notFoundLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:notFoundLabel];
    }
}

- (void)createTestModel {
    _model = [[DeviceReferModel alloc]init];
    _model.iconUrl = @"智能听诊器设备";
    _model.name = @"智能听诊器设备";
    _model.connectState = @"已连接";
    _model.connectStateIconUrl = @"已连接";
}


- (void)createUI {
    //添加标题label
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 14+64, 120, 14)];
    [self.view addSubview:titleLabel];
    titleLabel.text = @"可选设备";
    titleLabel.textColor = UIColorFromHex(0x666666);
    
    
    //add tableview
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+41, SCREENWIDTH, SCREENHEIGHT-64)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}


#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *docCellID = @"healthCell";
    
    DeviceConnectTableViewCell *cell;
    cell = [[DeviceConnectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:docCellID];
    cell.model = _model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //_detailVC = [[KnowledgeDetailViewController alloc]init];
    //[self.navigationController pushViewController:_detailVC animated:YES];
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
