//
//  JobsModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/10/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobsModel.h"
static JobsModel *sharedInstance;
@implementation JobsModel


+(JobsModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JobsModel alloc]init];
    }
    return sharedInstance;
}

-(void)reset{
    postedJobsForJobID = nil;
}
-(id<IJob>)fetchJobWithID:(IDentifer*)jobID{
    return [postedJobsForJobID getPostedJobforJobID:jobID];
}

-(void)addJob:(id<IJob>)job withJobID:(IDentifer*)jobID{
    [postedJobsForJobID setPostedJobs:job forJobWithID:jobID];
}
@end
