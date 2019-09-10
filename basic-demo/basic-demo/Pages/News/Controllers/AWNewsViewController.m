//
//  AWNewsViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsViewController.h"
#import "AWNewsServices.h"
#import "AWNewsListItem.h"
#import "AWNewsTableViewCell.h"
#import "AWNewsTableViewCellDeleteDialog.h"
#import "AWNewsDetailViewController.h"

@interface AWNewsViewController ()<UITableViewDelegate, UITableViewDataSource, AWNewsTableViewCellDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;

@end

@implementation AWNewsViewController

#pragma mark - life hook

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBar:@"新闻"
          image:[UIImage imageNamed:@"icon.bundle/home@2x.png"]
          selectedImage:[UIImage imageNamed:@"icon.bundle/home_selected@2x.png"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    __weak typeof(self) weakSelf = self;
    [AWNewsServices loadList:^(BOOL success, NSMutableArray<AWNewsListItem *> * _Nullable data) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataArray = data;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AWNewsListItem *item = [_dataArray objectAtIndex:indexPath.row];
    
    AWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[AWNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.delegate = self;
    }
    [cell fillData:item];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AWNewsListItem *item = [_dataArray objectAtIndex:indexPath.row];

    AWNewsDetailViewController *detailController = [[AWNewsDetailViewController alloc]initWithUrlString:item.articleUrl];
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - AWNewsTableViewCellDelegate

// 点击了删除按钮
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    // 动画
    AWNewsTableViewCellDeleteDialog *dialog = [[AWNewsTableViewCellDeleteDialog alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self) wself = self;
    [dialog showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(wself) strongSelf = wself;
        NSIndexPath *delIndexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
        if (strongSelf.dataArray.count > delIndexPath.row) {
            // 删除数据
            NSMutableArray *dataArrTemp = [strongSelf.dataArray mutableCopy];
            [dataArrTemp removeObjectAtIndex:delIndexPath.row];
            strongSelf.dataArray = [dataArrTemp copy];
            // 删除 cell
            [strongSelf.tableView deleteRowsAtIndexPaths:@[delIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
}

@end
