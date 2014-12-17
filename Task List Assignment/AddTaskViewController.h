//
//  AddTaskViewController.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskObject.h"

@protocol AddTaskViewControllerDelegate <NSObject>

@required

-(void)addTask:(TaskObject *)task;

@end

@interface AddTaskViewController : UIViewController <UITextFieldDelegate>

@property(weak, nonatomic) id <AddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UITextField *shortTextField;
@property (strong, nonatomic) IBOutlet UITextField *taskTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;


- (IBAction)addButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)doneTypingButtonPressed:(UIButton *)sender;

@end
