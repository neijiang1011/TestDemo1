//
//  DeviceConnectTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "DeviceConnectTableViewCell.h"


@implementation DeviceConnectTableViewCell

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
    //icon.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:icon];
    _icon = icon;
    
    UILabel *hosName = [[UILabel alloc]init];
    hosName.textColor = UIColorFromHex(0x4f4c5f);
    hosName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:hosName];
    _nameLabel = hosName;
    
    UILabel *hosDistance = [[UILabel alloc]init];
    hosDistance.textColor = UIColorFromHex(0x888693);
    hosDistance.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:hosDistance];
    _stateLabel = hosDistance;
    _stateLabel.textAlignment = NSTextAlignmentRight;
    
    
    UIImageView *icon1 = [[UIImageView alloc]init];
    //icon1.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:icon1];
    _stateIcon = icon1;
    
    
    //控件布局
    _icon.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,14).widthIs(28).heightIs(28);
    _nameLabel.sd_layout.leftSpaceToView(self.contentView,53).topSpaceToView(self.contentView,20).heightIs(16).widthIs(160);
    _stateLabel.sd_layout.rightSpaceToView(self.contentView,37+5).topSpaceToView(self.contentView,20).widthIs(100).heightIs(16);
    _stateIcon.sd_layout.rightSpaceToView(self.contentView,5).topSpaceToView(self.contentView,14).heightIs(28).widthIs(28);
}




- (void)setModel:(DeviceReferModel *)model {
    _icon.image = [UIImage imageNamed:model.iconUrl];
    _nameLabel.text = model.name;
    _stateLabel.text = model.connectState;
    _stateIcon.image = [UIImage imageNamed:model.connectStateIconUrl];
}


@end
