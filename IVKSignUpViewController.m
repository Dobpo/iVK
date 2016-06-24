//
//  IVKSignUpViewController.m
//  iVK
//
//  Created by Student on 6/24/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKSignUpViewController.h"
#define PADDING 10
#define TEXT_FIELD_HEIGHT 30

@implementation IVKSignUpViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    
    //NSAttributedString *navigationBarTitle = [[NSAttributedString alloc] initWithString:@"Sign Up"
    //                                                                         attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.title = @"Sign Up";
    
    UIColor *customColor = [UIColor colorWithRed:49.0f/255.0f
                                          green:101.0f/255.0f
                                          blue:141.0f/255.0f
                                          alpha:1];
    
    UIColor *contentColor = [UIColor colorWithRed:49.0f/255.0f
                                            green:101.0f/255.0f
                                             blue:141.0f/255.0f
                                            alpha:0.5];
    
    self.navigationController.navigationBar.barTintColor = customColor;
    
    CGRect textFieldRect = CGRectMake(PADDING,0.0, (self.view.frame.size.width - PADDING * 2), TEXT_FIELD_HEIGHT);
    
    NSAttributedString *firstNamePlaceHolder = [[NSAttributedString alloc] initWithString:@"First Name"
                                                                               attributes:@{NSForegroundColorAttributeName:contentColor}];
    NSAttributedString *lastNamePlaceHolder = [[NSAttributedString alloc] initWithString:@"Last Name"
                                                                              attributes:@{NSForegroundColorAttributeName:contentColor}];
    NSAttributedString *emailPlaceHolder = [[NSAttributedString alloc] initWithString:@"Email"
                                                                           attributes:@{NSForegroundColorAttributeName:contentColor}];
    NSAttributedString *passwordPlaceHolder = [[NSAttributedString alloc] initWithString:@"Password"
                                                                              attributes:@{NSForegroundColorAttributeName:contentColor}];
    
    self.firstNameTextField = [[UITextField alloc] initWithFrame:textFieldRect];
    [self.firstNameTextField setAttributedText:firstNamePlaceHolder];
    [self.view addSubview:self.firstNameTextField];
    textFieldRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.firstNameTextField.frame.size.height - 1, self.firstNameTextField.frame.size.width, 0.5)];
    [lineView1 setBackgroundColor:contentColor];
    [self.firstNameTextField addSubview:lineView1];
    
    self.lastNameTextField = [[UITextField alloc] initWithFrame:textFieldRect];
    [self.lastNameTextField setAttributedText:lastNamePlaceHolder];
    [self.view addSubview:self.lastNameTextField];
    textFieldRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.lastNameTextField.frame.size.height - 1, self.lastNameTextField.frame.size.width, 0.5)];
    [lineView2 setBackgroundColor:contentColor];
    [self.firstNameTextField addSubview:lineView2];
    
    
    self.emailTextField = [[UITextField alloc] initWithFrame:textFieldRect];
    [self.emailTextField setAttributedText:emailPlaceHolder];
    [self.view addSubview:self.emailTextField];
    textFieldRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.emailTextField.frame.size.height - 1, self.emailTextField.frame.size.width, 0.5)];
    [lineView3 setBackgroundColor:contentColor];
    [self.firstNameTextField addSubview:lineView3];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:textFieldRect];
    [self.passwordTextField setAttributedText:passwordPlaceHolder];
    [self.view addSubview:self.passwordTextField];
    textFieldRect.origin.y += TEXT_FIELD_HEIGHT + PADDING;
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.passwordTextField.frame.size.height - 1, self.passwordTextField.frame.size.width, 0.5)];
    [lineView4 setBackgroundColor:contentColor];
    [self.firstNameTextField addSubview:lineView4];
    
    
}

@end
