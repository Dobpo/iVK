//
//  feedItem.h
//  iVK
//
//  Created by Alex on 7/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVKFeedItem : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *postType;
@property (nonatomic, strong) NSString *text;

-(instancetype)initWithId:(NSNumber *)id Date:(NSString *)date PostType:(NSString *)postType Text:(NSString *)text;

@end
