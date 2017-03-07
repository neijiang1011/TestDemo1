//
//  HeartLungVoiceTableViewCell.h
//  HealthStation
//
//  Created by mobile manager on 17/3/7.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeartLungVoiceModel.h"

@interface HeartLungVoiceTableViewCell : UITableViewCell

@property (nonatomic,assign)BOOL selectedState;
@property (nonatomic,assign)BOOL isLungRefer;
@property (nonatomic,strong)HeartLungVoiceModel *model;

@end
