//
//  NearbyDoctorTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 16/12/20.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import "NearbyDoctorTableViewCell.h"


@implementation NearbyDoctorTableViewCell

{
    UIImageView *_docIcon;
    UILabel *_docName;
    UILabel *_docTitle;
    UILabel *_docHos;
    UILabel *_docDep;
    UILabel *_priceLabel;
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
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self createCellSubViews];
    }
    
    return self;
}


- (void)createCellSubViews {
    //创建控件
    UIImageView *icon = [[UIImageView alloc]init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 22.5f;
    [self.contentView addSubview:icon];
    _docIcon = icon;
    
    UILabel *hosName = [[UILabel alloc]init];
    hosName.textColor = UIColorFromHex(0x4f4c5f);
    hosName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:hosName];
    _docName = hosName;
    //[_docName setSingleLineAutoResizeWithMaxWidth:100];//设置宽度自适应的最大宽度。
    
    UILabel *hosDistance = [[UILabel alloc]init];
    hosDistance.textColor = UIColorFromHex(0x888693);
    hosDistance.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:hosDistance];
    _docHos = hosDistance;
    [_docHos setSingleLineAutoResizeWithMaxWidth:200];
    
    
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
    
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.textColor = UIColorFromHex(0xfe3636);
    priceLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:priceLabel];
    priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel = priceLabel;
    
    
    
    //控件布局
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
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.contentView).offset(-16);
        make.top.equalTo(self.contentView).offset(28);
        make.width.equalTo(@100);
        make.height.equalTo(@14);
    }];
    
    
    
//    icon.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,14).widthIs(53).heightIs(53);
//    _docName.sd_layout.leftSpaceToView(icon,12).topSpaceToView(self.contentView,17).heightIs(16).rightSpaceToView(_docTitle,16);
//    _docTitle.sd_layout.topSpaceToView(self.contentView,21).widthIs(70).heightIs(12);
//    _docHos.sd_layout.leftSpaceToView(icon,12).topSpaceToView(_docName,14).heightIs(12);
//    _docDep.sd_layout.topSpaceToView(self.contentView,21).widthIs(80).heightIs(12).leftSpaceToView(_docTitle,12);
}


- (void)setModel:(NearbyDoctorModel *)model {
    _docIcon.image = [UIImage imageNamed:model.docIconUrl];
    _docName.text = model.docName;
    _docTitle.text = model.docTitle;
    _docHos.text = model.docHos;
    _docDep.text = model.docDep;
    _priceLabel.text = model.price;
}


@end
