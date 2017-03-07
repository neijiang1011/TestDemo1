//
//  FreeInquiryViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/20.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "FreeInquiryViewController.h"
#import "Masonry.h"
#import "POPViewController.h"
//#import "aaaViewController.h"
#import "ElectrocardiogramTableViewController.h"
#import "HeartLungVoiceTableViewController.h"
//#import "bbbViewController.h"

#define YOffset 64.f

@interface FreeInquiryViewController ()<UIPickerViewDelegate>
@property (nonatomic, strong) UITextView *textInput;
@property (nonatomic, strong) UIView *cornerHolder;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UIImageView *image3;


@property (strong,nonatomic)UIView *selectAvatarView;
//@property (strong,nonatomic)UIImageView *selectedPicImageView;

@end

@implementation FreeInquiryViewController
-(UIView *)cornerHolder{
    if (_cornerHolder == nil) {
        
        _cornerHolder = [[UIView alloc]initWithFrame:CGRectMake(14, 14+YOffset, self.view.bounds.size.width - 2*14, 268)];
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
    //self.view.frame = CGRectMake(0, YOffset+20, SCREENWIDTH, SCREENHEIGHT);
    //    self.textInput.backgroundColor = [UIColor yellowColor];
    [self.cornerHolder addSubview:self.textInput];
    
    __weak __typeof(&*self)weakSelf = self;
    [self.textInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(weakSelf.cornerHolder.bounds.size.width - 2*14, weakSelf.cornerHolder.bounds.size.height - 2*14));
        make.left.equalTo(weakSelf.cornerHolder).with.offset(14);
        make.top.equalTo(weakSelf.cornerHolder).with.offset(14);
    }];
    
    [self.view addSubview:self.cornerHolder];
    
    CGFloat even = self.view.bounds.size.width/3.0;
    CGFloat centerX = even/2.0;
    self.image1 = [[UIImageView alloc]initWithFrame:CGRectMake( 0 ,
                                                               self.cornerHolder.bounds.origin.y + self.cornerHolder.bounds.size.height + 20+YOffset ,
                                                               50, 50)];
    self.image1.center = CGPointMake(centerX, self.image1.center.y);
    self.image1.image = [UIImage imageNamed:@"更多-心电图"];
    //    self.image1.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image1];
    
    
    
    //    NSLog(@"%@",self.image1.bounds);
    self.image2 = [[UIImageView alloc]initWithFrame:CGRectMake( 120+35 ,
                                                               weakSelf.cornerHolder.bounds.origin.y + weakSelf.cornerHolder.bounds.size.height + 20 + YOffset,
                                                               50, 50)];
    self.image2.center = CGPointMake(even + centerX, self.image2.center.y);
    self.image2.image = [UIImage imageNamed:@"更多-心肺音频"];
    //    self.image2.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image2];
    
    self.image3 = [[UIImageView alloc]initWithFrame:CGRectMake( 240+35 ,
                                                               weakSelf.cornerHolder.bounds.origin.y + weakSelf.cornerHolder.bounds.size.height + 20 + YOffset,
                                                               50, 50)];
    self.image3.center = CGPointMake(even*2+centerX, self.image3.center.y);
    self.image3.image = [UIImage imageNamed:@"图片"];
    //    self.image3.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image3];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(35, self.image1.frame.origin.y + self.image1.frame.size.height + 6, 100, 20)];//bounds
    label1.center = CGPointMake(self.image1.center.x, label1.center.y) ;
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = UIColorFromHex(0x666666);
    label1.text = @"心电图";
    
    NSLog(@"self.image1.frame.origin.y = %f",self.image1.frame.origin.y);
    NSLog(@"label1.frame.origin.y = %f",label1.frame.origin.y);
    [self.view addSubview: label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(120, weakSelf.image2.frame.origin.y+ weakSelf.image2.frame.size.height+6, 100, 20)];
    label2.center = CGPointMake(self.image2.center.x, label1.center.y) ;
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = UIColorFromHex(0x666666);
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"心肺音频";
    [self.view addSubview: label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(120, weakSelf.image3.frame.origin.y+ weakSelf.image3.frame.size.height+6, 100, 20)];
    label3.center = CGPointMake(self.image3.center.x, label1.center.y) ;
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = UIColorFromHex(0x666666);
    label3.textAlignment = NSTextAlignmentCenter;
    label3.text = @"图片";
    [self.view addSubview: label3];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(38, self.cornerHolder.frame.origin.y+self.cornerHolder.frame.size.height+134, self.view.frame.size.width - 38*2, 42)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 21;
    [btn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = UIColorFromHex(0x3cd793);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    NSMutableArray *imageViewArr = [[NSMutableArray alloc]init];
    [imageViewArr addObject:_image1];
    [imageViewArr addObject:_image2];
    [imageViewArr addObject:_image3];
    
    for (int i=0; i<imageViewArr.count; i++) {
        UIImageView *view = imageViewArr[i];
        UIButton *button = [[UIButton alloc]initWithFrame:view.frame];
        [self.view addSubview:button];
        switch (i) {
            case 0:
                [button addTarget:self action:@selector(electrocardiogramBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                [button addTarget:self action:@selector(heartLungBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                [button addTarget:self action:@selector(imageBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
                
            default:
                break;
        }
    }
    
    [self createAlterAvatarView];
}


- (void)electrocardiogramBtn {
    ElectrocardiogramTableViewController *elecVC = [[ElectrocardiogramTableViewController alloc]init];
    [self.navigationController pushViewController:elecVC animated:YES];
}

- (void)heartLungBtn {
    HeartLungVoiceTableViewController *voiceVC = [[HeartLungVoiceTableViewController alloc]init];
    [self.navigationController pushViewController:voiceVC animated:YES];
}

- (void)imageBtn {
    _selectAvatarView.hidden = NO;
}

#pragma mark - 点击图片button，调用相册或相机照片.
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



#pragma mark - alter avatar refer
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


//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //更改avatar
    _image3.image = image;
    //[self.tableView reloadData];
    
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





-(void)testAction:(UIButton *)sender{
    POPViewController *pop = [POPViewController new];
    [pop presentedViewController];
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
