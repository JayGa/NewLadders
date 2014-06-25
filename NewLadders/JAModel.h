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

@interface JAModel : NSObject
+(JAModel*)sharedInstance;
@property JobApplicationsForJobIDs *jobIDApplicationsMutableDict;
@property JobApplicationsForADay *dayApplicationsMutableDict;
-(BOOL)jobAppliation:(id<IJobApplication>)jobApplication WithJobID:(IDentifer *)jobID;
-(JobApplications*)getApplicationForJobID:(IDentifer *)jobID;
-(JobApplications*)getApplicationForDate:(JobPostedDate *)jobPostedDate;
@end