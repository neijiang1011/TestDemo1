//
//  TypeJudge.m
//  HealthStation
//
//  Created by mobile manager on 17/3/2.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "TypeJudge.h"

@implementation TypeJudge

+ (TypeJudge *)sharedManager {
    static TypeJudge *type = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        type = [[TypeJudge alloc]init];
    });
    
    return type;
}


@end
