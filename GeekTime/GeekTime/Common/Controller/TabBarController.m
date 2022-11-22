//
//  TabBarController.m
//  GeekTime
//
//  Created by 吴彤 on 2021/6/4.
//

#import "TabBarController.h"
#import "SearchBar.h"
#import "ScreenUtils.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setSearchBar {
    [self.navigationItem setTitleView:({
        SearchBar *sb = [[SearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
        sb;
    })];
}

@end
