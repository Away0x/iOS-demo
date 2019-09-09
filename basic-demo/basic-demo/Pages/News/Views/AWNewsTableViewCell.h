//
//  AWNewsTableViewCell.h
//  basic-demo
//
//  Created by wutong on 2019/9/9.
//  Copyright © 2019 wutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWNewsListItem;

@protocol AWNewsTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *_Nullable)tableViewCell clickDeleteButton:(UIButton *_Nullable)deleteButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AWNewsTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<AWNewsTableViewCellDelegate> delegate;

- (void)fillData:(AWNewsListItem *)item;

@end

NS_ASSUME_NONNULL_END
