//
//  EmployerModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"
#import "IDentifer.h"
#import "JobsForEmployers.h"
#import "PostedJobs.h"
#import "JobApplications.h"

@interface EmployerModel : NSObject{
    NSString *testJay;
    JobsForEmployers *employerJobMutableDict;
}
+(EmployerModel*)sharedInstance;
-(void)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID;
-(PostedJobs*)getPostedJobsForEmployerID:(IDentifer *)employerID;
-(JobApplications*)getJobapplicationForJobsID:(IDentifer *)jobID;
-(PostedJobs*)jobsPostedByEmployerWithID:(IDentifer*)employerID;
-(NSUInteger)getNumberOfPostedJobsByEmployerWithId:(IDentifer*)employerID;
@end
