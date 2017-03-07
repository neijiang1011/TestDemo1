//
//  MyTabbarController.m
//  HealthStation
//
//  Created by mobile manager on 17/3/1.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "MyTabbarController.h"
#import "LoginViewController.h"

@interface MyTabbarController ()

@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedIndex = 1;
    
    //跳转登录界面
    LoginViewController *loginnVC = [[LoginViewController alloc]init];
    loginnVC.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:loginnVC animated:NO];
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
