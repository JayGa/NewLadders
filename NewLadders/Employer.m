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
#import "JobsModel.h"

@implementation Employer
//@synthesize employerID;

-(Employer*)initWithEmployerID:(IDentifer*)employerID andDisplayName:(UserDisplayName*)displayName{
    self = [super init];
    gemployerID = employerID;
    gemployerDisplayName = displayName;
    
    return self;
}
-(void)postJobWithName:(JobDisplayName *)jobName withJobType:(id<IJob>)job andID:(IDentifer*)jobID{
    
    [[EmployerModel sharedInstance] postJob:job withEmployerID:gemployerID];
    [[JobsModel sharedInstance] addJob:job withJobID:jobID];
}

//-(id<IJob>)setValueForJob:(id<IJob>)job WithJobName:(NSString *)jobName{
//
//    return job;
//}

-(PostedJobs*)seePostedJobListing{
    
    return [[EmployerModel sharedInstance] getPostedJobsForEmployerID:gemployerID];
}

-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID{
    return [[EmployerModel sharedInstance]getJobapplicationForJobsID:jobID];
//    Return the array to the UI to be displayed 
}

-(JobApplications*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate{
//    Fetch from DB, where jobID == jobID and jobAppliedDate == jobApplicationDate ;
    JobApplications *jobList = [JobApplications new];
    return jobList;
}

-(JobApplications*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate{
//  Fetch fromDB where jobPosterID== employerID and applicationDate == jobApplicationDate
    JobApplications *jobList = [JobApplications new];
    return jobList;
}

-(JobApplications*)seeApplicationsForAjobByDate:(NSDate *)date ByJob:(id<IJob>)job{
    JobApplications *jobList = [JobApplications new];
    return jobList;
}

-(UserDisplayName*)appendJobDisplayName{
    return gemployerDisplayName;
}
@end
