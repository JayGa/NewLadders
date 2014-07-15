//
//  JobApplicationCoreFields.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationCoreFields.h"
#import "JAModel.h"
#import "JSModel.h"
#import "JobSeekerRepositiory.h"
#import "IDentifer.h"
#import "JobsModel.h"
#import "JobApplicationDate.h"

@implementation JobApplicationCoreFields

-(JobApplicationCoreFields*) initWithJobID:(IDentifer*)jobID andJobSeekerID:(IDentifer*)jobSeekerID{
    
    self = [super init];
    gjobID = jobID;
    gjobSeekerID = jobSeekerID;
    return self;
}

-(void)applyForJob:(id<IJobApplication>)jobApplication withResumeID:(IDentifer*)resumeID{
    if ( [resumeID isEqual:[[IDentifer alloc]initWithInteger:0]] || [[JobSeekerRepositiory sharedInstance]verifyTheResumeWithID:resumeID belongsToJobSeekerWithID:gjobSeekerID]) {
        [[JSModel sharedInstance]applyJob:jobApplication withJobseekerID:gjobSeekerID];
    }
}

-(void)updateJobApplicationModel:(id<IJobApplication>)jobApplication{
    [[JAModel sharedInstance]updateModelWithJobApplication:jobApplication withJobID:gjobID];
}

-(NSString*)appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString jobAppliedDate:(NSString*)jobApplicationDateString{
    
#warning USE -
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
    return [reportString appendJobApplicationReportWithJobseeker:jobseeker job:job jobAppliedDate:jobApplicationDateString];
}

-(NSString*)prepareJobApplicationReportElements{
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    
    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
    
    return  [NSString stringWithFormat:@"%@,%@", [jobseeker getJobApplicationReportElements], [job appendJobApplicationReportElements]] ;
}
@end
