//
//  MedicineBoxNetMethod.m
//  SmartMedicineBox
//
//  Created by chjszx on 16/10/10.
//  Copyright © 2016年 chjszx. All rights reserved.
//

#import "MedicineBoxNetMethod.h"


@implementation MedicineBoxNetMethod

+ (void)boxAFGetWay:(NSString *)detailApi HeaderToken:(NSString *)headerToken UserId:(NSString *)uid  Completion:(void(^)(NSDictionary *dic))completion{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL,detailApi];
    
    if (headerToken) {
        [manager.requestSerializer setValue:headerToken forHTTPHeaderField:@"AuthToken"];
    }
    
    if (uid) {
        url = [NSString stringWithFormat:@"%@?uid=%@",url,uid];
    }
    
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingAllowFragments error: nil];
        NSLog(@"data:%@",data);
        completion(data);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSDictionary *data = @{@"blError": [error localizedDescription]};
        NSLog(@"data:%@",data);
        completion(data);
    }];
}


+ (void)boxAFPostWay:(NSString *)detailApi HeaderToken:(NSString *)headerToken PostDic:(NSDictionary *)posDic Completion:(void(^)(NSDictionary *dic))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL,detailApi];
    
    if (headerToken) {
        [manager.requestSerializer setValue:headerToken forHTTPHeaderField:@"AuthToken"];
    }
    
    [manager POST:url parameters:posDic constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingAllowFragments error: nil];
        NSLog(@"data:%@",data);
        completion(data);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSDictionary *data = @{@"blError": [error localizedDescription]};
        completion(data);
    }];
}


+ (void)uploadAvatar:(NSString *)detailApi UserId:(NSString *)uid  HeaderToken:(NSString *)headerToken UploadImage:(UIImage *)image Completion:(void(^)(NSDictionary *dic))completion {
    NSDictionary *idDic = @{@"uid":uid,@"id":@"avatar",@"name":@"abcd"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL,detailApi];
    
    if (headerToken) {
        [manager.requestSerializer setValue:headerToken forHTTPHeaderField:@"AuthToken"];
    }
    
    [manager POST: url parameters:idDic constructingBodyWithBlock:^(id<AFMultipartFormData>formData) {
        
        //NSData *imageData = UIImageJPEGRepresentation(image, 0.4);
        NSData *imageData = UIImagePNGRepresentation(image);
        
        NSString *curFileName = @"avatar.png";
        
        if (curFileName == nil || [curFileName isEqualToString: @""]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmsss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            //            curFileName = [NSString stringWithFormat:@"%@.jpg", str];
            curFileName = [NSString stringWithFormat:@"%@.png", str];
        }
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"avatar"
                                fileName:curFileName
                                mimeType:@"image/png"];//jpeg
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印下上传进度
        
        NSLog(@"progress: %@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingAllowFragments error: nil];
        //NSLog(@"upload data: %@", data);
        completion(data);
        //上传成功
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //上传失败        
        NSLog(@"failure: %@", error.localizedDescription);
        NSDictionary *dict = @{@"blError": error.localizedDescription};
        completion(dict);
        //complection(dict);
    }];
}

@end
