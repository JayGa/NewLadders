//
//  JSModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"
#import "AppliedJobsForJobseeker.h"
#import "SavedJobsForJobseeker.h"
#import "SavedJobs.h"
#import "IDentifer.h"
#import "JAModel.h"
#import "JobApplications.h"
#import "IJobApplication.h"

@interface JSModel : NSObject{
    AppliedJobsForJobseeker *jobSeekerAppliedJobsMutableDict;
    SavedJobsForJobseeker *jobSeekerSavedJobsMutableDict;
}

+(JSModel*)sharedInstance;
-(void)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(void)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID;
-(SavedJobs*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(JobApplications*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(NSUInteger)getNumberOfSavedJobsForJobSeekerID:(IDentifer*)jobSeekerID;
-(NSUInteger)getNumberOfAppliedJobsForJobSeekerID:(IDentifer*)jobSeekerID;
-(void)reset;
@end
