//
//  AWVideoViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWVideoViewController.h"

@interface AWVideoViewController ()

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
    // Do any additional setup after loading the view.
}

@end
