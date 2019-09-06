//
//  AWNewsListItem.m
//  basic-demo
//
//  Created by wutong on 2019/9/6.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsListItem.h"

@implementation AWNewsListItem

- (void)initWithDictionary:(NSDictionary *)dictionary {
    // #warning 注意类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
