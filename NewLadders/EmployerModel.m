//
//  EmployerModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "EmployerModel.h"
#import "JAModel.h"
#import "JobsModel.h"

static EmployerModel *sharedInstance;

@implementation EmployerModel{
    NSString* gReportString;
}

+(EmployerModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[EmployerModel alloc] init];
    }
    return sharedInstance;
}

-(void)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID{
    
    if(employerJobMutableDict == nil){
        employerJobMutableDict=[[JobsForEmployers alloc]init];
    }
    PostedJobs *postedJobs = [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    if(postedJobs == nil){
        postedJobs = [[PostedJobs alloc]init];
        [employerJobMutableDict postJobs:postedJobs ByEmployerWithID:employerID];
        postedJobs = [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    }
    [postedJobs addPostedJob:job];

}

-(PostedJobs*)getPostedJobsForEmployerID:(IDentifer *)employerID{
    NSLog(@"In getPostedJobsForEmployerID job array is:%@", [employerJobMutableDict getJobsPostedByEmployerWithID:employerID]);
    return [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
}

-(JobApplications*)getJobapplicationForJobsID:(IDentifer *)jobID{
    return [[JAModel sharedInstance] getApplicationForJobID:jobID];
}

//-(MutableArrayWrap*)getPostedJobsForEmployerID:(IDentifer *)employerID{
//    return [[self employerJobMutableDict] objectForKey:employerID];
//}
-(PostedJobs*)jobsPostedByEmployerWithID:(IDentifer*)employerID{
    return [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
}

-(NSUInteger)getNumberOfPostedJobsByEmployerWithId:(IDentifer*)employerID{
    
    if([employerJobMutableDict getJobsPostedByEmployerWithID:employerID] == nil || [employerJobMutableDict getJobsPostedByEmployerWithID:employerID] == NULL){
        return 0;
    }
    return [[employerJobMutableDict getJobsPostedByEmployerWithID:employerID] count];
}

-(NSString*)prepareJobAggregrateReport{
    NSArray *employerIDArray = [employerJobMutableDict allEmployerIDs];
    NSString *reportString = @"";
    for (int i =0 ; i<[employerIDArray count]; i++) {
        
        IDentifer *employerID = [employerIDArray objectAtIndex:i];
        [self prepareEmplyerNameForEmployerID:employerID];
        reportString = [reportString stringByAppendingString:[NSString stringWithFormat:@"%@,%lu\n", gReportString,(unsigned long)[self getNumberOfPostedJobsByEmployerWithId:employerID]]];
    }
    return reportString;
}

-(void)prepareEmplyerNameForEmployerID:(IDentifer*)employerID{
    PostedJobs *postedJobs = [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    id<IJob> job;
    if([postedJobs count]>0){
        job = [postedJobs postedJobAtIndex:0];
    }
    [job callToAppendJobToEmployerAggregrateJobApplicationReport];
    
    gReportString = [[gReportString componentsSeparatedByString:@"-"]objectAtIndex:1];
}
-(void)appendToReportString:(NSString*)reportSubString{
    gReportString = @"";
    gReportString = [gReportString stringByAppendingString:reportSubString];
}

-(void)reset{
    employerJobMutableDict = nil;
    [[JobsModel sharedInstance]reset];
}
@end
