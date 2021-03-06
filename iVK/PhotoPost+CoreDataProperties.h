//
//  PhotoPost+CoreDataProperties.h
//  iVK
//
//  Created by Student on 8/1/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PhotoPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *created;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSNumber *comentsCount;
@property (nullable, nonatomic, retain) NSNumber *likesCount;
@property (nullable, nonatomic, retain) NSNumber *repostsCount;
@property (nullable, nonatomic, retain) NSString *sourceId;
@property (nullable, nonatomic, retain) User *owner;
@property (nullable, nonatomic, retain) NSSet<Photo *> *photos;
@property (nullable, nonatomic, retain) NSSet<Comment *> *comments;

@end

@interface PhotoPost (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet<Photo *> *)values;
- (void)removePhotos:(NSSet<Photo *> *)values;
- (void)addComments:(NSSet<Comment *> *)values;
- (void)removeComments:(NSSet<Comment *> *)values;

@end

NS_ASSUME_NONNULL_END
