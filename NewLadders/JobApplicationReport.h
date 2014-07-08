//
//  JobApplicationReport.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReport.h"
#import "Jobseeker.h"
#import "IJob.h"
#import "Employer.h"
#import "JobApplicationDate.h"

@interface JobApplicationReport : NSObject   <IReport>{
    
    Jobseeker *jobseeker;
    id<IJob> job;
    Employer *employer;
    JobApplicationDate *jobApplicationDate;
}

-(JobApplications*)prepareDailyJobReport:(JobApplicationDate *)jobApplicationDate;
-(JobApplications*)prepareAggregrateReportByJob:(IDentifer*)jobID;
-(JobApplications*)prepareAggregrateReportByEmployer:(IDentifer*)employerID;
-(JobApplications*)prepareJobApplicationReportByEmployer:(IDentifer*)employerID;

@end
