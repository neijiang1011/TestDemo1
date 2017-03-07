//
//  ElectrocardiogramTableViewCell.h
//  HealthStation
//
//  Created by mobile manager on 17/3/7.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ElectrocardiogramModel.h"

@interface ElectrocardiogramTableViewCell : UITableViewCell

@property (nonatomic,assign)BOOL selectedState;
@property (nonatomic,strong)ElectrocardiogramModel *model;

@end
