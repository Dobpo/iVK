//
//  AppDelegate.m
//  iVK
//
//  Created by Student on 6/17/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "IVKSignUpViewController.h"
#import "IVKFeedViewController.h"


@interface AppDelegate ()<VKSdkUIDelegate,VKSdkDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeCoreData];
    self.sdkInst = [VKSdk initializeWithAppId:@"5535878"];
    [self.sdkInst registerDelegate:self];
    [self.sdkInst setUiDelegate:self];
    self.window = [[UIWindow alloc] init];
    IVKSignUpViewController *newSignUpViewController = [[IVKSignUpViewController alloc] init];
    
    //IVKFeedViewController *feedViewController = [[IVKFeedViewController alloc] init];
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:token?feedViewController:newSignUpViewController];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newSignUpViewController];
    
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
    NSArray *SCOPE = @[@"friends", @"email",@"wall"];
    
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
            [VKSdk authorize:SCOPE withOptions:VKAuthorizationOptionsDisableSafariController];
      
       
    }];
}

- (void)initializeCoreData
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setManagedObjectContext:moc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}


@end










