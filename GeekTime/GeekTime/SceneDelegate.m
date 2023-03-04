//
//  SceneDelegate.m
//  GeekTime
//
//  Created by 吴彤 on 2021/5/9.
//

#import "SceneDelegate.h"

#import "TabBarController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
#import "MineViewController.h"
#import "SplashImageView.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    if (!scene) return;
    // window 的 rootController 是 NavigationController
    // NavigationController 最顶层的 controller 是 TabBarController
    // 进入 TabBarController 子页面时，不会显示底部的 tabbar
    
    UIWindowScene *windowScene = (UIWindowScene*)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    TabBarController *tabC = [[TabBarController alloc] init];
    CGRect tabFrame = tabC.tabBar.frame;
    tabC.tabBar.frame = tabFrame;
    [tabC setViewControllers:@[newsVC, videoVC, recommendVC, mineVC]];
    tabC.delegate = self;
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:tabC];
    
    self.window.rootViewController = navC;
    [self.window makeKeyAndVisible];
    

    SplashImageView *splashView = [[SplashImageView alloc] initWithFrame:self.window.bounds];
    [self.window addSubview:splashView];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"select tab");
}

@end
