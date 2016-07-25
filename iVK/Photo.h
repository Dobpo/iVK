//
//  Photo.h
//  iVK
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@import UIKit;

@class PhotoAlbum, PhotoPost, User;

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSManagedObject

@property (readonly) UIImage *image;

@end

NS_ASSUME_NONNULL_END

#import "Photo+CoreDataProperties.h"
