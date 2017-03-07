//
//  LoginViewController.m
//  SmartMedicineBox
//
//  Created by chjszx on 16/9/1.
//  Copyright © 2016年 chjszx. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "RetrievePasswordViewController.h"

@interface LoginViewController ()

@property (strong,nonatomic)UIImageView *backgroundView;
@property (strong,nonatomic)UILabel *titleLabel;
@property (strong,nonatomic)UITextField *account;
@property (strong,nonatomic)UITextField *password;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self customTitle];
    [self createLeftAndRightItem];
    [self createUI];
}

//定义左右item
- (void)createLeftAndRightItem {
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"找回密码" style:UIBarButtonItemStylePlain target:self action:@selector(retrievePas)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)retrievePas {
    RetrievePasswordViewController *vc = [[RetrievePasswordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)customTitle {
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];    
//    title.text = @"登录";
//    title.textAlignment = NSTextAlignmentCenter;
//    title.textColor = [UIColor whiteColor];
//    
//    self.navigationController.navigationItem.titleView = title;
    self.title = @"登录";
}


- (void)createUI {
    UIImageView *view = [[UIImageView alloc]init];
    view.image = [UIImage imageNamed:@"登录图形"];
    [self.view addSubview:view];
    _backgroundView = view;
    
    
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 16)];
//        _titleLabel.center = CGPointMake(SCREENWIDTH/2, 23+12);
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.font = [UIFont systemFontOfSize:16];
//        _titleLabel.textColor = UIColorFromHex(0x666666);
//        _titleLabel.text = @"登录";
//        
//        [self.view addSubview:_titleLabel];
//    }
    
    //account
    UIImageView *accountView = [[UIImageView alloc]initWithFrame:CGRectMake(43, 270, 28, 28)];
    accountView.image = [UIImage imageNamed:@"电话号码icon"];
    [self.view addSubview:accountView];
    
    UITextField *accountTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 274, SCREENWIDTH-150, 20)];
    accountTextField.textColor = UIColorFromHex(0x333333);
    [self.view addSubview:accountTextField];
    accountTextField.placeholder = @"请输入账号";
    self.account = accountTextField;
    accountTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    UIView *accountLine = [[UIView alloc]initWithFrame:CGRectMake(35, 287+20, SCREENWIDTH-70, 1)];
    accountLine.backgroundColor = UIColorFromHex(0xcccccc);
    [self.view addSubview:accountLine];
    
    //password
    UIImageView *passwordView = [[UIImageView alloc]initWithFrame:CGRectMake(43, 270, 28, 28)];
    passwordView.image = [UIImage imageNamed:@"密码icon"];
    [self.view addSubview:passwordView];
    
    UITextField *passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 274, SCREENWIDTH-150, 20)];
    passwordTextField.textColor = UIColorFromHex(0x333333);
    [self.view addSubview:passwordTextField];
    passwordTextField.placeholder = @"请输入密码";
    self.password = passwordTextField;
    
    UIView *passwordLine = [[UIView alloc]initWithFrame:CGRectMake(35, 287+20, SCREENWIDTH-70, 1)];
    passwordLine.backgroundColor = UIColorFromHex(0xcccccc);
    [self.view addSubview:passwordLine];
    
    //loginBtn
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loginBtn.layer.borderWidth = 0.5;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 20;
    [self.view addSubview:loginBtn];
    loginBtn.backgroundColor = UIColorFromHex(0xdddddd);
    [loginBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    //registerBtn
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    registerBtn.layer.borderWidth = 0.5;
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 20;
    [self.view addSubview:registerBtn];
    registerBtn.backgroundColor = UIColorFromHex(0xdddddd);
    [registerBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGFloat initWidth = SCREENWIDTH-40;
    //布局
    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(self.view).equalTo(@70);
        maker.left.equalTo(self.view).offset(20);
        maker.right.equalTo(self.view).offset(-20);
        maker.height.equalTo(@(283.f/346.f*initWidth));
    }];
    
    
    //accout
    [accountView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(_backgroundView.mas_bottom).offset(-70);
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
    
    //password
    [passwordView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(accountLine.mas_bottom).offset(20);
        maker.left.equalTo(self.view).offset(43);
        maker.width.equalTo(@28);
        maker.height.equalTo(@28);
    }];
    
    [passwordLine mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(passwordView.mas_bottom).offset(10);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@1);
    }];
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(passwordView.mas_right).offset(10);
        maker.bottom.equalTo(passwordLine.mas_top).offset(-16);
        maker.height.equalTo(@16);
        maker.width.equalTo(@(SCREENWIDTH-150));
    }];
    
    //loginBtn
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(passwordLine.mas_bottom).equalTo(@30);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@40);
    }];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(loginBtn.mas_bottom).equalTo(@30);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@40);
    }];
    
}


- (void)clickLoginBtn {
    //[XHToast showCenterWithText:@"登录失败，请检查密码或账号是否正确" duration:2.f];
    
    if ([_account.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        [XHToast showCenterWithText:@"请输入完整的信息" duration:1.5f];
    }else {
        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        //default test account login
        [MedicineBoxNetMethod boxAFPostWay:@"api/ucenter/login" HeaderToken:nil PostDic:@{@"phone":@"15196263806",@"password":_password.text} Completion:^(NSDictionary *dic){
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
            
            if ([dic[@"resultCode"] intValue] == 1) {
                //save login return data to userReferData
                UserReferData *userData = [UserReferData sharedUserReferData];
                userData.userId = dic[@"userId"];
                userData.token = dic[@"authToken"];
                
                //save to userdefaults
                NSUserDefaults *std = [NSUserDefaults standardUserDefaults];
                [std setObject:dic[@"userId"] forKey:@"userId"];
                [std setObject:dic[@"authToken"] forKey:@"authToken"];
                
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                [XHToast showCenterWithText:@"账号或密码不正确" duration:1.5f];
            }
        }];
    }
}

- (void)clickRegisterBtn {
    RegisterViewController *regVC = [[RegisterViewController alloc]init];
    //RetrievePasswordViewController *retriveVC = [[RetrievePasswordViewController alloc]init];
    [self.navigationController pushViewController:regVC animated:YES];
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
