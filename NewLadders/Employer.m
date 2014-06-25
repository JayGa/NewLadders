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
#import "JobIDName.h"

@implementation Employer
//@synthesize employerID;

-(NSString*)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
    job = [self setValueForJob:job WithJobName:jobName];
    NSString *returnStatus = [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];
    return returnStatus;
}

-(id<IJob>)setValueForJob:(id<IJob>)job WithJobName:(NSString *)jobName{
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]init];
    [tempJobMetaData setJobPosterID:self.employerID];
    [tempJobMetaData setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]init];
    [jobIDName setJobID:[job generateJobID]];
    [jobIDName setJobName:jobName];
    [job setJobIDName:jobIDName];
    [job setJobMetaData:tempJobMetaData];
    return job;
}

-(MutableArrayWrap*)seePostedJobListing{
    
    return [[EmployerModel sharedInstance] getPostedJobsForEmployerID:self.employerID];
}

-(MutableArrayWrap*)seeApplicationsForAjob:(IDentifer *)jobID{
    return [[EmployerModel sharedInstance]getJobapplicationForJobsID:jobID];
//    Return the array to the UI to be displayed 
}

-(MutableArrayWrap*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate{
//    Fetch from DB, where jobID == jobID and jobAppliedDate == jobApplicationDate ;
    MutableArrayWrap *jobList = [MutableArrayWrap new];
    return jobList;
}

-(MutableArrayWrap*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate{
//  Fetch fromDB where jobPosterID== employerID and applicationDate == jobApplicationDate
    MutableArrayWrap *jobList = [MutableArrayWrap new];
    return jobList;
}

-(MutableArrayWrap*)seeApplicationsForAjobByDate:(NSDate *)date ByJob:(id<IJob>)job{
    MutableArrayWrap *jobList = [MutableArrayWrap new];
    return jobList;
}
@end
