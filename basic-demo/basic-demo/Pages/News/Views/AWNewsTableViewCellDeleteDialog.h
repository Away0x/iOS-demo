//
//  AWNewsTableViewCellDeleteDialog.h
//  basic-demo
//
//  Created by wutong on 2019/9/9.
//  Copyright © 2019 wutong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 删除 cell 的浮层
@interface AWNewsTableViewCellDeleteDialog : UIView

/**
 * 点击出现删除 cell 确认浮层
 */
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
