//
//  NSManagedObjectContext+EasyAccess.h
//  iVK
//
//  Created by Student on 7/15/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSManagedObjectContext (EasyAccess)

+(NSManagedObjectContext *) defaultContext;

@end
