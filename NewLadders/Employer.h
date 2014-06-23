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
#import "MutableArrayWrap.h"

@interface Employer : NSObject{

}
@property IDentifer *employerID;
@property DisplayName *employerDisplayName;
-(BOOL)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job;
-(MutableArrayWrap*)seePostedJobListing;
-(MutableArrayWrap*)seeApplicationsForAjob:(IDentifer *)jobID;
-(MutableArrayWrap*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
-(MutableArrayWrap*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
-(MutableArrayWrap*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
@end
