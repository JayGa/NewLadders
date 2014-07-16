//
//  JobsForEmployers.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "PostedJobs.h"

@class PostedJobs;
@interface JobsForEmployers : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (PostedJobs*)getJobsPostedByEmployerWithID:(IDentifer*)employerID;
- (void)postJobs:(PostedJobs*)postedJobs ByEmployerWithID:(IDentifer*)employerID;
//- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey;
- (void)setValue:(id)value forKey:(NSString *)key;
- (NSUInteger)numberOfEmployer;
-(NSArray*)allEmployerIDs;
@end
