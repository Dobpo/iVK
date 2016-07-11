//
//  feedItem.m
//  iVK
//
//  Created by Alex on 7/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKFeedItem.h"

@implementation IVKFeedItem

-(instancetype)initWithId:(NSNumber *)id Date:(NSString *)date PostType:(NSString *)postType Text:(NSString *)text{
    self = [super init];
    if(self)
    {
        self.id = id;
        self.date = date;
        self.postType = postType;
        self.text = text;
    }
    return self;
}

@end
