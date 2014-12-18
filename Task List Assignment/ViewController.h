//
//  ViewController.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"
#import "AddTaskViewController.h"
#import "ViewTaskDetailsViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddTaskViewControllerDelegate, ViewTaskDetailsViewController>

@property (strong, nonatomic) NSMutableArray *arrayOfTasks;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)reorderButtonPressed:(UIBarButtonItem *)sender;

@end

