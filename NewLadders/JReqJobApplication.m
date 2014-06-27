//
//  JReqJobApplication.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JReqJobApplication.h"
#import "JobApplications.h"
#import "JAModel.h"
#import "CSVReportString.h"
#import "HTMLReportString.h"

@implementation JReqJobApplication

-(id<IJobApplication>)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID{
    
    if(jobSeekerID!=nil && jobID!=nil && resumeID !=nil){
        
        self = [super init];
        gjobSeekerID = jobSeekerID;
        gjobID = jobID;
        if(resumeID!=nil){
            gresumeID = resumeID;
        }
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

    if([reportString isKindOfClass:[CSVReportString class]]){
        
        return [CSVReportString appedReportWith:@"%@%@, %@\n",reportString, gjobID, gjobSeekerID];
    }else {
        
        return [HTMLReportString appedReportWith:@"%@<tr><td>%@</td><td>%@</td></tr>",reportString, gjobID, gjobSeekerID];
    }
}


//-(CSVReportString*)appendJobApplicationReportRecordTo:(CSVReportString*)cSVReportString{
//    
//    return [CSVReportString appedReportWith:@"%@%@, %@\n",cSVReportString, jobID, jobseekerID];
//}
//
//-(HTMLReportString*)appendJobApplicationReportRecordTo:(HTMLReportString*)hTMLReportString{
//    
//    return [HTMLReportString appedReportWith:@"%@<tr><td>%@</td><td>%@</td></tr>",hTMLReportString, jobID, jobseekerID];
//}



@end
