//
//  SuggestionFeedbackViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/25.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "SuggestionFeedbackViewController.h"

@interface SuggestionFeedbackViewController ()

@end

@implementation SuggestionFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"意见反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(14, 75, 200, 30)];
    label1.textColor = UIColorFromHex(0x666666);
    label1.font = [UIFont systemFontOfSize:14];
    label1.text = @"我们懂得聆听，知错就改";
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(14, 340, 300, 30)];
    label2.textColor = UIColorFromHex(0x666666);
    label2.font = [UIFont systemFontOfSize:14];
    label2.text = @"请留下您的联系方式，我们会及时与您沟通";
    [self.view addSubview:label2];
    
    UIView *holder1 = [[UIView alloc]initWithFrame:CGRectMake(14, 105, self.view.frame.size.width - 2*14, 235)];
    holder1.backgroundColor = [UIColor lightGrayColor];
    holder1.backgroundColor = [UIColor whiteColor];
    holder1.layer.masksToBounds = YES;
    holder1.layer.cornerRadius = 8.f;
    holder1.layer.borderColor = UIColorFromHex(0x666666).CGColor;
    holder1.layer.borderWidth = .5f;
    [self.view addSubview:holder1];
    
    UITextView *txt1 = [[UITextView alloc]initWithFrame:CGRectMake(12, 10, holder1.frame.size.width-2*12, holder1.frame.size.height-2*10)];
    txt1.backgroundColor = [UIColor yellowColor];
    txt1.textContainerInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    txt1.font = [UIFont systemFontOfSize:14];
    txt1.textColor = UIColorFromHex(0x666666);
    txt1.text = @"dnaijef;lefj;alkna;ljaegjir啊啊啊啊啊啊啊啊啊啊";
    [holder1 addSubview:txt1];
    
    UIView *holder2 = [[UIView alloc]initWithFrame:CGRectMake(14, 370, self.view.frame.size.width - 2*14, 35)];
    holder2.backgroundColor = [UIColor lightGrayColor];
    holder2.backgroundColor = [UIColor whiteColor];
    holder2.layer.masksToBounds = YES;
    holder2.layer.cornerRadius = 8.f;
    holder2.layer.borderColor = UIColorFromHex(0x666666).CGColor;
    holder2.layer.borderWidth = .5f;
    [self.view addSubview:holder2];
    
    UITextView *txt2 = [[UITextView alloc]initWithFrame:CGRectMake(12, 10, holder2.frame.size.width-2*12, holder2.frame.size.height-2*10)];
    txt2.backgroundColor = [UIColor yellowColor];
    txt2.textContainerInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    txt2.font = [UIFont systemFontOfSize:14];
    txt2.textColor = UIColorFromHex(0x666666);
    txt2.text = @"dnaijef;lefj;alkna;ljaegjir啊啊啊啊啊啊啊啊啊啊";
    txt2.delegate = self;
    [holder2 addSubview:txt2];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 62, self.view.frame.size.width-2*20, 42)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 21.f;
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromHex(0xfffffff) forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColorFromHex(0x00d796)];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    textView.keyboardType = UIKeyboardTypeNumberPad;
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
