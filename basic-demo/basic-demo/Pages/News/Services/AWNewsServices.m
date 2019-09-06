//
//  AWNewsServices.m
//  basic-demo
//
//  Created by wutong on 2019/9/5.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsServices.h"
#import "AWNewsListItem.h"

@implementation AWNewsServices

+ (void)loadList:(AWNewsServicesLoadListDataBlock)cb {
    [self httpGet:@"/univer/classes/ios_dev/lession/45/toutiao.json" cb:^(BOOL success, id  _Nonnull data) {
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)data) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray<AWNewsListItem *> *listItemArray = @[].mutableCopy;
        
        for (NSDictionary *info in dataArray) {
            AWNewsListItem *listItem = [[AWNewsListItem alloc] init];
            [listItem initWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (cb) {
                cb(success, listItemArray);
            }
        });
    }];
}

@end
