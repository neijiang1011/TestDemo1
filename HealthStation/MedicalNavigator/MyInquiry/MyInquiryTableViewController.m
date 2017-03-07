//
//  MyInquiryTableViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/24.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "MyInquiryTableViewController.h"
#import "MyInquiryModel.h"
#import "MyInquiryTableViewCell.h"

@interface MyInquiryTableViewController ()

@property (strong,nonatomic)MyInquiryModel *inquiryModel;

@end

@implementation MyInquiryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"我的问诊";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTestModel];
}


- (void)createTestModel {
    _inquiryModel = [[MyInquiryModel alloc]init];
    _inquiryModel.docIconUrl = @"医疗导航";
    _inquiryModel.docHos = @"第一人民医院";
    _inquiryModel.docName = @"黎明";
    _inquiryModel.docDep = @"儿科";
    _inquiryModel.docTitle = @"主任医师";
    _inquiryModel.patientName = @"患者：啊呜";
    _inquiryModel.time = @"询问时间：2016-10-12";
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
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *myInquiryCellId = @"myInquiryCellId";
    // Configure the cell...
    MyInquiryTableViewCell *cell = [[MyInquiryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myInquiryCellId];
    cell.model = _inquiryModel;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 197;
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
