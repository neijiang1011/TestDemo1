//
//  NearbyDoctorModel.h
//  HealthStation
//
//  Created by mobile manager on 16/12/20.
//  Copyright © 2016年 Changhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NearbyDoctorModel : NSObject

@property (nonatomic,copy)NSString *docIconUrl;
@property (nonatomic,copy)NSString *docName;
@property (nonatomic,copy)NSString *docTitle;
@property (nonatomic,copy)NSString *docHos;
@property (nonatomic,copy)NSString *docDep;
@property (nonatomic,copy)NSString *price;

@end
