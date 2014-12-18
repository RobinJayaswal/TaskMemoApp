//
//  TaskObject.h
//  Task List Assignment
//
//  Created by RobinJayaswal on 12/15/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NOT_COMPLETE @"Not Complete"
#define COMPLETE @"Complete"

@interface TaskObject : NSObject

@property (strong, nonatomic) NSString *taskName;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *taskCompletionDescriptor;
@property (strong, nonatomic) NSDate *taskDate;
@property (strong, nonatomic) NSDate *taskDateFull;
@property (strong, nonatomic) NSString *taskDetailedNotes;

@end
