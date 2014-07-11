//
//  JobSeekersCollection.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/3/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jobseeker.h"

@interface JobSeekersCollection : NSObject{
    NSMutableDictionary *aDictionary;
}
-(void)addJobSeeker:(Jobseeker*)jobSeeker forJobseekerID:(IDentifer*)jobSeekerID;
-(Jobseeker*)getJobSeekerForJobSeekerID:(IDentifer*)jobSeekerID;
-(Jobseeker*)jobSeekerAtIndex:(NSUInteger)index;
@end
