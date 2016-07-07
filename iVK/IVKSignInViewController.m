//
//  IVKSignInViewController.m
//  iVK
//
//  Created by Alex on 7/2/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKSignInViewController.h"
#import "UIColor+CustomColors.h"
#define PADDING 10
#define TEXT_FIELD_HEIGHT 30
#define BUTTON_WIDTH 100
#define FORGOT_PASSWORD_BUTTON_WIDTH 50

@implementation IVKSignInViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIColor *placeHolderColor = [UIColor myBlue];
    self.title = @"Sign In";
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    [backgroundView setBackgroundColor:[UIColor myLightBlue]];
    [self.view addSubview:backgroundView];
    
    CGRect textFieldsRect = CGRectMake(PADDING,0.0, (self.view.frame.size.width - PADDING * 2), TEXT_FIELD_HEIGHT);
    
    NSAttributedString *logginPlaceHolder = [[NSAttributedString alloc] initWithString:@"E-mail or phone" attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    NSAttributedString *passwordPlaceHolder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:placeHolderColor}];
    
    textFieldsRect.origin.y += PADDING;
    self.logginTextField = [[UITextField alloc] initWithFrame:textFieldsRect];
    [self.logginTextField setAttributedPlaceholder:logginPlaceHolder];
    [self.logginTextField   setTextColor:[UIColor whiteColor]];
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.logginTextField.frame.size.height - 1, self.logginTextField.frame.size.width, 0.5)];
    [lineView1 setBackgroundColor:placeHolderColor];
    [self.logginTextField addSubview:lineView1];
    [self.view addSubview:self.logginTextField];
    
    textFieldsRect.origin.y += PADDING + TEXT_FIELD_HEIGHT;
    self.passwordTextField = [[UITextField alloc] initWithFrame:textFieldsRect];
    [self.passwordTextField setAttributedPlaceholder:passwordPlaceHolder];
    [self.passwordTextField setTextColor:[UIColor whiteColor]];
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.passwordTextField.frame.size.height - 1, self.passwordTextField.frame.size.width, 0.5)];
    self.forgotPasswordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.forgotPasswordButton setTitle:@"forgot?" forState:UIControlStateNormal];
    [self.forgotPasswordButton  setTitleColor:placeHolderColor forState:UIControlStateNormal];
    //[self.forgotPasswordButton  setBackgroundColor:[UIColor greenColor]];
    [self.forgotPasswordButton addTarget:self action:@selector(showRestorePasswordView) forControlEvents:UIControlEventTouchUpInside];
    [self.forgotPasswordButton setFrame:CGRectMake(self.passwordTextField.frame.size.width - FORGOT_PASSWORD_BUTTON_WIDTH , 0, FORGOT_PASSWORD_BUTTON_WIDTH, TEXT_FIELD_HEIGHT)];
    [self.passwordTextField addSubview:self.forgotPasswordButton];
    
    [lineView2 setBackgroundColor:placeHolderColor];
    [self.passwordTextField addSubview:lineView2];
    [self.view addSubview:self.passwordTextField];
    
    textFieldsRect.origin.y += PADDING + TEXT_FIELD_HEIGHT;
    self.signInButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [self.signInButton setTitleColor:placeHolderColor forState:UIControlStateNormal];
    [self.signInButton setBackgroundColor:[UIColor myWhite]];
    [self.signInButton addTarget:self action:@selector(signIn) forControlEvents:UIControlEventTouchUpInside];
    [self.signInButton setFrame:CGRectMake((self.view.bounds.size.width - BUTTON_WIDTH)/2, textFieldsRect.origin.y + 10, BUTTON_WIDTH, TEXT_FIELD_HEIGHT)];
    [self.view addSubview:self.signInButton];
    

}

-(void) signIn{
}
-(void) showRestorePasswordView{
}
@end
