//
//  PostTableViewCell.m
//  iVK
//
//  Created by Student on 7/22/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell {

}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.postImageView = [[UIImageView alloc] init];
    self.textView = [[UITextView alloc] init];
    
    
    UIImage *image = self.postImageView.image;
    self.postImageView.frame = CGRectMake(0, 0, self.frame.size.width, image.size.height);
    self.textView.frame = CGRectMake(0,
                                     CGRectGetMaxY(self.postImageView.frame),
                                     self.frame.size.width,
                                     self.frame.size.height - CGRectGetMaxY(self.postImageView.frame));
 
    [self addSubview:self.postImageView];
    [self addSubview:self.textView];
}


@end
