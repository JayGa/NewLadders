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

-(void)callToAppendJobSeekerToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
    [jobseeker callToAppendJobSeekerToJobApplicationReport:iReportGenerator];

}


-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    [job callToAppendJobToJobApplicationReport:iReportGenerator];
    
}
-(void)callToAppendJobToJobAggregrateJobApplicationReport{
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    [job callToAppendJobToJobAggregrateJobApplicationReport];
}

-(void)callToAppendJobToEmployerAggregrateJobApplicationReport{
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    [job callToAppendJobToEmployerAggregrateJobApplicationReport];
}

//-(NSString*)prepareJobApplicationReportElements{
//    gReportString = @"";
//    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
//    [jobseeker callToAppendJobSeekerToJobApplicationReport:self];
//    
//    [gReportString stringByAppendingString:@","];
//    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
//    [job callToAppendJobToJobApplicationReport:self];
//    
//    return gReportString;
//}
@end
