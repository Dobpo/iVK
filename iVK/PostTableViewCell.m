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

@implementation PostTableViewCell {

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    if(self.postImageView == nil){
    self.textView = [[UITextView alloc] init];
    self.postImageView = [[UIImageView alloc] init];
    [self addSubview:self.postImageView];
    [self addSubview:self.textView];
    }
    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.postImageView.image = self.post.image;
    self.textView.text = self.post.text;
    
    /*UIImage *image = self.postImageView.image;
    self.postImageView.frame = CGRectMake(0, 0, self.frame.size.width, image.size.height);
    self.textView.frame = CGRectMake(0,
                                     CGRectGetMaxY(self.postImageView.frame),
                                     self.frame.size.width,
                                     self.frame.size.height - CGRectGetMaxY(self.postImageView.frame));*/
 

}


@end
