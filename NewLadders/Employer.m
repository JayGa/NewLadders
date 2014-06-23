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
#import "EmployerModel.h"

@implementation Employer
//@synthesize employerID;

-(BOOL)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
    job = [self setValueForJob:job WithJobName:jobName];
    BOOL returnStatus = [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];
    return returnStatus;
}

-(id<IJob>)setValueForJob:(id<IJob>)job WithJobName:(NSString *)jobName{
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]init];
    [tempJobMetaData setJobPosterID:self.employerID];
    [tempJobMetaData setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    [job setJobID:[job generateJobID]];
    [job setJobName:jobName];
    [job setJobMetaData:tempJobMetaData];
    return job;
}

-(NSArray*)seePostedJobListing{
    
    return [[EmployerModel sharedInstance] getPostedJobsForEmployerID:self.employerID];
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
