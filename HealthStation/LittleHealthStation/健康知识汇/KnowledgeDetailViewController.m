//
//  KnowledgeDetailViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "KnowledgeDetailViewController.h"

@interface KnowledgeDetailViewController ()
{
    UIWebView *_webView;
}
@end

@implementation KnowledgeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"详情";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self layoutUI];
}

- (void)layoutUI {
    self.view.backgroundColor = [UIColor whiteColor];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];
    
    
    //add bottom toolbar
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-32, SCREENWIDTH, 32)];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UIButton *commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(16, 8, 100, 16)];
    [commentBtn setTitleColor:UIColorFromHex(0x46d793) forState:UIControlStateNormal];
    [commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    [bottomView addSubview:commentBtn];
    [commentBtn addTarget:self action:@selector(clickCommentBtn) forControlEvents:UIControlEventTouchUpInside];
}


- (void)clickCommentBtn {
    
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
