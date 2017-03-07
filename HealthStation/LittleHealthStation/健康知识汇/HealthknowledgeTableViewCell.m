//
//  HealthknowledgeTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "HealthknowledgeTableViewCell.h"

@implementation HealthknowledgeTableViewCell

{
    UIImageView *_pic;
    UILabel *_titleLabel;
    UIView *_translucentView;
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
        [self createCellSubViews];
    }
    
    return self;
}


- (void)createCellSubViews {
    //创建控件
    UIImageView *icon = [[UIImageView alloc]init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 26.5f;
    [self.contentView addSubview:icon];
    _pic = icon;
    
    
    UIView *view = [[UIView alloc]init];
    [self.contentView addSubview:view];
    _translucentView = view;
    view.alpha = 0.4;
    view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *hosName = [[UILabel alloc]init];
    hosName.textColor = UIColorFromHex(0x4f4c5f);
    hosName.font = [UIFont systemFontOfSize:16];
    [view addSubview:hosName];
    _titleLabel = hosName;
    
    
    //控件布局
    icon.sd_layout.leftSpaceToView(self.contentView,12).topSpaceToView(self.contentView,14).rightSpaceToView(self.contentView,4).bottomEqualToView(self.contentView);
    view.sd_layout.leftSpaceToView(self.contentView,12).bottomEqualToView(self.contentView).rightSpaceToView(self.contentView,4).heightIs(30);
    hosName.sd_layout.leftSpaceToView(view,11).topSpaceToView(view,8).heightIs(14).widthIs(200);
    
}





- (void)setModel:(HealthKnowledgeModel *)model {
    _pic.image = [UIImage imageNamed:model.picUrl];
    _titleLabel.text = model.title;
}


@end
