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
#import "IReportStringGenerator.h"

@implementation JReqJobApplication

-(JReqJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume{
    
    if(jobApplicationCoreFields!= nil && jobAppliedDateResume !=nil){
        
        self = [super init];
        gJobApplicationCoreFields = jobApplicationCoreFields;
        gJobAppliedDateResume = jobAppliedDateResume;

        return self;
    }
    return nil;
}

-(void)callToAppendJobSeekerToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    [gJobApplicationCoreFields callToAppendJobSeekerToJobApplicationReport:iReportGenerator];
    
}
-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    
    [gJobApplicationCoreFields callToAppendJobToJobApplicationReport:iReportGenerator];
}


-(void)callToAppendJobToJobAggregrateJobApplicationReport{
    [gJobApplicationCoreFields callToAppendJobToJobAggregrateJobApplicationReport];
}

-(void)callToAppendJobToEmployerAggregrateJobApplicationReport{
    [gJobApplicationCoreFields callToAppendJobToEmployerAggregrateJobApplicationReport];
}
-(void)callUpdateJobApplicationModel{
    
    [gJobApplicationCoreFields updateJobApplicationModel:self];
}

-(NSString*)prepareJobApplicationReport{
    return [gJobApplicationCoreFields prepareJobApplicationReportElements];
}
@end
