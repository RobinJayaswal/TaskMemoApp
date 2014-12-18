//
//  EditTaskDetailsViewController.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskObject.h"

@protocol EditTaskDetailsViewControllerDelegate <NSObject>

@required

-(void) didCancel;
-(void) didAddObject;

@end

@interface EditTaskDetailsViewController : UIViewController

@property (weak, nonatomic) id <EditTaskDetailsViewControllerDelegate> delegate;

@property (strong, nonatomic) TaskObject *task;

@property (strong, nonatomic) IBOutlet UITextField *taskTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailsTextField;
@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)doneTypingButtonPressed:(UIButton *)sender;
- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender;


@end
