//
//  AppDelegate.h
//  iVK
//
//  Created by Student on 6/17/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>
@import CoreData;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VKSdk *sdkInst;

@property (strong) NSManagedObjectContext *managedObjectContext;

- (void)initializeCoreData;

- (void)logIn;

@end

