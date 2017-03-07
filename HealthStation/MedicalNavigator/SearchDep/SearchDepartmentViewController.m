//
//  SearchDepartmentViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/20.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "SearchDepartmentViewController.h"
#import "Masonry.h"
#import "DepartmentViewController.h"

#define YOffset 64.f + 39.f

@interface SearchDepartmentViewController ()
@property (nonatomic, strong) UITextView *textInput;
@property (nonatomic, strong) UIView *cornerHolder;
@end

@implementation SearchDepartmentViewController

-(UIView *)cornerHolder{
    if (_cornerHolder == nil) {
        
        _cornerHolder = [[UIView alloc]initWithFrame:CGRectMake(14, 9+YOffset, self.view.bounds.size.width - 2*14, 268)];
        _cornerHolder.layer.masksToBounds = YES;
        _cornerHolder.layer.cornerRadius = 8.0f;
        _cornerHolder.layer.borderColor = UIColorFromHex(0xcccccc).CGColor;
        _cornerHolder.layer.borderWidth = 2.f;
        
    }
    return _cornerHolder;
}

-(UITextView *)textInput{
    if (_textInput == nil) {
        _textInput = [[UITextView alloc]init];
        _textInput.text = @"tessssttestttt啊啊啊啊啊 啊啊啊啊啊 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        _textInput.textColor = UIColorFromHex(0x333333);
        _textInput.font = [UIFont systemFontOfSize:14];
    }
    return _textInput;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;//解决textView不靠顶部显示问题。
    
    self.title = @"免费问诊";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.cornerHolder addSubview:self.textInput];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 14+64, 200, 16)];//bounds
    label1.centerX = self.view.centerX;
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = UIColorFromHex(0x666666);
    label1.text = @"输入病情查科室";
    [self.view addSubview:label1];
    
    __weak __typeof(&*self)weakSelf = self;
    [self.textInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(weakSelf.cornerHolder.bounds.size.width - 2*14, weakSelf.cornerHolder.bounds.size.height - 2*14));
        make.left.equalTo(weakSelf.cornerHolder).with.offset(14);
        make.top.equalTo(weakSelf.cornerHolder).with.offset(14);
    }];
    
    [self.view addSubview:self.cornerHolder];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(38, self.cornerHolder.frame.origin.y+self.cornerHolder.frame.size.height+50, self.view.frame.size.width - 38*2, 42)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 21;
    [btn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = UIColorFromHex(0x3cd793);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)testAction:(id)sender {
    DepartmentViewController *depVC = [[DepartmentViewController alloc]init];
    [self.navigationController pushViewController:depVC animated:YES];
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
