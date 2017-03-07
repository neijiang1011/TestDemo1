//
//  DeviceConnectTableViewCell.h
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceReferModel.h"

@interface DeviceConnectTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *icon;
@property (strong,nonatomic)UILabel *nameLabel;
@property (strong,nonatomic)UILabel *stateLabel;
@property (strong,nonatomic)UIImageView *stateIcon;

@property (strong,nonatomic)DeviceReferModel *model;

@end
