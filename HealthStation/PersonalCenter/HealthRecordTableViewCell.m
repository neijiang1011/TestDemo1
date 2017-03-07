//
//  HealthRecordTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 17/2/24.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "HealthRecordTableViewCell.h"

@implementation HealthRecordTableViewCell

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
    [self.contentView addSubview:icon];
    _icon = icon;
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = UIColorFromHex(0x000000);
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        titleLabel.font = [UIFont systemFontOfSize:14];
    }else {
        titleLabel.font = [UIFont systemFontOfSize:16];
    }
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    
    UILabel *detalLabel = [[UILabel alloc]init];
    detalLabel.textColor = UIColorFromHex(0x999999);
    detalLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:detalLabel];
    _detailLabel = detalLabel;
    detalLabel.textAlignment = NSTextAlignmentRight;
    
    //控件布局
    icon.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,15).widthIs(26).heightIs(26);
    
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        titleLabel.sd_layout.leftSpaceToView(self.contentView,53).topSpaceToView(self.contentView,21).widthIs(180).heightIs(14);
    }else {
        titleLabel.sd_layout.leftSpaceToView(self.contentView,53).topSpaceToView(self.contentView,20).widthIs(200).heightIs(16);
    }
    detalLabel.sd_layout.rightSpaceToView(self.contentView,1).topSpaceToView(self.contentView,21).heightIs(14).widthIs(60);
    
}



@end
