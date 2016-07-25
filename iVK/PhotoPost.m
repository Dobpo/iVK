//
//  PhotoPost.m
//  iVK
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "PhotoPost.h"
#import "Photo.h"
#import "User.h"

@implementation PhotoPost

-(UIImage *) image{
    Photo *photo = [self.photos anyObject];
    return photo.image;
}

@end
