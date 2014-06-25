//
//  JSModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJobApplication.h"
#import "IJob.h"
#import "AppliedJobsForJobseeker.h"
#import "SavedJobsForJobseeker.h"
#import "SavedJobs.h"
#import "JobApplications.h"

@interface JSModel : NSObject{
    
//    MutableDictionaryWrap *secondDict;
}

@property (strong, nonatomic) AppliedJobsForJobseeker *jobSeekerAppliedJobsMutableDict;
@property (strong, nonatomic) SavedJobsForJobseeker *jobSeekerSavedJobsMutableDict;

+(JSModel*)sharedInstance;
-(NSString*)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(NSString*)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID;
-(SavedJobs*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(JobApplications*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID;
@end
