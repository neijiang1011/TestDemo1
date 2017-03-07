//
//  ElectrocardiogramTableViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/3/7.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "ElectrocardiogramTableViewController.h"
#import "ElectrocardiogramModel.h"
#import "ElectrocardiogramTableViewCell.h"

@interface ElectrocardiogramTableViewController ()

@property (strong,nonatomic)NSArray *modelArr;
//@property (assign,nonatomic)NSInteger selectIndex;
@property (strong,nonatomic)NSMutableArray *selectedIndexArr;

@end

@implementation ElectrocardiogramTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"心电图";
    self.view.backgroundColor = [UIColor whiteColor];
    //_selectIndex = -1;
    _selectedIndexArr = [[NSMutableArray alloc]init];
    
    [self createLeftAndRightItem];
    [self createTestModel];
}

//定义左右item
- (void)createLeftAndRightItem {
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(clickEnsure)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)clickEnsure {
    
}


- (void)createTestModel {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (int i=0; i<20; i++) {
        ElectrocardiogramModel *model = [[ElectrocardiogramModel alloc]init];
        model.time = @"2016-12-24";
        model.heartRate = @"心率：80";
        
        [arr addObject:model];
    }
    
    _modelArr = arr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *electrocarId = @"electroId";
    ElectrocardiogramTableViewCell *cell;
    // Configure the cell...
    cell = [[ElectrocardiogramTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:electrocarId];
    cell.model = _modelArr[indexPath.row];
    
    for (int i=0; i<_selectedIndexArr.count; i++) {
        if (indexPath.row == [_selectedIndexArr[i] integerValue]) {
            cell.selectedState = YES;
        }
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ElectrocardiogramTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];    
//    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
//    cell.selectedState = !cell.selectedState;
    
    NSNumber *selectedNum = [NSNumber numberWithInteger:indexPath.row];
    if (![_selectedIndexArr containsObject:selectedNum]) {
        [_selectedIndexArr addObject:selectedNum];
    }else {
        [_selectedIndexArr removeObject:selectedNum];
    }
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
