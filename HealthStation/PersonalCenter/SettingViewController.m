//
//  SettingViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/25.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titleArr;
    NSArray *_imageArr;
}
@property (strong,nonatomic)UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置与帮助";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];
}


- (void)createTableView {
    NSArray *titleArr = @[@"自动同步数据",@"清理缓存",@"法律声明",@"关于我们",@"使用说明",@"软件版本", @"退出登陆"];
    NSArray *imageArr = @[@"设置与帮助",@"清理缓存",@"法律声明",@"关于我们",@"使用说明",@"软件版本", @"退出登陆"];
    _titleArr = titleArr;
    _imageArr = imageArr;
    
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
    
    
    if (!cell && indexPath.row == 0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
        cell.textLabel.text = _titleArr[indexPath.row];
        //and UISwitch
        UISwitch *mySwitch = [[UISwitch alloc]init];
        [cell.contentView addSubview:mySwitch];
        
        [mySwitch mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(cell.contentView).offset(-10);
            make.top.equalTo(cell.contentView).offset(12);
            make.width.equalTo(@51);
            make.height.equalTo(@31);
        }];
    }else {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
        cell.textLabel.text = _titleArr[indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 6:
        {
            [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:NO];
            //通知首页弹出登录页
            
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
