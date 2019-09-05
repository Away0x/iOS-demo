//
//  AWRecommendViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWRecommendViewController.h"

@interface AWRecommendViewController ()

@end

@implementation AWRecommendViewController

#pragma mark - life hook

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBar:@"推荐"
                  image:[UIImage imageNamed:@"icon.bundle/like@2x.png"]
          selectedImage:[UIImage imageNamed:@"icon.bundle/like_selected@2x.png"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
