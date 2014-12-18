//
//  ViewController.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "ViewController.h"
#import "TaskObject.h"
#import "TestTasks.h"
#import "ViewTaskDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arrayOfTasks = [[NSMutableArray alloc] init];
    
    NSArray *storedDictionaries = [[NSUserDefaults standardUserDefaults] arrayForKey:@"Array"];
    for (NSDictionary *dictionary in storedDictionaries)
    {
        TaskObject *task = [self retrivedTaskFromStoredDictionary:dictionary];
        [self.arrayOfTasks addObject:task];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //    for (NSDictionary *testTask in [TestTasks testTasks])
    //    {
    //        TaskObject *task = [[TaskObject alloc] init];
    //        task.taskName = testTask[TASK_NAME];
    //        task.taskDescription = testTask[TASK_DESCRIPTION];
    //
    //        [self.arrayOfTasks addObject:task];
    //    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prepare for Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]])
        {
            AddTaskViewController *nextView = segue.destinationViewController;
            nextView.delegate = self;
        }
    
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[ViewTaskDetailsViewController class]])
        {
            NSIndexPath *rowPressed = sender;
            ViewTaskDetailsViewController *nextView = segue.destinationViewController;
            nextView.task = [self.arrayOfTasks objectAtIndex:rowPressed.row];
            nextView.delegate = self;
        }
    }
}

#pragma mark - AddTaskViewControllerDelegate Methods

-(void)addTask:(TaskObject *)task
{
    [self.arrayOfTasks addObject:task];
    
    NSMutableArray *storedTasks = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"Array"] mutableCopy];
    if (!storedTasks) storedTasks = [[NSMutableArray alloc] init];
    [storedTasks addObject:[self prepareTaskForStorage:task]];
    [[NSUserDefaults standardUserDefaults] setObject:storedTasks forKey:@"Array"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ViewTaskDetailsViewControllerDelegate Methods

-(void)taskWasUpdated
{
    NSMutableArray *arrayToPersist = [[NSMutableArray alloc] init];
    for (TaskObject *tasks in self.arrayOfTasks)
    {
        [arrayToPersist addObject:[self prepareTaskForStorage:tasks]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:arrayToPersist forKey:@"Array"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}


#pragma mark - Preparing self.arrayOfTasks to be stored in NSUserDefaults, then unpackaged

-(NSDictionary *)prepareTaskForStorage:(TaskObject *)task
{
    
    NSDate *date = task.taskDateFull;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy-MM-dd h:mm a"];
    NSString *fullDateString = [formatter2 stringFromDate:date];
    
    NSDictionary *dictionary = @{@"Name" : task.taskName, @"Description" : task.taskDescription, @"Notes" : task.taskDetailedNotes, @"Date" : stringFromDate, @"Completion" : task.taskCompletionDescriptor, @"Full Date" : fullDateString};
    
    return dictionary;
}

-(TaskObject *)retrivedTaskFromStoredDictionary:(NSDictionary *)dictionary
{
    TaskObject *task = [[TaskObject alloc] init];
    task.taskName = dictionary[@"Name"];
    task.taskDetailedNotes = dictionary[@"Notes"];
    task.taskDescription = dictionary[@"Description"];
    
    NSString *stringFromDate = dictionary[@"Full Date"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
    NSDate *taskDate = [formatter dateFromString:stringFromDate];
    task.taskDate = taskDate;
    
    NSString *fullDateString = dictionary[@"Full Date"];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy-MM-dd h:mm a"];
    NSDate *fullTaskDate = [formatter2 dateFromString:fullDateString];
    task.taskDateFull = fullTaskDate;
    
    task.taskCompletionDescriptor = dictionary[@"Completion"];
    return task;
}


#pragma mark - TableView Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayOfTasks count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
        TaskObject *task = [self.arrayOfTasks objectAtIndex:indexPath.row];
        
        NSDate *date = task.taskDateFull;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
        NSString *stringFromDate = [formatter stringFromDate:date];
        
        
        UILabel *taskNameLabel = (UILabel *)[cell viewWithTag:100];
        taskNameLabel.text = task.taskName;
        UILabel *taskDescriptionLabel = (UILabel *)[cell viewWithTag:101];
        taskDescriptionLabel.text = task.taskDescription;
        UILabel *taskDateLabel = (UILabel *)[cell viewWithTag:102];
        taskDateLabel.text = stringFromDate;
        UILabel *taskCompletionStatusLabel = (UILabel *)[cell viewWithTag:103];
        taskCompletionStatusLabel.text = task.taskCompletionDescriptor;
        
        if ([task.taskCompletionDescriptor isEqualToString:COMPLETE])
        {
            cell.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:.6];
        }
        else if ([task.taskCompletionDescriptor isEqualToString:NOT_COMPLETE])
        {
            if ([task.taskDateFull timeIntervalSinceNow] < 0)
            {
            cell.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.6];
            }
            else cell.backgroundColor = [UIColor whiteColor];
        }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}


#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskObject *task = [self.arrayOfTasks objectAtIndex:indexPath.row];
    if ([task.taskCompletionDescriptor isEqualToString:@"Not Complete"])
    {
        task.taskCompletionDescriptor = @"Complete";
        [self.tableView reloadData];
    }
    else if ([task.taskCompletionDescriptor isEqualToString:@"Complete"])
    {
        task.taskCompletionDescriptor = @"Not Complete";
        [self.tableView reloadData];
    }
    NSMutableArray *updatedTasksArray = [[NSMutableArray alloc] init];
    for (TaskObject *tasks in self.arrayOfTasks)
    {
        [updatedTasksArray addObject:[self prepareTaskForStorage:tasks]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:updatedTasksArray forKey:@"Array"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        TaskObject *deletedTask = [self.arrayOfTasks objectAtIndex:indexPath.row];
        [self.arrayOfTasks removeObject:deletedTask];
        NSMutableArray *updatedArray = [[NSMutableArray alloc] init];
        for (TaskObject *tasks in self.arrayOfTasks)
        {
            [updatedArray addObject:[self prepareTaskForStorage:tasks]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:@"Array"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toViewTaskDetails" sender:indexPath];
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    TaskObject *taskObject = [self.arrayOfTasks objectAtIndex:sourceIndexPath.row];
    [self.arrayOfTasks removeObjectAtIndex:sourceIndexPath.row];
    [self.arrayOfTasks insertObject:taskObject atIndex:destinationIndexPath.row];
    
    NSMutableArray *arrayToPersist = [[NSMutableArray alloc] init];
    for (TaskObject *tasks in self.arrayOfTasks)
    {
        [arrayToPersist addObject:[self prepareTaskForStorage:tasks]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:arrayToPersist forKey:@"Array"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Buttons Pressed

- (IBAction)reorderButtonPressed:(UIBarButtonItem *)sender {
    if (self.tableView.editing == YES) [self.tableView setEditing:NO animated:YES];
    else [self.tableView setEditing:YES animated:YES];
}
@end
