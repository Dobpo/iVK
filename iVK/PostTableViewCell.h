//
//  PostTableViewCell.h
//  iVK
//
//  Created by Student on 7/22/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoPost.h"
@import UIKit;

@interface PostTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *postImageView;
@property (nonatomic, retain) IBOutlet UILabel *textView;
@property (nonatomic, retain) PhotoPost *post;
@property (weak, nonatomic) IBOutlet UILabel *commentsCountLabel;

- (void)layoutSubviews;


@end
