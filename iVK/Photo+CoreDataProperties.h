//
//  Photo+CoreDataProperties.h
//  iVK
//
//  Created by Student on 8/1/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *created;
@property (nullable, nonatomic, retain) NSString *filePath;
@property (nullable, nonatomic, retain) NSNumber *height;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSNumber *width;
@property (nullable, nonatomic, retain) PhotoAlbum *album;
@property (nullable, nonatomic, retain) PhotoAlbum *albumCover;
@property (nullable, nonatomic, retain) User *owner;
@property (nullable, nonatomic, retain) NSSet<PhotoPost *> *wasPostedIn;

@end

@interface Photo (CoreDataGeneratedAccessors)

- (void)addWasPostedInObject:(PhotoPost *)value;
- (void)removeWasPostedInObject:(PhotoPost *)value;
- (void)addWasPostedIn:(NSSet<PhotoPost *> *)values;
- (void)removeWasPostedIn:(NSSet<PhotoPost *> *)values;

@end

NS_ASSUME_NONNULL_END
