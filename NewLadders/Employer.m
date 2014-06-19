//
//  Employer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Employer.h"
#import "JreqJob.h"
#import "ATSJob.h"

@implementation Employer 
//@synthesize employerID;

-(BOOL)postJReqJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
//    Parameters- Jobname, Job description will come from UI.
    [job setJobPosterID: self.employerID];
    [job setJobID:[job generateJobID]];
    [job setJobName:jobName];
    [job setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
//    Call method to save Job to DB, OR pass the object for validation
    BOOL dataBaseReturnStatus = true; //True if post successful.
    return dataBaseReturnStatus;
//    Error message is displayed to the user, if post fails.
}

-(BOOL)postATSJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
//    Parameters- Jobname, Job description will come from UI.
    
    [job setJobPosterID: self.employerID];
    [job setJobID:[job generateJobID]];
    [job setJobName:jobName];
    [job setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    //    Call method to save Job to DB, OR pass the object for validation
    BOOL dataBaseReturnStatus = true; //True if post successful.
    return dataBaseReturnStatus;
    //    Error message is displayed to the user, if post fails.
}

-(NSArray*)seePostedJobListing{
//    Fetch from DB, where postedByID== employerID
    NSArray *jobList = [NSArray new];
    
    return jobList;
//    return the array to UI
}

-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID{
//    Fetch from DB, job Apllication where jobID == jobID;
    NSArray *jobList = [NSArray new];
    
    return jobList;
//    Return the array to the UI to be displayed 
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
