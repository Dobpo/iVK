//
//  IVKSignInViewController.m
//  iVK
//
//  Created by Alex on 7/2/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKSignInViewController.h"

@implementation IVKSignInViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Sign In";
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    [backgroundView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backgroundView];
}
@end
