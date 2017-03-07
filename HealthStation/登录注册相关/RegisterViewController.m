//
//  RegisterViewController.m
//  SmartMedicineBox
//
//  Created by chjszx on 16/9/8.
//  Copyright © 2016年 chjszx. All rights reserved.
//

#import "RegisterViewController.h"
//#import "HyperLinksButton.h"

@interface RegisterViewController ()
{
    UIView *lastLine;
    
    int secondsCountDown; //倒计时总时长
    NSTimer *countDownTimer;
    UILabel *labelText;
}
@property (strong,nonatomic)UIButton *verifyBtn;
@property (strong,nonatomic)UIView *coverView;


@property (strong,nonatomic)NSArray *imageArr;
@property (strong,nonatomic)NSArray *placeholderArr;


@property (strong,nonatomic)UITextField *account;
@property (strong,nonatomic)UITextField *verifycode;
@property (strong,nonatomic)UITextField *password;
@property (strong,nonatomic)UIButton *selectBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageArr = @[@"输入手机号",@"验证码",@"输入密码"];
    _placeholderArr = @[@"请输入账号",@"请输入验证码",@"请输入密码"];
    
    [self createUI];
}


- (void)createUI {
    for (int i=0; i<3; i++) {
        UIImageView *accountView = [[UIImageView alloc]initWithFrame:CGRectMake(43, 270, 28, 28)];
        accountView.image = [UIImage imageNamed:_imageArr[i]];
        [self.view addSubview:accountView];
        
        UITextField *accountTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 274, SCREENWIDTH-150, 20)];
        accountTextField.textColor = UIColorFromHex(0x333333);
        [self.view addSubview:accountTextField];
        accountTextField.placeholder = _placeholderArr[i];
        
        switch (i) {
            case 0:
                _account = accountTextField;
                accountTextField.keyboardType = UIKeyboardTypeNumberPad;
                break;
            case 1:
                _verifycode = accountTextField;
                break;
            case 2:
                _password = accountTextField;
                break;
                
            default:
                break;
        }
        
        
        
        UIView *accountLine = [[UIView alloc]initWithFrame:CGRectMake(35, 287+20, SCREENWIDTH-70, 1)];
        accountLine.backgroundColor = UIColorFromHex(0xcccccc);
        [self.view addSubview:accountLine];
        
        if (i == 0) {
            UIButton *captchaBtn = [[UIButton alloc]init];
            self.verifyBtn = captchaBtn;
            [captchaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            captchaBtn.layer.borderColor = UIColorFromHex(0x3bd793).CGColor;
            captchaBtn.layer.borderWidth = 0.5;
            captchaBtn.layer.masksToBounds = YES;
            captchaBtn.layer.cornerRadius = 10;
            [self.view addSubview:captchaBtn];
            captchaBtn.backgroundColor = UIColorFromHex(0xffffff);
            [captchaBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
            [captchaBtn addTarget:self action:@selector(clickGetCaptchaBtn) forControlEvents:UIControlEventTouchUpInside];
            
            [captchaBtn mas_makeConstraints:^(MASConstraintMaker *maker){
                maker.right.equalTo(self.view).offset(-35);
                maker.bottom.equalTo(accountLine.mas_top).offset(-14);
                maker.height.equalTo(@20);
                maker.width.equalTo(@100);
            }];
        }
        
        if (i == 2) {
            lastLine = accountLine;
        }

        //accout
        [accountView mas_makeConstraints:^(MASConstraintMaker *maker){
            maker.top.equalTo(self.view).offset(100+i*58);
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
    }
    
    
    UIButton *selectBtn = [[UIButton alloc]init];
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"单选-没选择"] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    self.selectBtn = selectBtn;
    
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(self.view).offset(40);
        maker.top.equalTo(lastLine.mas_bottom).offset(35);
        maker.width.equalTo(@20);
        maker.height.equalTo(@20);
    }];
    
    //label
    UILabel *agreementLabel = [[UILabel alloc]init];
    agreementLabel.text = @"我已看过并同意";
    agreementLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:agreementLabel];
    
    [agreementLabel mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(selectBtn.mas_right).offset(10);
        maker.top.equalTo(lastLine.mas_bottom).offset(37);
        maker.width.equalTo(@110);
        maker.height.equalTo(@14);
    }];
    
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"《用户注册协议》"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];//设置下划线样式
    [str addAttribute:NSUnderlineColorAttributeName value:UIColorFromHex(0x3bd793) range:strRange];//设置了下划线的颜色
    [str addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x3bd793) range:strRange];
    //[_awardDisplayBtn setAttributedTitle:str forState:UIControlStateNormal];
    
    //agreementBtn
    UIButton *registerAgreementBtn = [[UIButton alloc]init];
    //[registerAgreementBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
    registerAgreementBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //[registerAgreementBtn setTitle:@"《用户注册协议》" forState:UIControlStateNormal];
    [registerAgreementBtn setAttributedTitle:str forState:UIControlStateNormal];
    //[registerAgreementBtn addTarget:self action:@selector(clickCustomerAgreementBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerAgreementBtn];
    
    [registerAgreementBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(agreementLabel.mas_right).offset(-10);
        maker.top.equalTo(lastLine.mas_bottom).offset(37);
        maker.width.equalTo(@120);
        maker.height.equalTo(@14);
    }];
    
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
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(selectBtn.mas_bottom).equalTo(@60);
        maker.left.equalTo(self.view).offset(35);
        maker.right.equalTo(self.view).offset(-35);
        maker.height.equalTo(@40);
    }];
}

- (void)clickSelectBtn:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    if (sender.selected) {
        [sender setBackgroundImage:[UIImage imageNamed:@"单选-点"] forState:UIControlStateNormal];
    }else {
        [sender setBackgroundImage:[UIImage imageNamed:@"单选-没选择"] forState:UIControlStateNormal];
    }
}

- (void)clickRegisterBtn {
    if ([_account.text isEqualToString:@""] || [_password.text isEqualToString:@""] || [_verifycode.text isEqualToString:@""]) {
        [XHToast showCenterWithText:@"请输入完整的信息"];
        return;
    }
    
    if (_selectBtn.selected) {
        //first use check verifycode api
        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        [MedicineBoxNetMethod boxAFPostWay:@"api/verif/check_verif" HeaderToken:nil PostDic:@{@"phone":_account.text,@"verif":_verifycode.text} Completion:^(NSDictionary *dic){
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
                
            if ([dic[@"resultCode"] intValue] == 1) {
                //second use register api
                [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                [MedicineBoxNetMethod boxAFPostWay:@"api/verif/register" HeaderToken:nil PostDic:@{@"phone":_account.text,@"verif":_verifycode.text,@"password":_password.text} Completion:^(NSDictionary *dic){
                    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
                    
                    if ([dic[@"resultCode"] intValue] == 1) {
                        [XHToast showCenterWithText:@"恭喜注册成功" duration:2.f];
                        //save login return data to userReferData
//                        UserReferData *userData = [UserReferData sharedUserReferData];
//                        userData.userId = dic[@"userId"];
//                        userData.token = dic[@"authToken"];
                    }else {
                        [XHToast showCenterWithText:@"注册失败" duration:2.f];
                    }
                }];
            }else {
                [XHToast showCenterWithText:@"验证码错误" duration:2.f];
            }
        }];
        
    }else {
        [XHToast showCenterWithText:@"您还没同意用户注册协议" duration:2.f];
    }
    
    
}

- (void)clickGetCaptchaBtn {
    [_account resignFirstResponder];
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9]))\\d{8}$";//对应号码段
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:_account.text];
    if (!isMatch) {
        [XHToast showCenterWithText:@"请确认输入了正确的手机号"];
    }else{
        //覆盖一层透明的view在button上
        UIView *coverView = [[UIView alloc]initWithFrame:self.verifyBtn.frame];
        self.coverView = coverView;
        coverView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:coverView];
        [self.verifyBtn setTitle:@"60秒" forState:UIControlStateNormal];
        [self.verifyBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.verifyBtn.userInteractionEnabled = NO;
    
        //显示倒计时相关
        //设置倒计时总时长
        secondsCountDown = 60;//60秒倒计时
        //开始倒计时
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
        
        
        
        //get verifycode api
        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        [MedicineBoxNetMethod boxAFPostWay:@"api/verif/gen_verif" HeaderToken:nil PostDic:@{@"phone":_account.text,@"way":@"register"} Completion:^(NSDictionary *dic){
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
            
            if ([dic[@"resultCode"] intValue] == 1) {
                [XHToast showCenterWithText:@"获取验证码成功" duration:1.5f];
            }else {
                [XHToast showCenterWithText:dic[@"resultMsg"] duration:1.5f];
            }
        }];
        
    }
}

//倒计时相关方法
-(void)timeFireMethod{
    //倒计时-1
    secondsCountDown--;
    //self.verifyBtn.userInteractionEnabled = NO;
    //修改倒计时标签现实内容
    //labelText.text=[NSString stringWithFormat:@"%d",secondsCountDown];
    [self.verifyBtn setTitle:[NSString stringWithFormat:@"%d秒",secondsCountDown] forState:UIControlStateNormal];
    [self.verifyBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        //移除覆盖view
        [self.coverView removeFromSuperview];
        
        [countDownTimer invalidate];
        [self.verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.verifyBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.verifyBtn.userInteractionEnabled = YES;
        //[labelText removeFromSuperview];
    }
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
