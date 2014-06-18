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

@interface Employer : NSObject{
}
@property IDentifer *employerID;
@property DisplayName *employerDisplayName;

-(BOOL)postJReqJobWithName:(NSString *)jobName withJobType:(id<IJob>)job;
-(BOOL)postATSJobWithName:(NSString *)jobName withJobType:(id<IJob>)job;
-(NSArray*)seePostedJobListing;
-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID;
-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
-(NSArray*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
-(NSArray*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
@end
