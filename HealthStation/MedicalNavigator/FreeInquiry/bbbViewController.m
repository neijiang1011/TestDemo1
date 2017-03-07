//
//  bbbViewController.m
//  智能药盒
//
//  Created by 刘明鸣 on 2017/2/20.
//  Copyright © 2017年 刘明鸣. All rights reserved.
//

#import "bbbViewController.h"
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
#define cellHight 70.0

@interface bbbViewController ()

@property (nonatomic,strong) UITableView *tableview;

@end

BOOL flages[6]; //记录多选
@implementation bbbViewController
-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray  =  [NSArray arrayWithObjects:@"心率：80 肺部杂音：无",@"心率：80 心脏杂音：无",@"心率：80 肺部杂音：无",@"心率：80 心脏杂音：无",@"心率：80 肺部杂音：无",@"心率：80 心脏杂音：无",nil];
    }
    return _dataArray;
}
-(UITableView *)tableview{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i = 0 ; i < 6 ; i++) {
        flages[i] = NO;
    }
    self.tableview.frame = self.view.frame;
    
    [self.view addSubview: self.tableview];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ( flages[indexPath.row] == YES) {
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"单选-点"]];
        }else{
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"单选-没选择"]];
        }
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(16, 0, self.view.frame.size.width - 2*16, 1)];
        line.backgroundColor = UIColorFromHex(0xcccccc);
        [cell addSubview: line];

        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row%2]]];
        image.frame = CGRectMake(16, 10, 30, 30);
        [cell addSubview:image];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(56, 10, 200, 30)];
        label1.text = [_dataArray objectAtIndex:indexPath.row];
        label1.font = [UIFont systemFontOfSize:16];
        [cell addSubview: label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(16, 40, 200, 20)];
        label2.text = @"2016-12-24";
        label2.textColor = UIColorFromHex(0x999999);
        label2.font = [UIFont systemFontOfSize:12];
        [cell addSubview: label2];
    }else{
        if ( flages[indexPath.row] == YES) {
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"单选-点"]];
        }else{
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"单选-没选择"]];
        }
        
    }
    if ( indexPath.row == self.dataArray.count - 1) {
        UIView *downline = [[UIView alloc]initWithFrame:CGRectMake(16, 70, self.view.frame.size.width - 2*16, 1)];
        downline.backgroundColor = UIColorFromHex(0xcccccc);
        [cell addSubview: downline];
    }

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    flages[indexPath.row] = !flages[indexPath.row];
    [tableView reloadData];
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
