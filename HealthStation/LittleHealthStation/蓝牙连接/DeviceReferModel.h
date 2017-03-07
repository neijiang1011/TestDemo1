//
//  DeviceReferModel.h
//  HealthStation
//
//  Created by mobile manager on 17/2/17.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceReferModel : NSObject

@property (copy,nonatomic)NSString *iconUrl;
@property (copy,nonatomic)NSString *name;
@property (copy,nonatomic)NSString *connectState;
@property (copy,nonatomic)NSString *connectStateIconUrl;

@end
