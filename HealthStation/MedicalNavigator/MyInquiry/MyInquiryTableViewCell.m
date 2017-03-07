//
//  MyInquiryTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 17/2/24.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "MyInquiryTableViewCell.h"

@implementation MyInquiryTableViewCell

{
    UIImageView *_docIcon;
    UILabel *_docName;
    UILabel *_docTitle;
    UILabel *_docHos;
    UILabel *_docDep;
    
    UILabel *_patientName;
    UILabel *_timeLabel;
    UIButton *_completeBtn;
    UIButton *_checkBtn;
    
    UIImageView *_line;
    UIImageView *_backgroundView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createCellSubViews];
    }
    
    return self;
}


- (void)createCellSubViews {
    
    UIImageView *backgroundView = [[UIImageView alloc]init];
    [self.contentView addSubview:backgroundView];
    backgroundView.image = [UIImage imageNamed:@"我的问诊-卡片bg"];
    _backgroundView = backgroundView;
    
    
    //创建控件
    UIImageView *icon = [[UIImageView alloc]init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 26.5f;
    [self.contentView addSubview:icon];
    _docIcon = icon;
    
    UILabel *hosName = [[UILabel alloc]init];
    hosName.textColor = UIColorFromHex(0x4f4c5f);
    hosName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:hosName];
    _docName = hosName;
    
    UILabel *hosDistance = [[UILabel alloc]init];
    hosDistance.textColor = UIColorFromHex(0x888693);
    hosDistance.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:hosDistance];
    _docHos = hosDistance;
    
    
    UILabel *docTitle = [[UILabel alloc]init];
    docTitle.textColor = UIColorFromHex(0x4f4c5f);
    docTitle.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:docTitle];
    [docTitle setSingleLineAutoResizeWithMaxWidth:200];
    _docTitle = docTitle;
    
    UILabel *docDep = [[UILabel alloc]init];
    docDep.textColor = UIColorFromHex(0x888693);
    docDep.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:docDep];
    _docDep = docDep;
    
    
//    UILabel *priceLabel = [[UILabel alloc]init];
//    priceLabel.textColor = UIColorFromHex(0x888693);
//    priceLabel.font = [UIFont systemFontOfSize:12];
//    [self.contentView addSubview:priceLabel];
    
    UIImageView *line = [[UIImageView alloc]init];
    [self.contentView addSubview:line];
    line.image = [UIImage imageNamed:@"下划线"];
    _line = line;
    
    UILabel *patientName = [[UILabel alloc]init];
    patientName.textColor = UIColorFromHex(0x333333);
    patientName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:patientName];
    _patientName = patientName;
    
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textColor = UIColorFromHex(0x666666);
    timeLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel = timeLabel;//如果布局没显示可能是根本没有布局到，不如这里的变量没有赋值，那么就会导致后面的布局操作没有用处。
    
    
    
    UIButton *completeBtn = [[UIButton alloc]init];
    [completeBtn setTitle:@"完成问诊" forState:UIControlStateNormal];
    [completeBtn setBackgroundColor:[UIColor whiteColor]];
    [completeBtn setTitleColor:UIColorFromHex(0x00d796) forState:UIControlStateNormal];
    completeBtn.layer.borderColor = UIColorFromHex(0x00d796).CGColor;
    completeBtn.layer.borderWidth = 1;
    completeBtn.layer.masksToBounds = YES;
    completeBtn.layer.cornerRadius = 21.f;
    [self.contentView addSubview:completeBtn];
    _completeBtn = completeBtn;
    
    UIButton *checkBtn = [[UIButton alloc]init];
    [checkBtn setTitle:@"查看问诊" forState:UIControlStateNormal];
    [checkBtn setBackgroundColor:UIColorFromHex(0x00d796)];
    //checkBtn.backgroundColor = [UIColor blueColor];
    //checkBtn setback
    [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    checkBtn.layer.borderColor = UIColorFromHex(0x00d796).CGColor;
    checkBtn.layer.borderWidth = 1;
    checkBtn.layer.masksToBounds = YES;
    checkBtn.layer.cornerRadius = 21.f;
    [self.contentView addSubview:checkBtn];
    _checkBtn = checkBtn;
    
    
    //控件布局
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contentView).offset(16);
        make.top.equalTo(self.contentView);
        make.width.equalTo(@(SCREENWIDTH-32));
        make.height.equalTo(@189);
    }];
    
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contentView).offset(16);
        make.top.equalTo(self.contentView).offset(12);
        make.width.equalTo(@45);
        make.height.equalTo(@45);
    }];
    
    [_docName mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(icon.mas_right).offset(12);
        make.top.equalTo(self.contentView).offset(17);
        make.height.equalTo(@16);
        make.right.equalTo(_docTitle.mas_left).offset(-16);
    }];
    
    [_docTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_docDep.mas_left).offset(-12);
        make.top.equalTo(self.contentView).offset(19);
        make.height.equalTo(@14);
    }];
    
    [_docDep mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(19);
        make.height.equalTo(@14);
        make.width.equalTo(@120);
    }];
    
    [_docHos mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(icon.mas_right).offset(12);
        make.top.equalTo(_docName.mas_bottom).offset(6);
        make.width.equalTo(@200);
        make.height.equalTo(@14);
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contentView).offset(30);
        make.top.equalTo(self.contentView).offset(73);
        make.width.equalTo(@(SCREENWIDTH-60));
        make.height.equalTo(@1);
    }];
    
    
    [_patientName mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contentView).offset(30);
        make.top.equalTo(_line.mas_bottom).offset(14);
        make.width.equalTo(@120);
        make.height.equalTo(@16);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.contentView).offset(-30);
        make.top.equalTo(_line.mas_bottom).offset(16);
        make.width.equalTo(@140);
        make.height.equalTo(@12);
    }];
    
    [_completeBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contentView).offset(38);
        make.top.equalTo(patientName.mas_bottom).offset(22);
        make.width.equalTo(_checkBtn);
        make.height.equalTo(@42);
        make.right.equalTo(_checkBtn.mas_left).offset(-14);
    }];
    
    [_checkBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.contentView).offset(-38);
        make.top.equalTo(patientName.mas_bottom).offset(22);
        make.height.equalTo(@42);
    }];

}


- (void)setModel:(MyInquiryModel *)model {
    _docIcon.image = [UIImage imageNamed:model.docIconUrl];
    _docName.text = model.docName;
    _docTitle.text = model.docTitle;
    _docHos.text = model.docHos;
    _docDep.text = model.docDep;
    _patientName.text = model.patientName;
    _timeLabel.text = model.time;
}

@end
