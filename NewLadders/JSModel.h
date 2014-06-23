//
//  JSModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJobApplication.h"
#import "IJob.h"

@interface JSModel : NSObject{
    
//    NSMutableDictionary *secondDict;
}

@property (strong, nonatomic) NSMutableDictionary *jobSeekerAppliedJobsMutableDict;
@property (strong, nonatomic) NSMutableDictionary *jobSeekerSavedJobsMutableDict;

+(JSModel*)sharedInstance;
-(BOOL)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(BOOL)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID;
-(NSMutableArray*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(NSMutableArray*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID;
@end
