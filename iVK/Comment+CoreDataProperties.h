//
//  Comment+CoreDataProperties.h
//  iVK
//
//  Created by Student on 8/1/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *created;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) User *owner;
@property (nullable, nonatomic, retain) PhotoPost *post;

@end

NS_ASSUME_NONNULL_END
