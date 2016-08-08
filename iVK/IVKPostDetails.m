//
//  IVKPostDetails.m
//  iVK
//
//  Created by Student on 7/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKPostDetails.h"
#import "IVKSessionDataManager.h"
#import "NSManagedObjectContext+EasyAccess.h"
#import "Comment.h"
#import "PostTableViewCell.h"
#import "PhotoPost.h"
#import "Photo.h"
#import "UIImageView+AFNetworking.h"
#import "LikeAndRepostTableViewCell.h"
#import "CommentTableViewCell.h"

@import CoreData;


@implementation IVKPostDetails

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    [self.tableView setEstimatedRowHeight:100];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PostTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PostTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CommentTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LikeAndRepostTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LikeAndRepostTableViewCell"];

    [self.view addSubview:self.tableView];
    
    [self getFeedItemComments];
}


-(void)getFeedItemComments {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    [IVKSessionDataManager GETRequestWithURL:@"https://api.vk.com/method/wall.getComments" parameters:@{@"access_token" : token, @"owner_id" : self.post.sourceId , @"post_id" : self.post.id} handler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *feedItemCommentsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *items = [feedItemCommentsDictionary objectForKey:@"response"];
        
        NSTimeInterval timeInterval;
        
        if(error == nil){
            for (int i = 1; i < items.count ; i++){
                NSNumber *commentId = items[i][@"cid"];
                NSFetchRequest *commentFetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Comment"];
                commentFetchRequest.predicate = [NSPredicate predicateWithFormat:@"id == %@", commentId];
                [commentFetchRequest setFetchLimit:1];
                NSArray *commentFetchResult = [[NSManagedObjectContext defaultContext] executeFetchRequest:commentFetchRequest error:nil];
                Comment *comment = [commentFetchResult firstObject];
                
                if(comment == nil){
                    comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:[NSManagedObjectContext defaultContext]];
                    comment.post = self.post;
                    timeInterval = [items[i][@"date"] doubleValue];
                    comment.created = [NSDate dateWithTimeIntervalSince1970:timeInterval];
                    comment.text = items[i][@"text"];
                    comment.id = items[i][@"cid"];
                    
                    NSNumber *ownerId = items[i][@"uid"];
                    NSFetchRequest *userFetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
                    userFetchRequest.predicate = [NSPredicate predicateWithFormat:@"id == %@", ownerId];
                    [userFetchRequest setFetchLimit:1];
                    NSArray *userFetchResult = [[NSManagedObjectContext defaultContext] executeFetchRequest:userFetchRequest error:nil];
                    User *owner = [userFetchResult firstObject];
                    if(owner != nil){
                        comment.owner = owner;
                    }
                }
            }
        }
                [[NSManagedObjectContext defaultContext] save:nil];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.post.comentsCount integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostTableViewCell" forIndexPath:indexPath];
        PhotoPost *post = self.post;
        
        NSURL *url = [NSURL URLWithString:[[post.photos anyObject] url]];
        [cell.postImageView setImageWithURL:url];
        
        
        NSAttributedString *string =  [[NSAttributedString alloc] initWithData:[post.text dataUsingEncoding:NSUTF8StringEncoding]
                                                                       options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                 NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                            documentAttributes:nil error:nil];
        [cell.textView setAttributedText:string];
        [cell.commentsCountLabel setText:post.comentsCount.stringValue];
        
        [cell setNeedsLayout];
        return cell;
    }else if (indexPath.row == 1){
        LikeAndRepostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LikeAndRepostTableViewCell" forIndexPath:indexPath];
        return cell;
    }else{
        CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
        return cell;
    }
}

@end
