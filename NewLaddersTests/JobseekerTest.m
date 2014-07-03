//
//  JobseekerTest.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Jobseeker.h"
#import "IJob.h"
#import "Resume.h"
#import "JReqJobApplication.h"
#import "ATSJobApplication.h"
#import "JReqJob.h"
#import "ATSJob.h"
#import "JobIDName.h"
#import "EmployerModel.h"
#import "JSModel.h"
#import "JAModel.h"
#import "Employer.h"
#import "JobSeekerIDName.h"
#import "DisplayName.h"

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    IDentifer *jobSeekerID;
    Employer *employer;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
    PostedJobs *postedJobs;
    SavedJobs *savedJobs;
    NSString *jobName;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    
    
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    resumeID = [[IDentifer alloc]initWithString:@"440"];
    resume = [[Resume alloc]initWithID:resumeID];
    Resumes *resumes = [[Resumes alloc]init];
    [resumes addResume:resume];
    DisplayName *jobSeekerdisplayName = [[DisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Ga"];
    JobSeekerIDName *jobSeekerIDName = [[JobSeekerIDName alloc]initWithID:jobSeekerID andName:jobSeekerdisplayName];
    jobSeeker = [[Jobseeker alloc]initWithID:jobSeekerIDName andResumeArray:resumes];
    employerID = [[IDentifer alloc]initWithString:@"333"];
    postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID];
    DisplayName *employerDisplayName = [[DisplayName alloc]initWithFirstName:@"Employer" andLastName:@"Jay"];
    employerID = [[IDentifer alloc]initWithString:@"333"];
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:employerDisplayName];
    
    NSString *jobName1 = @"Test JReq Job";
    JreqJob *job1 = [[JreqJob alloc]init];
    JobMetaData *tempJobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:[job1 generateJobID] AndName:jobName1];
    job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:tempJobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job1];
    
    NSString *jobName2 = @"Test ATS Job";
    ATSJob *job2 = [[ATSJob alloc]init];
    JobMetaData *tempJobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:[job2 generateJobID] AndName:jobName2];
    job2 = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:tempJobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job2];
    
    
    
    postedJobs = [[EmployerModel sharedInstance]jobsPostedByEmployerWithID:employerID];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    jobSeeker = nil;
    resumeID = nil;
    jobID = nil;
}


- (void) testSaveJReqJob{
    
//    NSString *jobName1 = @"Test JReq Job";
//    JreqJob *job1 = [[JreqJob alloc]init];
//    JobMetaData *tempJobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndName:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
//    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:[job1 generateJobID] AndName:jobName1];
//    job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:tempJobMetaData1];
//    
    NSUInteger beforeSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:0]];
    NSUInteger afterSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    XCTAssertTrue((afterSavedJobs-beforeSavedJobs==1), @"Should return count of 1");

}


- (void) testSaveATSJob{
    NSUInteger beforeSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:1]];
    NSUInteger afterSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    XCTAssertTrue((afterSavedJobs-beforeSavedJobs==1), @"Should return count of 1");}

- (void) testSeeSavedJobs{

    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
//    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"1345", @"2345", nil];

   XCTAssertTrue( [savedJobs count]== 2, @"Should return count of 2");
    
}

- (void)testApplyForJreqJob{
    jobID = [[IDentifer alloc]initWithString:@"1345"];

    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];

    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertTrue( (afterAppliedJobCount - beforeAppliedJobCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationCount - beforeJobApplicationCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount)==1, @"Should return True");
}

- (void)testApplyForATSJob{
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:nil];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertTrue( (afterAppliedJobCount - beforeAppliedJobCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationCount - beforeJobApplicationCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount)==1, @"Should return True");
}

- (void) testSeeAppliedJobs{
    JobApplications  *jobApplicationsArray = [jobSeeker seeAppliedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"2345", @"1345", nil];

    for(int i=0; i< [jobApplicationsArray count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [(id<IJobApplication>)[tempArray objectAtIndex:i]jobID]);
        XCTAssert([jobApplicationsArray count]==4, @"Should be True");
    }
}
@end

