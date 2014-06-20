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

@interface JAModel : NSObject
+(JAModel*)sharedInstance;
@property NSMutableDictionary *jobIDApplicationsMutableDict;
@property NSMutableDictionary *dayApplicationsMutableDict;
-(BOOL)jobAppliation:(id<IJobApplication>)jobApplication WithJobID:(IDentifer *)jobID;
-(NSMutableArray*)getApplicationForJobID:(IDentifer *)jobID;
-(NSMutableArray*)getApplicationForDate:(JobPostedDate *)jobPostedDate;
@end
