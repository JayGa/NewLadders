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

-(void)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
//    job = [self setValueForJob:job WithJobName:jobName];
    [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];

}

//-(id<IJob>)setValueForJob:(id<IJob>)job WithJobName:(NSString *)jobName{
//
//    return job;
//}

-(PostedJobs*)seePostedJobListing{
    
    return [[EmployerModel sharedInstance] getPostedJobsForEmployerID:self.employerID];
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
@end
