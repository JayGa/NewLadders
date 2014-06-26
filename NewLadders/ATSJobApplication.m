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
-(void)updateJobApplicationModel
{
    //    NSLog(@"In applyJob2 BEFORE :%@" , [JAModel sharedInstance].jobIDApplicationsMutableDict );
    
    if([JAModel sharedInstance].jobIDApplicationsMutableDict == nil){
        [[JAModel sharedInstance] setJobIDApplicationsMutableDict:[[JobApplicationsForJobIDs alloc]init]];
    }
    JobApplications *jobApplications;
    if([[JAModel sharedInstance].jobIDApplicationsMutableDict getJobApplicationsForJobID: jobID] == nil){
        jobApplications = [[JobApplications alloc]init];
        [[[JAModel sharedInstance] jobIDApplicationsMutableDict] setJobApplicatons:jobApplications forJobID:jobID];
    }
    
    jobApplications = [[JAModel sharedInstance].jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
    [jobApplications addJobApplication:self];
    //    NSLog(@"In applyJob2 AFTER :%@", [JAModel sharedInstance].jobIDApplicationsMutableDict );
    
}

-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString{
    
    return [NSString stringWithFormat:@"%@%@, %@\n",reportString, jobID, jobseekerID];
}
@end
