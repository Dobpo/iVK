//
//  IVKSessionDataManager.h
//  iVK
//
//  Created by Student on 7/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVKSessionDataManager : NSObject
+ (void) POSTRequestWithURL:(NSString *)url
                 parameters:(NSDictionary *)params
                    handler:(void (^)(NSData *, NSURLResponse *, NSError *))handler;
@end
