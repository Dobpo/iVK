//
//  IVKPostDetails.h
//  iVK
//
//  Created by Student on 7/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoPost.h"
@import UIKit;

@interface IVKPostDetails : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PhotoPost *post;

@end
