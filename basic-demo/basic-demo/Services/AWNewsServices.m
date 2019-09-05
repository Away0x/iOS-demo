//
//  AWNewsServices.m
//  basic-demo
//
//  Created by wutong on 2019/9/5.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsServices.h"

@implementation AWNewsServices

+ (void)loadList {
    [self httpGet:@"/univer/classes/ios_dev/lession/45/toutiao.json" cb:^(BOOL success, id  _Nonnull data) {
        NSLog(@"%@", data);
    }];
}

@end
