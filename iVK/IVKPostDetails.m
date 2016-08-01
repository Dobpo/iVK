//
//  IVKPostDetails.m
//  iVK
//
//  Created by Student on 7/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKPostDetails.h"
#import "IVKSessionDataManager.h"

@implementation IVKPostDetails

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    [self getFeedItemComments];
}


-(void)getFeedItemComments {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    [IVKSessionDataManager GETRequestWithURL:@"https://api.vk.com/method/wall.getComments" parameters:@{@"access_token" : token, @"owner_id" : self.post.sourceId , @"post_id" : self.post.id} handler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSDictionary *feedItemCommentsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //NSArray *items = [[feedItemCommentsDictionary objectForKey:@"response"] objectForKey:@"items"];
        
    }];
}
@end
