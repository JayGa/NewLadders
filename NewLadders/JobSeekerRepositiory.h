//
//  JobSeekerRepositiory.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/3/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobSeekersCollection.h"
#import "Jobseeker.h"

@interface JobSeekerRepositiory : NSObject{
    JobSeekersCollection *jobSeekersCollection;
}
+(JobSeekerRepositiory*)sharedInstance;
-(void)initTheJobSeekerRepo;
-(BOOL)verifyTheResumeWithID:(IDentifer*)resumeID belongsToJobSeekerWithID:(IDentifer*)jobSeekerID;
-(Jobseeker*)getJobSeekerAtIndex:(NSUInteger)index;
-(Jobseeker*)getJobSeekerWithID:(IDentifer*)jobSeekerID;
@end
