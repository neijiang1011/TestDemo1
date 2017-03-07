//
//  TypeJudge.h
//  HealthStation
//
//  Created by mobile manager on 17/3/2.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeJudge : NSObject

@property (assign,nonatomic)CGFloat currentHorizontalScaling;
@property (assign,nonatomic)CGFloat currentVerticalScaling;

+ (TypeJudge *)sharedManager;

@end
