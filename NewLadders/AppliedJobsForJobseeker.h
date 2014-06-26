//
//  AppliedJobsForJobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppliedJobs.h"
#import "IDentifer.h"

@interface AppliedJobsForJobseeker : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (AppliedJobs*)getAppliedJobForJobseekerWithID:(IDentifer*)jobSeekerID;
- (void)setAppliedJobs:(AppliedJobs*)appliedJobs forJobseekerWithID:(IDentifer*)jobSeekerID;
//- (void)setValue:(id)value forKey:(NSString *)key;

@end
