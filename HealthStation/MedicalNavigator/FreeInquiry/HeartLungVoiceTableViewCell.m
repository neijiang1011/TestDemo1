//
//  HeartLungVoiceTableViewCell.m
//  HealthStation
//
//  Created by mobile manager on 17/3/7.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "HeartLungVoiceTableViewCell.h"

@implementation HeartLungVoiceTableViewCell

{
    UILabel *_heartRateLabel;
    UILabel *_timeLabel;
    UIImageView *_selectImageView;
    UIImageView *_unSelectImageView;
    
    UIImageView *_heartImageView;
    UIImageView *_lungImageView;
    UILabel *_voiceLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    //创建控件
    _unSelectImageView = ({
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        icon.image = [UIImage imageNamed:@"单选-没选择"];
        icon;
    });
    
    _selectImageView = ({
        UIImageView *icon = [[UIImageView alloc]init];
        icon.hidden = YES;
        [self.contentView addSubview:icon];
        icon.image = [UIImage imageNamed:@"单选-点"];
        icon;
    });
    
    
    _heartImageView = ({
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        icon.image = [UIImage imageNamed:@"心音"];
        icon;
    });
    
    _lungImageView = ({
        UIImageView *icon = [[UIImageView alloc]init];
        icon.hidden = YES;
        [self.contentView addSubview:icon];
        icon.image = [UIImage imageNamed:@"肺音"];
        icon;
    });
    
    
    _heartRateLabel = ({
        UILabel *hosName = [[UILabel alloc]init];
        hosName.textColor = UIColorFromHex(0x4f4c5f);
        hosName.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:hosName];
        [hosName setSingleLineAutoResizeWithMaxWidth:100];
        hosName;
    });
    
    //[_docName setSingleLineAutoResizeWithMaxWidth:100];//设置宽度自适应的最大宽度。
    _voiceLabel = ({
        UILabel *hosName = [[UILabel alloc]init];
        hosName.textColor = UIColorFromHex(0x4f4c5f);
        hosName.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:hosName];
        hosName;
    });
    
    _timeLabel = ({
        UILabel *hosDistance = [[UILabel alloc]init];
        hosDistance.textColor = UIColorFromHex(0x888693);
        hosDistance.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:hosDistance];
        hosDistance;
    });
    
    
    //控件布局
    _heartImageView.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,13).widthIs(25).heightIs(25);
    _lungImageView.sd_layout.leftSpaceToView(self.contentView,16).topSpaceToView(self.contentView,13).widthIs(25).heightIs(25);
    _selectImageView.sd_layout.rightSpaceToView(self.contentView,16).topSpaceToView(self.contentView,22).widthIs(25).heightIs(25);
    _unSelectImageView.sd_layout.rightSpaceToView(self.contentView,16).topSpaceToView(self.contentView,22).widthIs(25).heightIs(25);
    _heartRateLabel.sd_layout.leftSpaceToView(_heartImageView,10).topSpaceToView(self.contentView,16).heightIs(16);//here
    _voiceLabel.sd_layout.leftSpaceToView(_heartRateLabel,10).topSpaceToView(self.contentView,16).heightIs(16).widthIs(120);
    _timeLabel.sd_layout.leftEqualToView(_heartImageView).topSpaceToView(_heartRateLabel,10).heightIs(12).widthIs(150);
}


- (void)setModel:(HeartLungVoiceModel *)model {
    _timeLabel.text = model.time;
    _heartRateLabel.text = model.heartRate;
    _voiceLabel.text = model.voiceRefer;
    _isLungRefer = model.isLungRefer;
}


- (void)dealloc {
    NSLog(@"elec cell has destroyed");
}

- (void)setSelectedState:(BOOL)selectedState {
    if (selectedState) {
        _selectImageView.hidden = NO;
    }else {
        _selectImageView.hidden = YES;
    }
}

- (void)setIsLungRefer:(BOOL)isLungRefer {
    if (isLungRefer) {
        _lungImageView.hidden = NO;
        _heartImageView.hidden = YES;
    }else {
        _lungImageView.hidden = YES;
        _heartImageView.hidden = NO;
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
