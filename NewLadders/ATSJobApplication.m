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

-(ATSJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume{
    
    if(jobApplicationCoreFields!= nil){
        
        self = [super init];
        gjobApplicationCoreFields = jobApplicationCoreFields;
        gJobAppliedDateResume = jobAppliedDateResume;
        
        return self;
    }
    return nil;
}



-(NSString*)appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString{
    
    NSString *appliedDateString = [gJobAppliedDateResume jobApplicationDateReport];
    return [gjobApplicationCoreFields appendJobApplicationReportRecordTo:reportString jobAppliedDate:appliedDateString];
}


-(void)callUpdateJobApplicationModel{
    [gjobApplicationCoreFields updateJobApplicationModel:self];
}
-(NSString*)prepareJobApplicationReport{
    return [gjobApplicationCoreFields prepareJobApplicationReportElements];
}
@end
