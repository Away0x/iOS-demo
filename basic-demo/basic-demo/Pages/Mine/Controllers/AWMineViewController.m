//
//  AWMineViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWMineViewController.h"

@interface AWMineViewController ()

@end

@implementation AWMineViewController

#pragma mark - life hook

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBar:@"我的"
                  image:[UIImage imageNamed:@"icon.bundle/page@2x.png"]
          selectedImage:[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
