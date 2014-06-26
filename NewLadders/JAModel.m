//
//  JAModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JAModel.h"

static JAModel *sharedInstance;
@implementation JAModel
+(JAModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JAModel alloc] init];
    }
    return sharedInstance;
}

//-(BOOL)jobAppliation:(id<IJobApplication>)jobApplication WithJobID:(IDentifer *)jobID{
//    
//    return true;
//}
-(JobApplications*)getApplicationForJobID:(IDentifer *)jobID{
    
    return [self.jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
}
-(JobApplications*)getApplicationForDate:(JobApplicationDate *)jobApplicationDate{
    
    return [self.dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
}
@end
