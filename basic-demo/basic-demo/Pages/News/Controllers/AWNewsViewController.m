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

@interface AWNewsViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = @"world";
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}

@end
