//
//  PostTableViewCell.m
//  iVK
//
//  Created by Student on 7/22/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "PostTableViewCell.h"
#import "PhotoPost.h"
#import "Photo.h"

@implementation PostTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];

    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;
}


@end
