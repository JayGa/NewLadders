//
//  JobApplications.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJobApplication.h"

@interface JobApplications : NSObject{
 
    NSMutableArray *anArray;
}

- (void)addJobApplication:(id<IJobApplication>)jobApplication;
- (NSUInteger)count;
- (id<IJobApplication>)jobApplicationAtIndex:(NSUInteger)index;
- (NSUInteger)count;
@end
