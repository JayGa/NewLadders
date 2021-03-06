//
//  JobApplicationsForJobIDs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JobApplications;
@class IDentifer;
@interface JobApplicationsForJobIDs : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (JobApplications*)getJobApplicationsForJobID:(IDentifer*)jobID;
- (void)setJobApplicatons:(JobApplications*)jobApplications forJobID:(IDentifer*)jobID;
//- (void)setValue:(id)value forKey:(NSString *)key;
- (NSUInteger)count;
- (NSArray*)allJobIDs;
@end