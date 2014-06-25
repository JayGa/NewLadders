//
//  Employers.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "DisplayName.h"
#import "JobApplicationDate.h"
#import "JobPostedDate.h"
#import "IJob.h"
#import "PostedJobs.h"
#import "JobApplications.h"
@interface Employer : NSObject{

}
@property IDentifer *employerID;
@property DisplayName *employerDisplayName;
-(NSString*)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job;
-(PostedJobs*)seePostedJobListing;
-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID;
-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
-(JobApplications*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
-(JobApplications*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
@end
