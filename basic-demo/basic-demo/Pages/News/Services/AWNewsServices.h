//
//  AWNewsServices.h
//  basic-demo
//
//  Created by wutong on 2019/9/5.
//  Copyright © 2019 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseServices.h"

@class AWNewsListItem;

typedef void(^AWNewsServicesLoadListDataBlock)(BOOL success, NSMutableArray<AWNewsListItem *> * _Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface AWNewsServices : AWBaseServices

+ (void)loadList:(AWNewsServicesLoadListDataBlock)cb;

@end

NS_ASSUME_NONNULL_END
