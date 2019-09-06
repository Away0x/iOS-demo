//
//  AWBaseServices.h
//  basic-demo
//
//  Created by wutong on 2019/9/5.
//  Copyright © 2019 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AWHTTPGetFinishBlock)(BOOL success, id _Nonnull data);

NS_ASSUME_NONNULL_BEGIN

@interface AWBaseServices : NSObject

+ (void)httpGet:(NSString *)path cb:(AWHTTPGetFinishBlock)cb;

@end

NS_ASSUME_NONNULL_END
