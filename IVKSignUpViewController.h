//
//  IVKSignUpViewController.h
//  iVK
//
//  Created by Student on 6/24/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface IVKSignUpViewController : UIViewController

@property (nonatomic, strong) UITextField *firstNameTextField;
@property (nonatomic, strong) UITextField *lastNameTextField;
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *signInButton;

@property (nonatomic, strong) UIButton *postDetailsButton;


@property (nonatomic, strong) UIButton *testButton;

@property (nonatomic, strong, readonly) NSString *appId;
@property (nonatomic, strong, readonly) NSString *secretKey;


@end
