//
//  MyCollectionViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/25.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "HealthKnowledgeModel.h"
#import "HealthknowledgeTableViewCell.h"
#import "KnowledgeDetailViewController.h"

@interface MyCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)HealthKnowledgeModel *model;
@property (strong,nonatomic)KnowledgeDetailViewController *detailVC;

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的收藏";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTestModel];
    [self createUI];
}

- (void)createTestModel {
    _model = [[HealthKnowledgeModel alloc]init];
    _model.picUrl = @"健康知识汇";
    _model.title = @"健康知识汇";
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
    return 154;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *docCellID = @"healthCell";
    
    HealthknowledgeTableViewCell *cell;
    cell = [[HealthknowledgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:docCellID];
    cell.model = _model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _detailVC = [[KnowledgeDetailViewController alloc]init];
    [self.navigationController pushViewController:_detailVC animated:YES];
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
