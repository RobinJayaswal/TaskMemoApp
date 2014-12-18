//
//  EditTaskDetailsViewController.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "EditTaskDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface EditTaskDetailsViewController ()

@end

@implementation EditTaskDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailsTextView.layer.borderWidth = 2.0f;
    self.detailsTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.detailsTextView.text = self.task.taskDetailedNotes;
    self.detailsTextField.text = self.task.taskDescription;
    self.taskTextField.text = self.task.taskName;
    self.datePicker.date = self.task.taskDateFull;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneTypingButtonPressed:(UIButton *)sender {
    [self.detailsTextView resignFirstResponder];
}

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self userWishesToSaveEdits];
    [self.delegate didAddObject];
}
- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self.delegate didCancel];
}

-(void)userWishesToSaveEdits
{
    self.task.taskDetailedNotes = self.detailsTextView.text ;
    self.task.taskDescription = self.detailsTextField.text;
    self.task.taskName = self.taskTextField.text;
    self.task.taskDateFull = self.datePicker.date;
}
@end
