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

-(NSMutableArray*)prepareDailyJobReport:(NSString *)jobPostedDateString{
    
    return [[[JAModel sharedInstance]dayApplicationsMutableDict] objectForKey:jobPostedDateString];
}

-(NSMutableArray*)prepareAggregrateReportByJob:(IDentifer*)jobID{
    
    return [[[JAModel sharedInstance]jobIDApplicationsMutableDict]objectForKey:jobID];
}

-(NSMutableArray*)prepareAggregrateReportByEmployer:(IDentifer*)employerID {
    
    return [[[EmployerModel sharedInstance]employerJobMutableDict]objectForKey:employerID];
}

-(NSMutableArray*)prepareJobApplicationReportByEmployer:(IDentifer*)employerID{
    
    NSMutableArray *jobApplicationArrayByEmployer = [[NSMutableArray alloc]init];
    for(NSMutableArray *jobList in [[[EmployerModel sharedInstance]employerJobMutableDict]objectForKey:employerID]){
        NSLog(@"In prepareJobApplicationReportByEmployer 1st joblist is: %@", jobList);
//        for (id<IJob>job in jobList) {
//            NSLog(@"In prepareJobApplicationReportByEmployer 2nd job is: %@", job);
//            id<IJobApplication>jobApplication = [[[JAModel sharedInstance]jobIDApplicationsMutableDict]objectForKey:job.jobID];
//            [jobApplicationArrayByEmployer addObject:jobApplication];
//        }
    }
    return jobApplicationArrayByEmployer;
}
@end
