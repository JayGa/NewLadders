//
//  Employer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Employer.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import "DM.h"
#import "ActorsModel.h"
#import "EmployerModel.h"

@implementation Employer
//@synthesize employerID;

-(BOOL)postJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
    
    job = [self setValueForJob:job WithJobName:jobName];
    [self checkAndInitDataModel];
    
    BOOL returnStatus1 = [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];
    [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];
    [[EmployerModel sharedInstance] postJob:job withEmployerID:self.employerID];
    return returnStatus1;
}


-(void)checkAndInitDataModel{
//
//    if([[DM sharedInstance] actorModel] == nil){
//        [DM sharedInstance].actorModel = [[ActorsModel alloc]init];
//        [[[DM sharedInstance] actorModel] setEmployerModel:[[EmployerModel alloc]init]];
//        [[[[DM sharedInstance] actorModel] employerModel]setEmployerJobMutableDict:[[NSMutableDictionary alloc]initWithCapacity:1]];
//
//        [[[DM sharedInstance] actorModel] setJSModel:[[JSModel alloc]init]];
//        [[[[DM sharedInstance] actorModel] jSModel]setJobSeekerSavedJobsMutableDict:[[NSMutableDictionary alloc]initWithCapacity:1]];
//        [[[[DM sharedInstance] actorModel] jSModel]setJobSeekerAppliedJobsMutableDict:[[NSMutableDictionary alloc]initWithCapacity:1]];
//    }
//    if([[DM sharedInstance]jAModel] == nil)
//    {
//        [[DM sharedInstance] setJAModel:[[JAModel alloc]init]];
//        [[[DM sharedInstance] jAModel]setJobIDApplicationsMutableDict:[[NSMutableDictionary alloc]init]];
//        [[[DM sharedInstance] jAModel] setDayApplicationsMutableDict:[[NSMutableDictionary alloc]init]];
//    }
//            NSLog(@"IN checkAndInitDataModel Model is:%@", [[DM sharedInstance]actorModel]);
}

-(id<IJob>)setValueForJob:(id<IJob>)job WithJobName:(NSString *)jobName{
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]init];
    [tempJobMetaData setJobPosterID:self.employerID];
    [tempJobMetaData setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    [job setJobID:[job generateJobID]];
    [job setJobName:jobName];
    [job setJobMetaData:tempJobMetaData];

    
    return job;
}
//-(BOOL)postATSJobWithName:(NSString *)jobName withJobType:(id<IJob>)job{
//    
//    [job setJobPosterID: self.employerID];
//    [job setJobID:[job generateJobID]];
//    [job setJobName:jobName];
//    [job setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
//    //    Call method to save Job to DB, OR pass the object for validation
//    BOOL dataBaseReturnStatus = true; //True if post successful.
//    return dataBaseReturnStatus;
//    //    Error message is displayed to the user, if post fails.
//}

-(NSArray*)seePostedJobListing{
    
    return [[EmployerModel sharedInstance] getPostedJobsForEmployerID:self.employerID];
//    return [[[[[DM sharedInstance] actorModel] employerModel] employerJobMutableDict]objectForKey:self.employerID];
}

-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID{
//    Fetch from DB, job Apllication where jobID == jobID;
    NSArray *jobList = [NSArray new];
    
    return jobList;
//    Return the array to the UI to be displayed 
}

-(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate{
//    Fetch from DB, where jobID == jobID and jobAppliedDate == jobApplicationDate ;
    NSArray *jobList = [NSArray new];
    return jobList;
}

-(NSArray*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate{
//  Fetch fromDB where jobPosterID== employerID and applicationDate == jobApplicationDate
    NSArray *jobList = [NSArray new];
    return jobList;
}

-(NSArray*)seeApplicationsForAjobByDate:(NSDate *)date ByJob:(id<IJob>)job{
    NSArray *jobList = [NSArray new];
    return jobList;
}
@end
