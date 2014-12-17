//
//  MyTableViewCell.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/16/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *completionStatusLabel;

@end
