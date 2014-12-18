//
//  AddTaskViewController.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "AddTaskViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailsTextView.layer.borderWidth = 2.0f;
    self.detailsTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.taskTextField.delegate = self;
    self.shortTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.taskTextField resignFirstResponder];
    [self.shortTextField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addButtonPressed:(UIButton *)sender {
    
//    NSDate *date = self.datePicker.date;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
//    NSString *stringFromDate = [formatter stringFromDate:date];
    
    
    TaskObject *addedTask = [[TaskObject alloc] init];
    addedTask.taskName = self.taskTextField.text;
    addedTask.taskDescription = self.shortTextField.text;
    addedTask.taskDetailedNotes = self.detailsTextView.text;
    addedTask.taskDate = self.datePicker.date;
    addedTask.taskDateFull = self.datePicker.date;
    
    
//    NSDate *date = self.datePicker.date;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *stringFromDate = [formatter stringFromDate:date];
//    
//    addedTask.taskDate = stringFromDate;
    addedTask.taskCompletionDescriptor = NOT_COMPLETE;
    
    [self.delegate addTask:addedTask];
    
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneTypingButtonPressed:(UIButton *)sender {
    [self.detailsTextView resignFirstResponder];
}
@end
