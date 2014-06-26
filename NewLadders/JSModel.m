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
@synthesize jobSeekerSavedJobsMutableDict;
@synthesize jobSeekerAppliedJobsMutableDict;

+(JSModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JSModel alloc] init];
    }
    return sharedInstance;
}

-(void)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID{
    
//    NSLog(@"In saveJob BEFORE :%@",self.jobSeekerSavedJobsMutableDict);
    if ([self jobSeekerSavedJobsMutableDict]== nil) {
        self.jobSeekerSavedJobsMutableDict = [[SavedJobsForJobseeker alloc] init];
    }

    SavedJobs *savedJobsArray;
    if([self.jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID] == nil){
        savedJobsArray = [[SavedJobs alloc]init];
        [ self.jobSeekerSavedJobsMutableDict setSavedJobs:savedJobsArray forJobseekerWithID:jobseekerID];
    }
    
    savedJobsArray = [self.jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID];
    [savedJobsArray addASavedJob:job];
//    NSLog(@"In saveJob AFTER :%@", [self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID]);
//    return job.jobIDName.jobID;

}

-(void)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID{

    
//    Method 1
    {
        //    NSLog(@"In applyJob1 BEFORE :%@" , [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);
        
        if(self.jobSeekerAppliedJobsMutableDict == nil){
            [self setJobSeekerAppliedJobsMutableDict:[[AppliedJobsForJobseeker alloc]init]];
        }
        JobApplications *jobApplications;
        if([[self jobSeekerAppliedJobsMutableDict] getAppliedJobForJobseekerWithID:jobseekerID] == nil){
            jobApplications = [[JobApplications alloc]init];
            [[self jobSeekerAppliedJobsMutableDict] setAppliedJobs:jobApplications forJobseekerWithID:jobseekerID];
        }
        
        jobApplications = [[self jobSeekerAppliedJobsMutableDict] getAppliedJobForJobseekerWithID:jobseekerID];
        [jobApplications addJobApplication:jobApplication];
        //    NSLog(@"In applyJob1 AFTER :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);
        
    }

    
//    Method 2
    [jobApplication  updateJobApplicationModel];

    
//    Method 3
    {
        //    NSLog(@"In applyJob3 BEFORE :%@" , [JAModel sharedInstance].dayApplicationsMutableDict);
        
        if([JAModel sharedInstance].dayApplicationsMutableDict == nil){
            [[JAModel sharedInstance] setDayApplicationsMutableDict:[[JobApplicationsForADay alloc]init]];
        }
        JobApplications *jobApplications;
        JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
        if([[JAModel sharedInstance].dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate] == nil){
            jobApplications = [[JobApplications alloc]init];
            [[[JAModel sharedInstance] dayApplicationsMutableDict] setJobApplications:jobApplications forJobApplicationDate:jobApplicationDate];
        }
        
        jobApplications = [[JAModel sharedInstance].dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
        [jobApplications addJobApplication:jobApplication];
        //    NSLog(@"In applyJob3 AFTER :%@", [JAModel sharedInstance].dayApplicationsMutableDict);
        
    }

//    return jobApplication.jobID;
}

-(SavedJobs*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID{
    NSLog(@"In getSavedJobsForJobseekerID :%@", [self.jobSeekerSavedJobsMutableDict getSavedJobsForJobseekerWithID:jobseekerID]);
    return [[self jobSeekerSavedJobsMutableDict] getSavedJobsForJobseekerWithID:jobseekerID];
}

-(JobApplications*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID{
//    NSLog(@"In getAppliedJobsForJobseekerID :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);

    return [[self jobSeekerAppliedJobsMutableDict] getAppliedJobForJobseekerWithID:jobseekerID];
}

@end
