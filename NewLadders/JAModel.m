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
    
    return [jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
}
-(JobApplications*)getApplicationForDate:(JobApplicationDate *)jobApplicationDate{
    
    return [dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
}

-(void)updateModelWithJobApplication:(id<IJobApplication>)jobApplication withJobID:(IDentifer*)jobID
{
    
    if(jobIDApplicationsMutableDict == nil){
        jobIDApplicationsMutableDict = [[JobApplicationsForJobIDs alloc]init];
    }
    JobApplications *jobAppliations1 = [jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
    if([jobIDApplicationsMutableDict getJobApplicationsForJobID: jobID] == nil){
        jobAppliations1 = [[JobApplications alloc]init];
        [jobIDApplicationsMutableDict setJobApplicatons:jobAppliations1 forJobID:jobID];
        jobAppliations1 = [jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
    }
    
    [jobAppliations1 addJobApplication:jobApplication];
    //    NSLog(@"In applyJob2 AFTER :%@", [JAModel sharedInstance].jobIDApplicationsMutableDict );
    
    if(dayApplicationsMutableDict == nil){
        dayApplicationsMutableDict=[[JobApplicationsForADay alloc]init];
    }
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    JobApplications *jobApplications2 = [dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
    if([dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate] == nil){
        jobApplications2 = [[JobApplications alloc]init];
        [dayApplicationsMutableDict setJobApplications:jobApplications2 forJobApplicationDate:jobApplicationDate];
        jobApplications2 = [dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
    }
    
    [jobApplications2 addJobApplication:jobApplication];
}
-(NSUInteger)getNumberOfApplicationsByJobID:(IDentifer*)jobID{
    return [[jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID]count];

}
-(NSUInteger)getNumberOfApplicationsAppllicationDate:(JobApplicationDate*)appliedDate{
    return [[dayApplicationsMutableDict getJobApplicationsForDay:appliedDate]count];
}
-(JobApplications*)jobApplicationsForJobWithID:(IDentifer*)jobID{
    return [jobIDApplicationsMutableDict getJobApplicationsForJobID:jobID];
}
-(JobApplications*)jobApplicationsForADay:(JobApplicationDate*)jobApplicationDate{
    return [dayApplicationsMutableDict getJobApplicationsForDay:jobApplicationDate];
}
-(void)reset{
    jobIDApplicationsMutableDict = nil;
    dayApplicationsMutableDict = nil;
}
@end
