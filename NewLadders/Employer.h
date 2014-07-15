//
//  Employers.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "JobApplicationDate.h"
#import "JobPostedDate.h"
#import "IJob.h"
#import "PostedJobs.h"
#import "JobApplications.h"
#import "UserDisplayName.h"

@interface Employer : NSObject{

    IDentifer *gemployerID;
    UserDisplayName *gemployerDisplayName;
}
-(Employer*)initWithEmployerID:(IDentifer*)employerID andDisplayName:(UserDisplayName*)displayName;
-(void)postJobWithName:(JobDisplayName *)jobName withJobType:(id<IJob>)job andID:(IDentifer*)jobID;
-(PostedJobs*)seePostedJobListing;
-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID;
-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
-(JobApplications*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
-(JobApplications*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
-(UserDisplayName*)appendJobDisplayName;

@end
