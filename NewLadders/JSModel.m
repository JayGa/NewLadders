//
//  JSModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JSModel.h"
#import "IJobApplication.h"
#import "JAModel.h"
#import "IJob.h"
#import "JobApplications.h"

static JSModel *sharedInstance;


@implementation JSModel

+(JSModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JSModel alloc] init];
    }
    return sharedInstance;
}

-(void)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID{
    
//    NSLog(@"In saveJob BEFORE :%@",self.jobSeekerSavedJobsMutableDict);
    if (jobSeekerSavedJobsMutableDict== nil) {
        jobSeekerSavedJobsMutableDict = [[SavedJobsForJobseeker alloc] init];
    }

    SavedJobs *savedJobsArray;
    if([jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID] == nil){
        savedJobsArray = [[SavedJobs alloc]init];
        [jobSeekerSavedJobsMutableDict setSavedJobs:savedJobsArray forJobseekerWithID:jobseekerID];
    }
    
    savedJobsArray = [jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID];
    [savedJobsArray addASavedJob:job];
//    NSLog(@"In saveJob AFTER :%@", [self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID]);
//    return job.jobIDName.jobID;

}

-(void)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID{

    
    
        if(jobSeekerAppliedJobsMutableDict == nil){
            jobSeekerAppliedJobsMutableDict=[[AppliedJobsForJobseeker alloc]init];
        }
        JobApplications *jobApplications;
        if([jobSeekerAppliedJobsMutableDict getAppliedJobForJobseekerWithID:jobseekerID] == nil){
            jobApplications = [[JobApplications alloc]init];
            [jobSeekerAppliedJobsMutableDict setAppliedJobs:jobApplications forJobseekerWithID:jobseekerID];
        }
        
        jobApplications = [jobSeekerAppliedJobsMutableDict getAppliedJobForJobseekerWithID:jobseekerID];
        [jobApplications addJobApplication:jobApplication];
        //    NSLog(@"In applyJob1 AFTER :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);
    
    
    [jobApplication  callUpdateJobApplicationModel];

}


-(NSUInteger)getNumberOfSavedJobsForJobSeekerID:(IDentifer*)jobSeekerID{
    return [[jobSeekerAppliedJobsMutableDict getAppliedJobForJobseekerWithID:jobSeekerID]count];
}

-(NSUInteger)getNumberOfAppliedJobsForJobSeekerID:(IDentifer*)jobSeekerID{
    return [[jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobSeekerID]count];
}

-(SavedJobs*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID{
    NSLog(@"In getSavedJobsForJobseekerID :%@", [jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID]);
    return [jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID];
}

-(JobApplications*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID{
//    NSLog(@"In getAppliedJobsForJobseekerID :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);

    return [jobSeekerAppliedJobsMutableDict getAppliedJobForJobseekerWithID:jobseekerID];
}

@end
