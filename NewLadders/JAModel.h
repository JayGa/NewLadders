//
//  JAModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJobApplication.h"

#import "JobPostedDate.h"
#import "IDentifer.h"
#import "JobApplicationsForJobIDs.h"
#import "JobApplicationsForADay.h"
#import "JobApplications.h"

@interface JAModel : NSObject{
    
    JobApplicationsForJobIDs *jobIDApplicationsMutableDict;
    JobApplicationsForADay *dayApplicationsMutableDict;
}
-(IDentifer*)generateJReqJobID;
-(IDentifer*)generateATSJobID;
+(JAModel*)sharedInstance;
-(BOOL)jobApplication:(id<IJobApplication>)jobApplication WithJobID:(IDentifer *)jobID;
-(JobApplications*)getApplicationForJobID:(IDentifer *)jobID;
-(JobApplications*)getApplicationForDate:(JobApplicationDate *)jobApplicationDate;
-(void)updateModelWithJobApplication:(id<IJobApplication>)jobApplication withJobID:(IDentifer*)jobID;
-(NSUInteger)getNumberOfApplicationsByJobID:(IDentifer*)jobID;
-(NSUInteger)getNumberOfApplicationsAppllicationDate:(JobApplicationDate*)appliedDate;
-(JobApplications*)jobApplicationsForJobWithID:(IDentifer*)jobID;
-(JobApplications*)jobApplicationsForADay:(JobApplicationDate*)jobPostedDate;
-(NSString*)prepareJobAggregrateReport;
-(void)reset;
@end
