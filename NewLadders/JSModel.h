//
//  JSModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"

@interface JSModel : NSObject
@property NSMutableDictionary *jobSeekerSavedJobsMutableDict;
@property NSMutableDictionary *jobSeekerAppliedJobsMutableDict;
+(JSModel*)sharedInstance;
-(void)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(void)applyJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(NSMutableArray*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(NSMutableArray*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID;
@end
