//
//  ViewTaskDetailsViewController.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskObject.h"
#import "EditTaskDetailsViewController.h"

@protocol ViewTaskDetailsViewController <NSObject>

@required

-(void) taskWasUpdated;

@end

@interface ViewTaskDetailsViewController : UIViewController <EditTaskDetailsViewControllerDelegate>

@property (strong, nonatomic) id <ViewTaskDetailsViewController> delegate;

@property (strong, nonatomic) TaskObject *task;

@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *completionStatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;
@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;


@end
