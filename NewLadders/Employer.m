//
//  Employer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Employer.h"
#import "IJob.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import "JobApplicationDate.h"

@implementation Employer 
//@synthesize employerID;

-(void)postJReqJobWithName:(NSString *)jobName{
    
//    Parameters- Jobname, Job description will come from UI.
    id<IJob> job = [JreqJob new];
    job.jobPosterID = _employerID;
    job.jobID = [job generateJobID];
    job.jobName = jobName;
    
//    Call method to save Job to DB
}

-(void)postATSJobWithName:(NSString *)jobName{
    id<IJob> job = [ATSJob new];
    job.jobID = [job generateJobID];
    job.jobName = jobName;
//    Call method to save Job to DB
}

-(NSArray*)seePostedJobListing{
//    Fetch from DB, where postedByID== employerID
    NSArray *jobList = [NSArray new];
    
    return jobList;
    
//    return the array to UI
}
-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID{
//    Fetch from DB, where jobID == jobID;
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate{
//    Fetch from DB, where jobID == jobID and jobAppliedDate == jobApplicationDate ;
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate{
//  Fetch fromDB where jobPosterID== employerID and applicationDate == jobApplicationDate
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjobByDate:(NSDate *)date ByJob:(id<IJob>)job{
    NSArray *jobList = [NSArray new];
    return jobList;
}
@end
