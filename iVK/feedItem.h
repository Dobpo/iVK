//
//  feedItem.h
//  iVK
//
//  Created by Alex on 7/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface feedItem : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger date;
@property (nonatomic,weak) NSString *postType;
@property (nonatomic,weak) NSString *text;


@end
