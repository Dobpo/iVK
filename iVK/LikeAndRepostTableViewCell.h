//
//  likeAndRepostTableViewCell.h
//  iVK
//
//  Created by Student on 8/5/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeAndRepostTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *likeLable;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIView *didLikeContainer;

@end
