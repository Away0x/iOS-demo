//
//  AWBaseServices.m
//  basic-demo
//
//  Created by wutong on 2019/9/5.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWBaseServices.h"

static NSString * const APIROOT = @"https://static001.geekbang.org";

@implementation AWBaseServices

+ (void)httpGet:(NSString *)path cb:(AWHTTPGetFinishBlock)cb {
    NSString *api = [APIROOT stringByAppendingString:path];
    NSURL *url = [NSURL URLWithString:api];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (cb) {
            cb(error == nil, jsonObj);
        }
    }];
    
    [task resume];
}

@end
