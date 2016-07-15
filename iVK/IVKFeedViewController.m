//
//  IVKNewsViewController.m
//  iVK
//
//  Created by Student on 7/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKFeedViewController.h"
#import "User.h"
#import "Photo.h"
#import "PhotoAlbum.h"
#import "IVKSessionDataManager.h"
#import "IVKFeedItem.h"
#import "AppDelegate.h"
#import "NSManagedObjectContext+EasyAccess.h"


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
    [IVKSessionDataManager GETRequestWithURL:@"https://api.vk.com/method/newsfeed.get" parameters:@{@"access_token" : token} handler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *feedItemsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *items = [[feedItemsDictionary objectForKey:@"response"] objectForKey:@"items"];
        
        
        
        NSArray *profiles = [[feedItemsDictionary objectForKey:@"response"] objectForKey:@"profiles"];
        
        
        for (NSDictionary *itemDict in profiles){                                                               /*vinesti v peremennuy*/
            User *object = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[NSManagedObjectContext defaultContext]];
            object.id = itemDict[@"uid"];
            object.firstName = itemDict[@"first_name"];
            object.lastName = itemDict[@"last_name"];
        }
        
        
        
        
        for (NSDictionary *itemDict in items){
            IVKFeedItem *feedItem = [[IVKFeedItem alloc] initWithId:itemDict[@"id"] Date:itemDict[@"date"] PostType:itemDict[@"post_type"] Text:itemDict[@"text"]];
            [self.feedItems addObject:feedItem];
        }
        
        
        [[NSManagedObjectContext defaultContext] save:nil];
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
    
    return cell;
}

@end


