//
//  IVKPostDetails.m
//  iVK
//
//  Created by Student on 7/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "IVKPostDetails.h"

@implementation IVKPostDetails

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
}

@end
