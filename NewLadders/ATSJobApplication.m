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

@implementation ATSJobApplication{
    NSString *gReportString;
}

-(ATSJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume{
    
    if(jobApplicationCoreFields!= nil){
        
        self = [super init];
        gjobApplicationCoreFields = jobApplicationCoreFields;
        gJobAppliedDateResume = jobAppliedDateResume;
        
        return self;
    }
    return nil;
}

-(void)callToAppendJobSeekerToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    [gjobApplicationCoreFields callToAppendJobToJobApplicationReport:self];
    [iReportGenerator appendToReportString:gReportString];
}

-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    [gjobApplicationCoreFields callToAppendJobToJobApplicationReport:self];
    [iReportGenerator appendToReportString:gReportString];
}

-(void)callToAppendJobAppDateToApplicationReportRecordTo:(id<IJobApplication>)jobApplication{
    
    
//    [gJobAppliedDateResume callToappendJobApplicationReportRecordTo:self];
//    [jobApplications appendToReportString:gReportString];
    
}

-(void)appendToReportString:(NSString*)reportSubString{
//    if(gReportString==nil){
        gReportString = @"";
//    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}

-(void)callToAppendJobToAggregrateJobApplicationReport{
    [gjobApplicationCoreFields callToAppendJobToJobApplicationReport:self];
    [[JAModel sharedInstance]appendToReportString:gReportString];
}


-(void)callUpdateJobApplicationModel{
    [gjobApplicationCoreFields updateJobApplicationModel:self];
}
-(NSString*)prepareJobApplicationReport{
    return [gjobApplicationCoreFields prepareJobApplicationReportElements];
}
@end
