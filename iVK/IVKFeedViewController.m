//
//  IVKNewsViewController.m
//  iVK
//
//  Created by Student on 7/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKFeedViewController.h"


@implementation IVKFeedViewController 
-(void) viewDidLoad{
    [super viewDidLoad];
    self.feedItems = [[NSMutableArray alloc] init];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self getFeedItems];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
}

-(void)getFeedItems {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    [IVKSessionDataManager GETRequestWithURL:@"https://api.vk.com/method/wall.get" parameters:@{@"access_token" : token} handler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *feedItemsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *items = [feedItemsDictionary objectForKey:@"response"];
        
        for(int i = 1; i < [items count]; i++){
            NSDictionary *itemDict = items[i];
            IVKFeedItem *feedItem = [[IVKFeedItem alloc] initWithId:itemDict[@"id"] Date:itemDict[@"date"] PostType:itemDict[@"post_type"] Text:itemDict[@"text"]];
            [self.feedItems addObject:feedItem];
        }
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.feedItems count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __kindof UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"UITableViewCell"];
    }
    IVKFeedItem *item = self.feedItems[indexPath.row];
    [[cell textLabel] setText:[NSString stringWithFormat:@("Post type:%@, Text:%@"), [item postType], [item text]]];
    
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 20, 20)];
    [tempView setBackgroundColor:[UIColor blackColor]];
    [cell addSubview:tempView];
    
    
    return cell;
}

@end


