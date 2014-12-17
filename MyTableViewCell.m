//
//  MyTableViewCell.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/16/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

@synthesize taskLabel = _taskLabel;
@synthesize description = _description;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
