//
//  SavedJobsForJobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

@class SavedJobs;
@class IDentifer;
#import <Foundation/Foundation.h>

@interface SavedJobsForJobseeker : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (SavedJobs*)getSavedJobsForJobseekerWithID:(IDentifer*)jobseekerID;
- (void)setSavedJobs:(SavedJobs*)savedJobs forJobseekerWithID:(IDentifer *)jobseekerID;
//- (void)setValue:(id)value forKey:(NSString *)key;
- (NSUInteger)count;
@end
