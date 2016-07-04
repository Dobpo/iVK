//
//  UIColor+CustomColors.m
//  iVK
//
//  Created by Student on 7/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor(CustomColors)
+ (UIColor *)myBlue {
    UIColor *color = [UIColor colorWithRed:225.0f/255.0f
                                                green:255.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:0.95];
    return color;
}

+(UIColor *)myLightBlue{
    UIColor *color = [UIColor colorWithRed:64.0f/255.0f
                                         green:113.0f/255.0f
                                          blue:152.0f/255.0f
                                         alpha:0.7];
    return color;
}
+(UIColor *)myWhite{
    UIColor *color = [UIColor colorWithRed:75.0f/255.0f
                                           green:120.0f/255.0f
                                            blue:156.0f/255.0f
                                           alpha:0.8];
    return color;
}
@end
