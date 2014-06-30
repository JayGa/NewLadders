//
//  AppliedJobsForJobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobApplications.h"
#import "IDentifer.h"

@interface AppliedJobsForJobseeker : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (JobApplications*)getAppliedJobForJobseekerWithID:(IDentifer*)jobSeekerID;

- (void)setAppliedJobs:(JobApplications*)jobApplications forJobseekerWithID:(IDentifer*)jobSeekerID;
//- (void)setValue:(id)value forKey:(NSString *)key;
- (NSUInteger)count;
@end
