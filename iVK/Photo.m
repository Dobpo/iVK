//
//  Photo.m
//  iVK
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "Photo.h"
#import "PhotoAlbum.h"
#import "PhotoPost.h"
#import "User.h"

@implementation Photo

- (UIImage*)image{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", self.filePath]];
    return [UIImage imageWithContentsOfFile:fullPath];
}

@end
