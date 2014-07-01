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

@implementation JobApplicationCoreFields

-(JobApplicationCoreFields*) initWithJobID:(IDentifer*)jobID andJobSeekerID:(IDentifer*)jobSeekerID{
    
    self = [super init];
    gjobID = jobID;
    gjobSeekerID = jobSeekerID;
    return self;
}
-(void)applyForJob:(id<IJobApplication>)jobApplication{
    
    [[JSModel sharedInstance]applyJob:jobApplication withJobseekerID:gjobSeekerID];
}

-(void)updateJobApplicationModel:(id<IJobApplication>)jobApplication
{
    [[JAModel sharedInstance]updateModelWithJobApplication:jobApplication withJobID:gjobID];

}

-(NSString*)appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString{
 
    return [reportString appendJobApplicationReportWithJobID:gjobID andJobseekerID:gjobSeekerID];
}
@end
