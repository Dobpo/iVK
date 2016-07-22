//
//  PostTableViewCell.h
//  iVK
//
//  Created by Student on 7/22/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface PostTableViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *postImageView;
@property (nonatomic, retain) UITextView *textView;

- (void)layoutSubviews;


@end
