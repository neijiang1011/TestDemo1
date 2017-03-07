//
//  PersonalCenterViewController.m
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "BarcodeViewController.h"
#import "PersonalInfoViewController.h"
#import "HealthRecordViewController.h"
#import "SettingViewController.h"
#import "SuggestionFeedbackViewController.h"
#import "MyCollectionViewController.h"


@interface PersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource, UIPickerViewDelegate>
{
    NSArray *_titleArr;
    BarcodeViewController *_barVC;
    PersonalInfoViewController *_infoVC;
    UIImageView *_avatar;
}

@property (strong,nonatomic)UITableView *tableView;

@property (strong,nonatomic)UIView *selectAvatarView;

@end

@implementation PersonalCenterViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"个人中心";
    //self.view.backgroundColor = UIColorFromHex(0x3bd793);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.tabBarItem.image = [[UIImage imageNamed:@"个人中心-未选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"个人中心-选中"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self createTableView];
    [self createAlterAvatarView];
}


- (void)createTableView {
    NSArray *titleArr = @[@"我的二维码",@"个人信息",@"健康档案",@"我的收藏",@"设置与帮助",@"意见反馈"];
    _titleArr = titleArr;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49)];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //tableview的分隔线
    tableView.separatorColor = UIColorFromHex(0xD8D9DA);
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 10);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    //create tableHeaderView;
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 213)];
    tableView.tableHeaderView = tableHeaderView;
    tableHeaderView.backgroundColor = UIColorFromHex(0x3bd793);
    
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 100, 100)];
    avatar.layer.masksToBounds = YES;
    avatar.layer.cornerRadius = 50.f;
    [tableHeaderView addSubview:avatar];
    avatar.centerX = tableHeaderView.centerX;
    avatar.image = [UIImage imageNamed:@"个人中心-未选中"];
    _avatar = avatar;
    
    UIButton *avatarBtn = [[UIButton alloc]initWithFrame:avatar.frame];
    [tableHeaderView addSubview:avatarBtn];
    avatarBtn.backgroundColor = [UIColor clearColor];
    [avatarBtn addTarget:self action:@selector(clickAvatar) forControlEvents:UIControlEventTouchUpInside];
    
    

    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 213-15-14, 120, 14)];
    nameLabel.textAlignment = NSTextAlignmentRight;
    [tableHeaderView addSubview:nameLabel];
    nameLabel.text = @"moon";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.centerX = tableHeaderView.centerX-60;
    
    UILabel *titleLabel = ({
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, 120, 22)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = @"个人中心";
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:22];
        nameLabel.centerX = tableHeaderView.centerX;
        nameLabel;
    });
    [tableHeaderView addSubview:titleLabel];
    
    //level button看UI是不是一张图片表示出来的。
    UILabel *levelLabel = ({
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 213-15-14, 120, 14)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        //[tableHeaderView addSubview:nameLabel];
        nameLabel.text = @"LV2";
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        nameLabel.layer.borderWidth = 1.f;
        nameLabel.layer.masksToBounds = YES;
        nameLabel.layer.cornerRadius = 4.f;
        nameLabel.backgroundColor = [UIColor lightGrayColor];
        nameLabel;
    });
    [tableHeaderView addSubview:levelLabel];
    
    levelLabel.sd_layout.leftSpaceToView(nameLabel,10).topSpaceToView(nameLabel,-12).widthIs(30).heightIs(12);
}

- (void)clickAvatar {
    _selectAvatarView.hidden = NO;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:_titleArr[indexPath.row]];
    cell.textLabel.text = _titleArr[indexPath.row];
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            _barVC = [[BarcodeViewController alloc]init];
            _barVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:_barVC animated:YES];
        }
            break;
        case 1:
        {
            _infoVC = [[PersonalInfoViewController alloc]init];
            _infoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:_infoVC animated:YES];
        }
            break;
            
        case 2:
        {
            HealthRecordViewController *healthVC = [[HealthRecordViewController alloc]init];
            healthVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:healthVC animated:YES];
        }
            break;
            
            
        case 3:
        {
            MyCollectionViewController *collectionVC = [[MyCollectionViewController alloc]init];
            collectionVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:collectionVC animated:YES];
        }
            break;
            
        case 4:
        {
            SettingViewController *settingVC = [[SettingViewController alloc]init];
            settingVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:settingVC animated:YES];
        }
            break;
            
        case 5:
        {
            SuggestionFeedbackViewController *feedbackVC = [[SuggestionFeedbackViewController alloc]init];
            feedbackVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:feedbackVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}



#pragma mark - alter nickname refer
- (void)createAlterAvatarView {
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    view.hidden = YES;
    _selectAvatarView = view;
    [view setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [self.navigationController.view addSubview:view];
    
    UIButton *camera = [[UIButton alloc]init];
    [camera setBackgroundImage:[UIImage imageNamed:@"相机"] forState:UIControlStateNormal];
    [view addSubview:camera];
    [camera addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *photoAlbum = [[UIButton alloc]init];
    [photoAlbum setBackgroundImage:[UIImage imageNamed:@"相册"] forState:UIControlStateNormal];
    [view addSubview:photoAlbum];
    [photoAlbum addTarget:self action:@selector(LocalPhoto) forControlEvents:UIControlEventTouchUpInside];
    
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
    [registerBtn addTarget:self action:@selector(cancelAvatarBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [camera mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(view).offset(225);
        maker.width.equalTo(@58);
        maker.height.equalTo(@58);
        maker.right.equalTo(view.mas_centerX).offset(-36);
    }];
    
    [photoAlbum mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(view).offset(225);
        maker.width.equalTo(@58);
        maker.height.equalTo(@58);
        maker.left.equalTo(view.mas_centerX).offset(36);
    }];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.centerX.equalTo(view.mas_centerX);
        maker.top.equalTo(view).offset(360);
        maker.width.equalTo(@135);
        maker.height.equalTo(@48);
    }];
}

- (void)cancelAvatarBtn {
    _selectAvatarView.hidden = YES;
}


#pragma mark - 选择头像
//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;//先设定sourceType为相机，然后判断相机是否可用
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:nil];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}


//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    //[self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:nil];
    //[picker release];
}


//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //更改avatar
    _avatar.image = image;
    [self.tableView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    _selectAvatarView.hidden = YES;
    
    //UIImage *image = [UIImage imageNamed:@"icon重复"];
    //get UserId and token
    //    UserReferData *data = [UserReferData sharedUserReferData];
    //    NSString *userId = data.userId;
    //    NSString *token = data.token;
    //    if (!token) {
    //        return;
    //    }
    //
    //
    //    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    //    [MedicineBoxNetMethod uploadAvatar:@"api/profile/upload_avatar" UserId:userId HeaderToken:token UploadImage:image Completion:^(NSDictionary *dic){
    //        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    //
    //        if ([dic[@"resultCode"] intValue] == 1) {
    //            [XHToast showCenterWithText:@"上传图片成功啦"];
    //        }else if ([dic[@"resultCode"] intValue] == -1) {
    //            [XHToast showCenterWithText:@"上传图片失败"];
    //        }
    //    }];
    
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
