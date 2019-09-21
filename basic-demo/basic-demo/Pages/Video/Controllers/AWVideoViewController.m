//
//  AWVideoViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWVideoViewController.h"

@interface AWVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation AWVideoViewController

#pragma mark - life hook

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBar:@"视频"
                  image:[UIImage imageNamed:@"icon.bundle/video@2x.png"]
          selectedImage:[UIImage imageNamed:@"icon.bundle/video_selected@2x.png"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 流式布局
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / 16 * 9);
    
    // collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
    // inset 自动适配(刘海屏、非刘海屏滚动视图顶部的适配) 默认会自动适配
    // 不需系统自动适配的话可设置其为 UIScrollViewContentInsetAdjustmentNever
    // collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    // 注册 item class
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        
    }
    
    return cell;
}

@end
