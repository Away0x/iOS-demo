//
//  AWBaseViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWBaseViewController.h"

@interface AWBaseViewController ()

@end

@implementation AWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 设置 tabbar
- (void)setTabBar:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self.tabBarItem.title = title;
    self.tabBarItem.image = image;
    self.tabBarItem.selectedImage = selectedImage;
}

@end
