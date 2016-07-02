//
//  AppDelegate.m
//  iVK
//
//  Created by Student on 6/17/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "IVKSignUpViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    IVKSignUpViewController *newSignUpViewController = [[IVKSignUpViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newSignUpViewController];
    [navController.navigationBar setTranslucent:NO];
    [[self window] setRootViewController:navController];
    [[self window] makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    return YES;
}
@end
