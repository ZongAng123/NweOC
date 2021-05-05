//
//  AppDelegate.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/4.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)setupRequestFilters {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = BASEURL;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //      网络请求
            [self setupRequestFilters];
    
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.backgroundColor =[UIColor whiteColor];
            ViewController *baseView = [[ViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseView];
            self.window.rootViewController = nav;
            [self.window makeKeyAndVisible];
    
    return YES;
}




@end
