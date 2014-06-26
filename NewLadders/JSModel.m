//
//  JSModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JSModel.h"
#import "IJobApplication.h"
#import "JAModel.h"
#import "IJob.h"
#import "JobApplications.h"

static JSModel *sharedInstance;


@implementation JSModel
@synthesize jobSeekerSavedJobsMutableDict;
@synthesize jobSeekerAppliedJobsMutableDict;

+(JSModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JSModel alloc] init];
    }
    return sharedInstance;
}

-(void)saveJob:(id<IJob>)job withJobseekerID:(IDentifer *)jobseekerID{
    
//    NSLog(@"In saveJob BEFORE :%@",self.jobSeekerSavedJobsMutableDict);
    if ([self jobSeekerSavedJobsMutableDict]== nil) {
        self.jobSeekerSavedJobsMutableDict = [[SavedJobsForJobseeker alloc] init];
    }

    SavedJobs *tempArray;
    if([self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID] == nil){
        tempArray = [[SavedJobs alloc]init];
        [ self.jobSeekerSavedJobsMutableDict setObject:tempArray forKey:jobseekerID];
    }
    
    tempArray = [self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID];
    [tempArray addObject:job];
//    NSLog(@"In saveJob AFTER :%@", [self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID]);
//    return job.jobIDName.jobID;

}

-(void)applyJob:(id<IJobApplication>)jobApplication withJobseekerID:(IDentifer *)jobseekerID{

    
//    Method 1
    {
        //    NSLog(@"In applyJob1 BEFORE :%@" , [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);
        
        if(self.jobSeekerAppliedJobsMutableDict == nil){
            [self setJobSeekerAppliedJobsMutableDict:[[AppliedJobsForJobseeker alloc]init]];
        }
        JobApplications *tempArray;
        if([[self jobSeekerAppliedJobsMutableDict] objectForKey:jobseekerID] == nil){
            tempArray = [[JobApplications alloc]init];
            [[self jobSeekerAppliedJobsMutableDict] setObject:tempArray forKey:jobseekerID];
        }
        
        tempArray = [[self jobSeekerAppliedJobsMutableDict] objectForKey:jobseekerID];
        [tempArray addObject:jobApplication];
        //    NSLog(@"In applyJob1 AFTER :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);
        
    }

    
//    Method 2
    {
        //    NSLog(@"In applyJob2 BEFORE :%@" , [JAModel sharedInstance].jobIDApplicationsMutableDict );
        
        if([JAModel sharedInstance].jobIDApplicationsMutableDict == nil){
            [[JAModel sharedInstance] setJobIDApplicationsMutableDict:[[JobApplicationsForJobIDs alloc]init]];
        }
        JobApplications *tempArray2;
        if([[JAModel sharedInstance].jobIDApplicationsMutableDict objectForKey:jobApplication.jobID] == nil){
            tempArray2 = [[JobApplications alloc]init];
            [[[JAModel sharedInstance] jobIDApplicationsMutableDict] setObject:tempArray2 forKey:jobApplication.jobID];
        }
        
        tempArray2 = [[JAModel sharedInstance].jobIDApplicationsMutableDict objectForKey:jobApplication.jobID];
        [tempArray2 addObject:jobApplication];
        //    NSLog(@"In applyJob2 AFTER :%@", [JAModel sharedInstance].jobIDApplicationsMutableDict );
        
    }

    
//    Method 3
    {
        //    NSLog(@"In applyJob3 BEFORE :%@" , [JAModel sharedInstance].dayApplicationsMutableDict);
        
        if([JAModel sharedInstance].dayApplicationsMutableDict == nil){
            [[JAModel sharedInstance] setDayApplicationsMutableDict:[[JobApplicationsForADay alloc]init]];
        }
        JobApplications *tempArray3;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        JobPostedDate *jobPostedDate = [[JobPostedDate alloc]initByPostedDate:[NSDate date]];
        formatter.dateFormat = @"yyyyMMdd";
        NSString *jobPostedDateString = [formatter stringFromDate:jobPostedDate];
        if([[JAModel sharedInstance].dayApplicationsMutableDict objectForKey:jobPostedDateString] == nil){
            tempArray3 = [[JobApplications alloc]init];
            [[[JAModel sharedInstance] dayApplicationsMutableDict] setObject:tempArray3 forKey:jobPostedDateString];
        }
        
        tempArray3 = [[JAModel sharedInstance].dayApplicationsMutableDict objectForKey:jobPostedDateString];
        [tempArray3 addObject:jobApplication];
        //    NSLog(@"In applyJob3 AFTER :%@", [JAModel sharedInstance].dayApplicationsMutableDict);
        
    }

//    return jobApplication.jobID;
}

-(SavedJobs*)getSavedJobsForJobseekerID:(IDentifer *)jobseekerID{
    NSLog(@"In getSavedJobsForJobseekerID :%@", [self.jobSeekerSavedJobsMutableDict objectForKey:jobseekerID]);
    return [[self jobSeekerSavedJobsMutableDict] objectForKey:jobseekerID];
}

-(JobApplications*)getAppliedJobsForJobseekerID:(IDentifer *)jobseekerID{
//    NSLog(@"In getAppliedJobsForJobseekerID :%@", [self.jobSeekerAppliedJobsMutableDict objectForKey:jobseekerID]);

    return [[self jobSeekerAppliedJobsMutableDict] objectForKey:jobseekerID];
}

@end
