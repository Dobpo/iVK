//
//  PhotoPost+CoreDataProperties.m
//  iVK
//
//  Created by Student on 8/1/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PhotoPost+CoreDataProperties.h"

@implementation PhotoPost (CoreDataProperties)

@dynamic created;
@dynamic id;
@dynamic text;
@dynamic type;
@dynamic comentsCount;
@dynamic likesCount;
@dynamic repostsCount;
@dynamic sourceId;
@dynamic owner;
@dynamic photos;
@dynamic comments;

@end
