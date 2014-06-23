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
#import "MutableDictionaryWrap.h"
#import "MutableArrayWrap.h"

@interface JSModel : NSObject{
    
//    MutableDictionaryWrap *secondDict;
}

@property (strong, nonatomic) MutableDictionaryWrap *jobSeekerAppliedJobsMutableDict;
@property (strong, nonatomic) MutableDictionaryWrap *jobSeekerSavedJobsMutableDict;

+(JSModel*)sharedInstance;
-(BOOL)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID;
-(BOOL)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID;
-(MutableArrayWrap*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID;
-(MutableArrayWrap*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID;
@end
