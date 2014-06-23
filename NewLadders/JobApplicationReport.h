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
#import "MutableArrayWrap.h"

@interface JobApplicationReport : NSObject   <IReport>{
    
    Jobseeker *jobseeker;
    id<IJob> job;
    Employer *employer;
    JobApplicationDate *jobApplicationDate;
}

-(MutableArrayWrap*)prepareDailyJobReport:(NSString *)jobPostedDateString;
-(MutableArrayWrap*)prepareAggregrateReportByJob:(IDentifer*)jobID;
-(MutableArrayWrap*)prepareAggregrateReportByEmployer:(IDentifer*)employerID;
-(MutableArrayWrap*)prepareJobApplicationReportByEmployer:(IDentifer*)employerID;
@end
