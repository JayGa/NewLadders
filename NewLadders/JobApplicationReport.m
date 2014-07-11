//
//  JobApplicationReport.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationReport.h"
#import "JAModel.h"
#import "EmployerModel.h"
#import "IJob.h"
#import "IJobApplication.h"

@implementation JobApplicationReport

-(JobApplications*)prepareDailyJobReport:(JobApplicationDate *)jobApplicationDateToReport{
    
    return [[JAModel sharedInstance]jobApplicationsForADay:jobApplicationDateToReport];
}

-(JobApplications*)prepareAggregrateReportByJob:(IDentifer*)jobID{
    
    return [[JAModel sharedInstance]jobApplicationsForJobWithID:jobID];
}

-(PostedJobs*)prepareAggregrateReportByEmployer:(IDentifer*)employerID {
    
    return [[EmployerModel sharedInstance]jobsPostedByEmployerWithID:employerID];
}

-(JobApplications*)prepareJobApplicationReportByEmployer:(IDentifer*)employerID{
    
//    JobApplications *jobApplicationArrayByEmployer = [[JobApplications alloc]init];
//    for(PostedJobs *jobList in [[[EmployerModel sharedInstance]employerJobMutableDict]getJobsPostedByEmployerWithID:employerID]){
//        NSLog(@"In prepareJobApplicationReportByEmployer 1st joblist is: %@", jobList);
//        
//        for (id<IJob>job in jobList) {
//            NSLog(@"In prepareJobApplicationReportByEmployer 2nd job is: %@", job);
//            id<IJobApplication>jobApplication = [[[JAModel sharedInstance]jobIDApplicationsMutableDict]objectForKey:job.jobIDName.jobID];
//            [jobApplicationArrayByEmployer addObject:jobApplication];
//        }
//    }
//    return jobApplicationArrayByEmployer;
    return NULL;
}
@end
