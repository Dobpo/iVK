//
//  IVKNewsViewController.m
//  iVK
//
//  Created by Student on 7/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKNewsViewController.h"


@implementation IVKNewsViewController
-(void) viewDidLoad{
    [super viewDidLoad];
    
    [self tryToGetNews];
}

-(void)tryToGetNews {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    [IVKSessionDataManager GETRequestWithURL:@"https://api.vk.com/method/wall.get" parameters:@{@"access_token" : token} handler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        id o = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    }];
}

@end


