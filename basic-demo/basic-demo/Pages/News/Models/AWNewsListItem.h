//
//  AWNewsListItem.h
//  basic-demo
//
//  Created by wutong on 2019/9/6.
//  Copyright © 2019 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 列表 item 数据 */
@interface AWNewsListItem : NSObject

@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *picUrl;
@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *articleUrl;

- (void)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
