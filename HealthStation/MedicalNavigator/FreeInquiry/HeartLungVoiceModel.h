//
//  HeartLungVoiceModel.h
//  HealthStation
//
//  Created by mobile manager on 17/3/7.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeartLungVoiceModel : NSObject

@property (nonatomic,copy)NSString *heartRate;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *voiceRefer;
@property (nonatomic,assign)BOOL isLungRefer;

@end
