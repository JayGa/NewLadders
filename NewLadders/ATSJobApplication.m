//
//  ATSJobApplication.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "ATSJobApplication.h"
#import "JobApplications.h"
#import "JAModel.h"

@implementation ATSJobApplication

-(ATSJobApplication*)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID{
    
    if(jobID!= nil && jobSeekerID!=nil){
        self = [super init];
        gjobSeekerID = jobSeekerID;
        gjobID = jobID;
        gresumeID = resumeID;
        return self;
    }
    return nil;
}
-(void)applyForJob{
    
}
-(void)updateJobApplicationModel
{
    //    NSLog(@"In applyJob2 BEFORE :%@" , [JAModel sharedInstance].jobIDApplicationsMutableDict );
    
    if([JAModel sharedInstance].jobIDApplicationsMutableDict == nil){
        [[JAModel sharedInstance] setJobIDApplicationsMutableDict:[[JobApplicationsForJobIDs alloc]init]];
    }
    JobApplications *jobApplications;
    if([[JAModel sharedInstance].jobIDApplicationsMutableDict getJobApplicationsForJobID: gjobID] == nil){
        jobApplications = [[JobApplications alloc]init];
        [[[JAModel sharedInstance] jobIDApplicationsMutableDict] setJobApplicatons:jobApplications forJobID:gjobID];
    }
    
    jobApplications = [[JAModel sharedInstance].jobIDApplicationsMutableDict getJobApplicationsForJobID:gjobID];
    [jobApplications addJobApplication:self];
    //    NSLog(@"In applyJob2 AFTER :%@", [JAModel sharedInstance].jobIDApplicationsMutableDict );
    
}

-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString{
    
    return [NSString stringWithFormat:@"%@%@, %@\n",reportString, gjobID, gjobSeekerID];
}
@end
