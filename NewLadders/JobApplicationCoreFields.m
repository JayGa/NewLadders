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

@implementation JobApplicationCoreFields{
    NSString *gReportString;
}

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


-(void)callToAppendJobSeekerToJobApplicationReport:(id<IJobApplication>)jobApplication{
    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
    [jobseeker callToAppendJobSeekerToJobApplicationReport:self];
    
    [jobApplication appendToReportString:gReportString];
}


-(void)callToAppendJobToJobApplicationReport:(id<IJobApplication>)jobApplication{
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    [job callToAppendJobToJobApplicationReport:self];
    
    [jobApplication appendToReportString:gReportString];
}

-(void)appendToReportString:(NSString*)reportSubString{
//    if(gReportString==nil){
        gReportString = @"";
//    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}

-(NSString*)prepareJobApplicationReportElements{
    gReportString = @"";
    Jobseeker *jobseeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerWithID:gjobSeekerID];
    [jobseeker callToAppendJobSeekerToJobApplicationReport:self];
    
    [gReportString stringByAppendingString:@","];
    id<IJob> job = [[JobsModel sharedInstance]fetchJobWithID:gjobID];
    [job callToAppendJobToJobApplicationReport:self];
    
    return gReportString;
}
@end
