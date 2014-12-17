//
//  TestTasks.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/16/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TASK_NAME @"task name"
#define TASK_DATE @"task date"
#define TASK_DESCRIPTION @"task description"
#define TASK_COMPLETION_STATUS @"task completion status"

@interface TestTasks : NSObject

+(NSArray *)testTasks; //returns an array of dictionaries

@end
