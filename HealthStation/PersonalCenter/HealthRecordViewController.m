//
//  HealthRecordViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/24.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "HealthRecordViewController.h"
#import "YFViewPager.h"
#import "HealthRecordTableViewCell.h"

@interface HealthRecordViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic)YFViewPager *viewPager;
@property (strong,nonatomic) UITableView *personalInfoTableView;
@property (strong,nonatomic) UITableView *lifestyleTableView;
@property (strong,nonatomic) UITableView *diseaseTableView;

@property (strong,nonatomic) NSArray *infoTitleArr;
@property (strong,nonatomic) NSArray *lifestyleTitleArr;
@property (strong,nonatomic) NSArray *lifestyleImageArr;
@property (strong,nonatomic) NSArray *diseaseTitleArr;


@end

@implementation HealthRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"健康档案";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self layoutUI];
}


- (void)layoutUI {
    //crate table refer
    NSArray *tabelTitleArr = @[@"个人资料", @"生活习惯", @"个人病史"];
    
    NSArray *infoTitleArr = @[@"年龄", @"身高", @"体重", @"婚姻", @"性别"];
    NSArray *lifestyleTitleArr = @[@"抽烟", @"饮酒", @"饮食规律", @"睡眠规律", @"大小便正常", @"长期服用止痛或镇定催眠药"];
    NSArray *lifestyleImageArr = @[@"抽烟", @"饮酒", @"饮食规律", @"睡眠规律", @"大小便", @"服药"];
    NSArray *diseaseTitleArr = nil;
    _infoTitleArr = infoTitleArr;
    _lifestyleTitleArr = lifestyleTitleArr;
    _diseaseTitleArr = diseaseTitleArr;
    _lifestyleImageArr = lifestyleImageArr;
    
    for (int i=0; i<tabelTitleArr.count; i++) {
        UITableView *tableView = [[UITableView alloc]init];
        tableView.dataSource = self;
        tableView.delegate = self;
        //tableview的分隔线
        tableView.separatorColor = UIColorFromHex(0xD8D9DA);
        tableView.separatorInset = UIEdgeInsetsMake(0,0, 0, 0);
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        switch (i) {
            case 0:
                _personalInfoTableView = tableView;
                break;
            case 1:
                _lifestyleTableView = tableView;
                break;
            case 2:
                _diseaseTableView = tableView;
                break;
                
            default:
                break;
        }
    }
    
    
    //create viewpager refer
    _viewPager = [[YFViewPager alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64)
                                                         titles:tabelTitleArr
                                                          icons:nil
                                                  selectedIcons:nil
                                                          views:@[_personalInfoTableView, _lifestyleTableView, _diseaseTableView]];
    _viewPager.tabSelectedArrowBgColor = UIColorFromHex(0x46d793);
    _viewPager.tabArrowBgColor = UIColorFromHex(0xd1f7ea);
    _viewPager.tabTitleColor = UIColorFromHex(0x000000);
    _viewPager.tabSelectedTitleColor = UIColorFromHex(0x46d793);
    
    [self.view addSubview:_viewPager];
}



#pragma mark - tableview refer
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _personalInfoTableView) {
        return _infoTitleArr.count;
    }else if (tableView == _lifestyleTableView) {
        return _lifestyleTitleArr.count;
    }else {
        return _diseaseTitleArr.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"HealthCell";
    HealthRecordTableViewCell *cell;
    cell = [[HealthRecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    if (tableView == _personalInfoTableView) {
        cell.imageView.image = [UIImage imageNamed:_infoTitleArr[indexPath.row]];
        cell.titleLabel.text = _infoTitleArr[indexPath.row];
        cell.detailLabel.text = @"未设置";
    }else if (tableView == _lifestyleTableView) {
        cell.imageView.image = [UIImage imageNamed:_lifestyleImageArr[indexPath.row]];
        cell.titleLabel.text = _lifestyleTitleArr[indexPath.row];
        cell.detailLabel.text = @"未设置";
    }else {
        cell.imageView.image = [UIImage imageNamed:_diseaseTitleArr[indexPath.row]];
        cell.titleLabel.text = _diseaseTitleArr[indexPath.row];
        cell.detailLabel.text = @"未设置";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
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
