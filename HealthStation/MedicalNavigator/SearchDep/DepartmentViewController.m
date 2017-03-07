//
//  DepartmentViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/20.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "DepartmentViewController.h"

@interface DepartmentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titleArr;
}
@property (strong,nonatomic)UITableView *tableView;

@end

@implementation DepartmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}

- (void)createTableView {
    self.title = @"选择科室";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArr = @[@"儿科",@"新生儿科",@"小儿呼吸科",@"小儿消化科",@"小儿内科ß"];
    _titleArr = titleArr;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //tableview的分隔线
    tableView.separatorColor = UIColorFromHex(0xD8D9DA);
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 10);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}



#pragma mark - tableview delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell;
    
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.textLabel.textColor = UIColorFromHex(0x666666);
    cell.textLabel.text = _titleArr[indexPath.row];
    
    return cell;
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
