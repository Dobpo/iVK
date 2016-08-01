//
//  IVKNewsViewController.h
//  iVK
//
//  Created by Student on 7/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@import UIKit;

@interface IVKFeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *feedItems;
@property (nonatomic, strong) UITableView *tableView;

@end
