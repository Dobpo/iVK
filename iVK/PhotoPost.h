//
//  PhotoPost.h
//  iVK
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@import UIKit;

@class Photo, User;

NS_ASSUME_NONNULL_BEGIN

@interface PhotoPost : NSManagedObject

@property (readonly) UIImage *image;

@end

NS_ASSUME_NONNULL_END

#import "PhotoPost+CoreDataProperties.h"
