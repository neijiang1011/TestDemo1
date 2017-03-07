//
//  MedicineBoxNetMethod.h
//  SmartMedicineBox
//
//  Created by chjszx on 16/10/10.
//  Copyright © 2016年 chjszx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define BASE_URL @"http://ancare.changhong.com"

@interface MedicineBoxNetMethod : NSObject

+ (void)boxAFGetWay:(NSString *)detailApi HeaderToken:(NSString *)headerToken UserId:(NSString *)uid Completion:(void(^)(NSDictionary *dic))completion;
+ (void)boxAFPostWay:(NSString *)detailApi HeaderToken:(NSString *)headerToken PostDic:(NSDictionary *)posDic Completion:(void(^)(NSDictionary *dic))completion;
+ (void)uploadAvatar:(NSString *)detailApi UserId:(NSString *)uid  HeaderToken:(NSString *)headerToken UploadImage:(UIImage *)image Completion:(void(^)(NSDictionary *dic))completion;

@end
