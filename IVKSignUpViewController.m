//
//  IVKSignUpViewController.m
//  iVK
//
//  Created by Student on 6/24/16.
//  Copyright © 2016 Student. All rights reserved.
//
#import "UIColor+CustomColors.h"
#import "IVKSignUpViewController.h"
#import "IVKSessionDataManager.h"
#import "AppDelegate.h"
#define PADDING 10
#define TEXT_FIELD_HEIGHT 30


@implementation IVKSignUpViewController

NSString *appId = @"5535878";
NSString *secretKey = @"JMKm7SlQ74mWEe9JlZN7";

-(void) viewDidLoad{
    [super viewDidLoad];
    
    
    UIColor *placeHolderColor = [UIColor myBlue];
    
    UIImageView *imageView =  [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"sign_up_background"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIView *blueOverlay =  [[UIView alloc]initWithFrame:self.view.bounds];
    [blueOverlay setBackgroundColor:[UIColor myLightBlue]];
    [imageView addSubview:blueOverlay];
    
    [self.view addSubview:imageView];
    
    
    self.title = @"Sign Up";
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithTitle:@"Submit"
                                                            style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(submit)];
    
    [self.navigationItem setRightBarButtonItem:item];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:placeHolderColor}];
        
    [self.view setBackgroundColor:[UIColor myLightBlue]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor myWhite];
    self.navigationController.navigationBar.tintColor = placeHolderColor;
    
    CGRect uiElementsRect = CGRectMake(PADDING,0.0, (self.view.frame.size.width - PADDING * 2), TEXT_FIELD_HEIGHT);
    
    NSAttributedString *firstNamePlaceHolder = [[NSAttributedString alloc] initWithString:@"First Name"
                                                                               attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    NSAttributedString *lastNamePlaceHolder = [[NSAttributedString alloc] initWithString:@"Last Name"
                                                                              attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    NSAttributedString *emailPlaceHolder = [[NSAttributedString alloc] initWithString:@"Email"
                                                                           attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    NSAttributedString *passwordPlaceHolder = [[NSAttributedString alloc] initWithString:@"Password"
                                                                              attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    NSAttributedString *phonePlaceHolder = [[NSAttributedString alloc] initWithString:@"Phone" attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    
    
    self.firstNameTextField = [[UITextField alloc] initWithFrame:uiElementsRect];
    [self.firstNameTextField setAttributedPlaceholder:firstNamePlaceHolder];
    [self.firstNameTextField setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.firstNameTextField];
    uiElementsRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.firstNameTextField.frame.size.height - 1, self.firstNameTextField.frame.size.width, 0.5)];
    [lineView1 setBackgroundColor:placeHolderColor];
    [self.firstNameTextField addSubview:lineView1];
    
    self.lastNameTextField = [[UITextField alloc] initWithFrame:uiElementsRect];
    [self.lastNameTextField setAttributedPlaceholder:lastNamePlaceHolder];
    [self.lastNameTextField setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.lastNameTextField];
    uiElementsRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.lastNameTextField.frame.size.height - 1, self.lastNameTextField.frame.size.width, 0.5)];
    [lineView2 setBackgroundColor:placeHolderColor];
    [self.lastNameTextField addSubview:lineView2];
    
    self.emailTextField = [[UITextField alloc] initWithFrame:uiElementsRect];
    [self.emailTextField setAttributedPlaceholder:emailPlaceHolder];
    [self.emailTextField setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.emailTextField];
    uiElementsRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.emailTextField.frame.size.height - 1, self.emailTextField.frame.size.width, 0.5)];
    [lineView3 setBackgroundColor:placeHolderColor];
    [self.emailTextField addSubview:lineView3];
    
    self.phoneTextField = [[UITextField alloc] initWithFrame:uiElementsRect];
    [self.phoneTextField setAttributedPlaceholder:phonePlaceHolder];
    [self.phoneTextField setTextColor:[UIColor whiteColor]];
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:self.phoneTextField];
    uiElementsRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView5 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.emailTextField.frame.size.height - 1, self.emailTextField.frame.size.width, 0.5)];
    [lineView5 setBackgroundColor:placeHolderColor];
    [self.phoneTextField addSubview:lineView5];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:uiElementsRect];
    [self.passwordTextField setAttributedPlaceholder:passwordPlaceHolder];
    [self.passwordTextField setTextColor:[UIColor whiteColor]];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:self.passwordTextField];
    uiElementsRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.passwordTextField.frame.size.height - 1, self.passwordTextField.frame.size.width, 0.5)];
    [lineView4 setBackgroundColor:placeHolderColor];
    [self.passwordTextField addSubview:lineView4];
    
    self.signInButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [self.signInButton setTitleColor:placeHolderColor forState:UIControlStateNormal];
    [self.signInButton addTarget:self
                          action:@selector(showSignInView)
                forControlEvents:UIControlEventTouchUpInside];
    [self.signInButton setFrame:CGRectMake(self.view.frame.size.width - 60, uiElementsRect.origin.y, 50, TEXT_FIELD_HEIGHT)];
    [self.view addSubview:self.signInButton];
    
    
}

-(void)showSignInView{
    UIApplication *application = [UIApplication sharedApplication];
    [(AppDelegate *)application.delegate logIn];
}

-(void)submit {
    NSDictionary *dictionary = @{
                                 @"first_name":self.firstNameTextField.text,
                                 @"last_name":self.lastNameTextField.text,
                                 @"client_id":@"5535878",
                                 @"client_secret":@"JMKm7SlQ74mWEe9JlZN7",
                                 @"phone":self.phoneTextField.text,
                                 @"password":self.passwordTextField.text,
                                 @"test_mode":@1
                                 };
   [IVKSessionDataManager POSTRequestWithURL:@"https://api.vk.com/method/auth.signup" parameters:dictionary handler:^(NSData *data, NSURLResponse *response, NSError *error) {
       NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

       id o = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       
       NSDictionary *jsonAnswerDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
       //NSLog(@"%@", jsonAnswerDictionary[@"error"][@"error_code"]);
   }];
}

@end
