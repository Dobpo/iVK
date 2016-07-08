//
//  AppDelegate.m
//  iVK
//
//  Created by Student on 6/17/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "IVKSignUpViewController.h"
#import "IVKNewsViewController.h"

@interface AppDelegate ()<VKSdkUIDelegate,VKSdkDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.sdkInst = [VKSdk initializeWithAppId:@"5535878"];
    [self.sdkInst registerDelegate:self];
    [self.sdkInst setUiDelegate:self];
    self.window = [[UIWindow alloc] init];
    IVKSignUpViewController *newSignUpViewController = [[IVKSignUpViewController alloc] init];
    IVKNewsViewController *newsViewController = [[IVKNewsViewController alloc] init];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:token?newsViewController:newSignUpViewController];
    [navController.navigationBar setTranslucent:NO];
    [[self window] setRootViewController:navController];
    [[self window] makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    [VKSdk processOpenURL:url fromApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]];
    return YES;
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller{
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError{
    NSLog(@"%@", captchaError);
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result{
    if(result.token != nil){
    [[NSUserDefaults standardUserDefaults] setObject:result.token.accessToken forKey:@"authToken"];
    }
}

- (void)vkSdkUserAuthorizationFailed{
    NSLog(@"FAILD");
}

- (void)logIn{
    NSArray *SCOPE = @[@"friends", @"email"];
    
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
       [VKSdk authorize:@[VK_PER_NOTIFY,VK_PER_FRIENDS,VK_PER_PHOTOS,VK_PER_AUDIO,VK_PER_VIDEO,VK_PER_DOCS,VK_PER_NOTES,VK_PER_PAGES,VK_PER_STATUS,VK_PER_WALL,VK_PER_GROUPS,VK_PER_MESSAGES,VK_PER_NOTIFICATIONS,VK_PER_STATS,VK_PER_ADS,VK_PER_OFFLINE,VK_PER_NOHTTPS,VK_PER_EMAIL,VK_PER_MARKET] withOptions:VKAuthorizationOptionsDisableSafariController];
    }];
    /*VK_PER_NOTIFY,VK_PER_FRIENDS,VK_PER_PHOTOS,VK_PER_AUDIO,VK_PER_VIDEO,VK_PER_DOCS,VK_PER_NOTES,VK_PER_PAGES,VK_PER_STATUS,VK_PER_WALL,VK_PER_GROUPS,VK_PER_MESSAGES,VK_PER_NOTIFICATIONS,VK_PER_STATS,VK_PER_ADS,VK_PER_OFFLINE,VK_PER_NOHTTPS,VK_PER_EMAIL,VK_PER_MARKET*/
}


@end
