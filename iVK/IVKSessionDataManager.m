//
//  IVKSessionDataManager.m
//  iVK
//
//  Created by Student on 7/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKSessionDataManager.h"

@implementation IVKSessionDataManager

+ (void) POSTRequestWithURL:(NSString *)url
                 parameters:(NSDictionary *)params
                    handler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableString *paramsString = [[NSMutableString alloc] init];
    for (NSString *key in [params allKeys]) {
        [paramsString appendFormat:@"%@=%@&", key, params[key]];
    }
    if (paramsString.length > 1) {
        [paramsString deleteCharactersInRange:NSMakeRange(paramsString.length - 1, 1)];
    }
    NSURL *string = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, paramsString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:string];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:handler];
    [task resume];
}

+ (void) GETRequestWithURL:(NSString *)url
                 parameters:(NSDictionary *)params
                    handler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableString *paramsString = [[NSMutableString alloc] init];
    for (NSString *key in [params allKeys]) {
        [paramsString appendFormat:@"%@=%@&", key, params[key]];
    }
    if (paramsString.length > 1) {
        [paramsString deleteCharactersInRange:NSMakeRange(paramsString.length - 1, 1)];
    }
    NSURL *string = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, paramsString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:string];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:handler];
    [task resume];
}



@end
