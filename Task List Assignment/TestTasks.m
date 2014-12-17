//
//  TestTasks.m
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/16/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "TestTasks.h"

@implementation TestTasks

+(NSArray *)testTasks
{
    NSDictionary *task1 = @{TASK_NAME : @"Do the laundry", TASK_DESCRIPTION : @"wash shit", TASK_DATE : @"088", TASK_COMPLETION_STATUS : @"NO"};
    NSDictionary *task2 = @{TASK_NAME : @"Do the mail", TASK_DESCRIPTION : @"mail shit", TASK_DATE : @"08", TASK_COMPLETION_STATUS : @"YES"};
    
    NSArray *testTasks = [[NSArray alloc] initWithObjects:task1, task2, nil];
    return testTasks;
}

@end
