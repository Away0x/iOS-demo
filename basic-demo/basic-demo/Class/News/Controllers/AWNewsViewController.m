//
//  AWNewsViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsViewController.h"

@interface AWNewsViewController ()

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
    // Do any additional setup after loading the view.
}

@end
