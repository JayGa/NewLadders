//
//  EmployerModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "EmployerModel.h"
#import "JAModel.h"

static EmployerModel *sharedInstance;

@implementation EmployerModel
@synthesize employerJobMutableDict;

+(EmployerModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[EmployerModel alloc] init];
    }
    return sharedInstance;
}

-(void)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID{
    
    if(self.employerJobMutableDict == nil){
        [self setEmployerJobMutableDict:[[JobsForEmployers alloc]init]];
    }
    
    PostedJobs *tempArray;
    if([[self employerJobMutableDict] objectForKey:employerID] == nil){
        tempArray = [[PostedJobs alloc]init];
        [[self employerJobMutableDict] setObject:tempArray forKey:employerID];
    }
    
    tempArray = [[self employerJobMutableDict] objectForKey:employerID];
    [tempArray addObject:job];
}

-(PostedJobs*)getPostedJobsForEmployerID:(IDentifer *)employerID{
    return [[self employerJobMutableDict] objectForKey:employerID];
}

-(JobApplications*)getJobapplicationForJobsID:(IDentifer *)jobID{
    return [[JAModel sharedInstance] getApplicationForJobID:jobID];
}

//-(MutableArrayWrap*)getPostedJobsForEmployerID:(IDentifer *)employerID{
//    return [[self employerJobMutableDict] objectForKey:employerID];
//}

@end
