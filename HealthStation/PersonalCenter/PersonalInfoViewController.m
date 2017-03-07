//
//  PersonalInfoViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/20.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "Masonry.h"

@interface PersonalInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSArray *_titleArr;
    NSArray *_imageArr;
}
@property (strong,nonatomic)UITableView *tableView;


@property (strong,nonatomic)NSArray *provinceArr;
@property (strong,nonatomic)NSArray *cityArr;
@property (strong,nonatomic)UIView *selectCityView;
@property (strong,nonatomic)UIPickerView *provincePickerView;
@property (strong,nonatomic)UIPickerView *cityPickerView;
@property (strong,nonatomic)NSString *city;


@property (strong,nonatomic)UIView *nicknameView;
@property (strong,nonatomic)NSString *nickname;


@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableView];
    [self createAlterCityView];
    [self createAlterNicknameView];
}

- (void)createStoreInfoDefault {
    //NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //[userDefault setObject:@"1" forKey:@"number"];
}

- (void)alterInfo:(NSString *)detailInfo {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"2" forKey:@"number"];
    
    NSLog(@"number:%@",[userDefault objectForKey:@"number"]);
}


- (void)createTableView {
    //NSArray *titleArr = @[@"昵称",@"城市"];
    NSArray *imageArr = @[@"昵称",@"城市"];
    
    NSMutableArray *infoArr = [[NSMutableArray alloc]init];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    if ([def objectForKey:@"nickName"]) {
        [infoArr addObject:[def objectForKey:@"nickName"]];
    }else {
        [infoArr addObject:@"-"];
    }
    
    if ([def objectForKey:@"selectedCity"]) {
        [infoArr addObject:[def objectForKey:@"selectedCity"]];
    }else {
        [infoArr addObject:@"-"];
    }

    
    
    _imageArr = imageArr;
    _titleArr = infoArr;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //tableview的分隔线
    tableView.separatorColor = UIColorFromHex(0xD8D9DA);
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 10);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - tableview delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell;
    
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    cell.textLabel.text = _titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            if (_nicknameView) {
                _nicknameView.hidden = NO;
            }
        }
            break;
        case 1:
        {
            if (_selectCityView) {
                _selectCityView.hidden = NO;
            }
        }
            break;
            
        default:
            break;
    }
    
}


#pragma mark - alter city refer
- (void)createAlterCityView {
    
    //处理城市数据
    //    获取mainBundle
    //    获取songInfo.plist文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    //    把plist文件里内容存入数组
    //NSDictionary *dic = [NSDictionary dictionaryWithContentsOfURL:songInfo];
    //    将字典里面的内容取出放到数组中
    NSArray *components = [NSArray arrayWithContentsOfFile:path];
    _provinceArr = components;
    NSDictionary *provinceDic = _provinceArr[0];
    NSArray *selectedCities = provinceDic[@"Cities"];
    _cityArr = selectedCities;
    
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    view.hidden = YES;
    _selectCityView = view;
    [view setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [self.navigationController.view addSubview:view];
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.tag = 201;
    _provincePickerView = pickerView;
    //指定数据源和委托
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [view addSubview:pickerView];
    
    UIPickerView *pickerView1 = [[UIPickerView alloc]init];
    pickerView1.tag = 202;
    _cityPickerView = pickerView1;
    //指定数据源和委托
    pickerView1.delegate = self;
    pickerView1.dataSource = self;
    [view addSubview:pickerView1];
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"修改城市";
    titleLabel.textColor = UIColorFromHex(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:23];
    [view addSubview:titleLabel];
    
    //confirmBtn
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"确认" forState:UIControlStateNormal];
    loginBtn.layer.borderColor = UIColorFromHex(0x3bd793).CGColor;
    loginBtn.layer.borderWidth = 1;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 20;
    [view addSubview:loginBtn];
    loginBtn.backgroundColor = UIColorFromHex(0x3bd793);
    [loginBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickConfirmCityBtn) forControlEvents:UIControlEventTouchUpInside];
    
    //cancelBtn
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"取消" forState:UIControlStateNormal];
    registerBtn.layer.borderColor = UIColorFromHex(0x3bd793).CGColor;
    registerBtn.layer.borderWidth = 1;
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 20;
    [view addSubview:registerBtn];
    registerBtn.backgroundColor = UIColorFromHex(0xffffff);
    [registerBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickCancelCityBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.equalTo(view.mas_centerX);
        maker.top.equalTo(view).offset(143);
        maker.width.equalTo(@150);
        maker.height.equalTo(@23);
    }];
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(view).offset(38);
        maker.top.equalTo(view).offset(210);
        maker.right.equalTo(pickerView1.mas_left).offset(-20);
        maker.height.equalTo(@210);
        maker.width.equalTo(pickerView1);
    }];
    
    [pickerView1 mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(view).offset(210);
        maker.right.equalTo(view).offset(-38);
        maker.height.equalTo(@210);
    }];
    
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(view).offset(38);
        maker.top.equalTo(pickerView.mas_bottom).offset(10);
        maker.right.equalTo(loginBtn.mas_left).offset(-13);
        maker.height.equalTo(@48);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(pickerView.mas_bottom).offset(10);
        maker.right.equalTo(view).offset(-38);
        maker.height.equalTo(@48);
        maker.width.equalTo(registerBtn);
    }];
    
}

- (void)clickConfirmCityBtn {
    _selectCityView.hidden = YES;
    //修改tableview数据
    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:_titleArr];
    
    NSInteger provicerow =[_provincePickerView selectedRowInComponent:0];
    NSInteger cityrow =[_cityPickerView selectedRowInComponent:0];
    
    if (provicerow == 0) {
        _city = @"北京";
    }else if (provicerow == 1) {
        _city = @"天津";
    }else if (provicerow == 2) {
        _city = @"上海";
    }else if (provicerow == 3) {
        _city = @"重庆";
    }else {
        NSDictionary *dic = _cityArr[cityrow];
        _city = dic[@"city"];
    }
    arr[1] = _city;
    _titleArr = arr;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_city forKey:@"selectedCity"];
    
    [self.tableView reloadData];
    
}

- (void)clickCancelCityBtn {
    _selectCityView.hidden = YES;
}

#pragma mark - pickerview datasource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 201:
            return _provinceArr.count;
            break;
        case 202:
            return _cityArr.count;
            break;
            
        default:
            break;
    }
    
    return 0;
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 201:
        {
            NSDictionary *provinceDic = _provinceArr[row];
            return provinceDic[@"State"];
            
            break;
        }
        case 202:
        {
            NSDictionary *citiesDic = _cityArr[row];
            return citiesDic[@"city"];
            
            break;
        }
            
        default:
            break;
    }
    
    return nil;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 70;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == _provincePickerView) {
        NSDictionary *provinceDic = _provinceArr[row];
        NSArray *selectedCities = provinceDic[@"Cities"];
        _cityArr = selectedCities;
        
        [_cityPickerView selectRow:0 inComponent:0 animated:YES];
        [_cityPickerView reloadAllComponents];
    }
}


#pragma mark - alter nickname refer
- (void)createAlterNicknameView {
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    view.hidden = YES;
    _nicknameView = view;
    [view setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [self.navigationController.view addSubview:view];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"修改昵称";
    titleLabel.textColor = UIColorFromHex(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:23];
    [view addSubview:titleLabel];
    
    UITextField *textField = [[UITextField alloc]init];
    textField.text = _titleArr[0];
    textField.tag = 100;
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    textField.delegate = self;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.textColor = UIColorFromHex(0x333333);
    textField.font = [UIFont systemFontOfSize:17];
    [view addSubview:textField];
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:line];
    
    //confirmBtn
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"确认" forState:UIControlStateNormal];
    loginBtn.layer.borderColor = UIColorFromHex(0x3bd793).CGColor;
    loginBtn.layer.borderWidth = 1;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 20;
    [view addSubview:loginBtn];
    loginBtn.backgroundColor = UIColorFromHex(0x3bd793);
    [loginBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickConfirmNicknameBtn) forControlEvents:UIControlEventTouchUpInside];
    
    //cancelBtn
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"取消" forState:UIControlStateNormal];
    registerBtn.layer.borderColor = UIColorFromHex(0x3bd793).CGColor;
    registerBtn.layer.borderWidth = 1;
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 20;
    [view addSubview:registerBtn];
    registerBtn.backgroundColor = UIColorFromHex(0xffffff);
    [registerBtn setTitleColor:UIColorFromHex(0x3bd793) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickCancelNicknameBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.equalTo(view.mas_centerX);
        maker.top.equalTo(view).offset(180);
        maker.width.equalTo(@150);
        maker.height.equalTo(@23);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.equalTo(view.mas_centerX);
        maker.top.equalTo(view).offset(250);
        maker.width.equalTo(@250);
        maker.height.equalTo(@24);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(view).offset(38);
        maker.top.equalTo(view).offset(280);
        maker.right.equalTo(view).offset(-38);
        maker.height.equalTo(@1);
    }];
    
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.left.equalTo(view).offset(38);
        maker.top.equalTo(line).offset(70);
        maker.right.equalTo(loginBtn.mas_left).offset(-13);
        maker.height.equalTo(@48);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(line).offset(70);
        maker.right.equalTo(view).offset(-38);
        maker.height.equalTo(@48);
        maker.width.equalTo(registerBtn);
    }];
}

- (void)textFieldDidChange:(UITextField *)sender {
    _nickname = sender.text;
}

- (void)clickConfirmNicknameBtn {
    _nicknameView.hidden = YES;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:_titleArr];
    arr[0] = _nickname;
    _titleArr = arr;
    
    UITextField *field = (UITextField *)[_nicknameView viewWithTag:100];
    if ([_titleArr[0] isEqualToString:@"-"]) {
        field.text = nil;
    }else {
        field.text = _titleArr[0];
    }
    [field resignFirstResponder];
    
    //change nickname
//    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    UserReferData *data = [UserReferData sharedUserReferData];
//    [MedicineBoxNetMethod boxAFPostWay:@"api/profile/update_profile" HeaderToken:data.token PostDic:@{@"uid":data.userId,@"nick_name":_nickname} Completion:^(NSDictionary *dic){
//        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
//        
//        switch ([dic[@"resultCode"] intValue]) {
//            case 1:
//                [XHToast showCenterWithText:@"修改昵称成功" duration:1.5f];
//                break;
//            case -1:
//                [XHToast showCenterWithText:@"修改昵称失败" duration:1.5f];
//                break;
//                
//            default:
//                break;
//        }
//    }];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_nickname forKey:@"nickName"];
    
    [self.tableView reloadData];
}

- (void)clickCancelNicknameBtn {
    _nicknameView.hidden = YES;
    _nickname = nil;
    UITextField *field = (UITextField *)[_nicknameView viewWithTag:100];
    if ([_titleArr[0] isEqualToString:@"-"]) {
        field.text = nil;
    }else {
        field.text = _titleArr[0];
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
