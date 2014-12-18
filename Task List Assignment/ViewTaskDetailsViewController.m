//
//  ViewTaskDetailsViewController.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "ViewTaskDetailsViewController.h"

@interface ViewTaskDetailsViewController ()

@end

@implementation ViewTaskDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskLabel.text = self.task.taskName;
    self.completionStatusLabel.text = self.task.taskCompletionDescriptor;
    self.descriptionLabel.text = self.task.taskDescription;
    
    if ([self.task.taskDetailedNotes isEqualToString:@""])
    {
            self.detailsTextView.text = @"No Specific Details to Display";
    }
    else self.detailsTextView.text = self.task.taskDetailedNotes;
    
   
    NSDate *date = self.task.taskDateFull;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
    NSString *dateString = [formatter stringFromDate:date];
    
    self.dateLabel.text = dateString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[EditTaskDetailsViewController class]])
    {
        EditTaskDetailsViewController *nextView = segue.destinationViewController;
        nextView.task = self.task;
        nextView.delegate = self;
    }
}

-(void)didAddObject
{
    self.taskLabel.text = self.task.taskName;
    self.completionStatusLabel.text = self.task.taskCompletionDescriptor;
    self.descriptionLabel.text = self.task.taskDescription;
    
    if ([self.task.taskDetailedNotes isEqualToString:@""])
    {
        self.detailsTextView.text = @"No Specific Details to Display";
    }
    else self.detailsTextView.text = self.task.taskDetailedNotes;
    
    NSDate *date = self.task.taskDateFull;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
    NSString *dateString = [formatter stringFromDate:date];
    
    self.dateLabel.text = dateString;
    
    [self.delegate taskWasUpdated];
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
