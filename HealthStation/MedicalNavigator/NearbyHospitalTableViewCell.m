//
//  NearbyHospitalTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 16/12/20.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import "NearbyHospitalTableViewCell.h"

@implementation NearbyHospitalTableViewCell

{
    UIImageView *_hosIcon;
    UILabel *_hosName;
    UILabel *_hosDistance;
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
//    icon.layer.masksToBounds = YES;
//    icon.layer.cornerRadius = 26.5f;
    [self.contentView addSubview:icon];
    _hosIcon = icon;
    
    UILabel *hosName = [[UILabel alloc]init];
    hosName.textColor = UIColorFromHex(0x333333);
    hosName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:hosName];
    _hosName = hosName;
    
    UILabel *hosDistance = [[UILabel alloc]init];
    hosDistance.textAlignment = NSTextAlignmentRight;
    hosDistance.textColor = UIColorFromHex(0x666666);
    hosDistance.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:hosDistance];
    _hosDistance = hosDistance;
    
    //控件布局
    icon.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,15).widthIs(55).heightIs(40);
    hosName.sd_layout.leftSpaceToView(icon,13).topSpaceToView(self.contentView,27).widthIs(150).heightIs(16);
    hosDistance.sd_layout.rightSpaceToView(self.contentView,16).topSpaceToView(self.contentView,28).widthIs(100).heightIs(14);
}


- (void)setModel:(NearbyHosModel *)model {
    _hosIcon.image = [UIImage imageNamed:model.hosIconUrl];
    _hosName.text = model.hosName;
    _hosDistance.text = model.hosDistance;
}


@end
