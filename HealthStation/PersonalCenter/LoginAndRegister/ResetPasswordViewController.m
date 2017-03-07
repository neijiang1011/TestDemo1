//
//  ResetPasswordViewController.m
//  SmartMedicineBox
//
//  Created by chjszx on 16/9/8.
//  Copyright © 2016年 chjszx. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()

@property (strong,nonatomic)UITextField *password;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI {
    UIImageView *accountView = [[UIImageView alloc]initWithFrame:CGRectMake(43, 270, 28, 28)];
    accountView.image = [UIImage imageNamed:@"密码icon"];
    [self.view addSubview:accountView];
    
    UITextField *accountTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 274, SCREENWIDTH-150, 20)];
    accountTextField.textColor = UIColorFromHex(0x333333);
    [self.view addSubview:accountTextField];
    accountTextField.placeholder = @"请输入密码";
    _password = accountTextField;
    
    UIView *accountLine = [[UIView alloc]initWithFrame:CGRectMake(35, 287+20, SCREENWIDTH-70, 1)];
    accountLine.backgroundColor = UIColorFromHex(0xcccccc);
    [self.view addSubview:accountLine];
    
    //registerBtn
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"确认重置" forState:UIControlStateNormal];
    registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    registerBtn.layer.borderWidth = 0.5;
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 20;
    [self.view addSubview:registerBtn];
    registerBtn.backgroundColor = UIColorFromHex(0xdddddd);
    [registerBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //accout
    [accountView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(self.view).offset(100);
        maker.left.equalTo(self.view).offset(43);
        maker.width.equalTo(@28);
        maker.height.equalTo(@28);
    }];
    
    [accountLine mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(accountView.mas_bottom).offset(10);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@1);
    }];
    
    [accountTextField mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(accountView.mas_right).offset(10);
        maker.bottom.equalTo(accountLine.mas_top).offset(-16);
        maker.height.equalTo(@16);
        maker.width.equalTo(@(SCREENWIDTH-150));
    }];
    
    //regBtn
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(accountLine.mas_bottom).equalTo(@60);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@40);
    }];
    

}

- (void)clickRegisterBtn {
    if ([_password.text isEqualToString:@""]) {
        [XHToast showCenterWithText:@"请输入密码"];
        return;
    }
    
    
    //reset password api
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [MedicineBoxNetMethod boxAFPostWay:@"api/ucenter/reset_pwd" HeaderToken:nil PostDic:@{@"phone":[_dic objectForKey:@"phone"],@"verif":[_dic objectForKey:@"verif"],@"password":_password.text} Completion:^(NSDictionary *dic){
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        
        if ([dic[@"resultCode"] intValue] == 1) {
            [XHToast showCenterWithText:@"重置密码成功" duration:2.f];
        }else {
            [XHToast showCenterWithText:@"账号或密码不正确" duration:1.5f];
        }
    }];
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
