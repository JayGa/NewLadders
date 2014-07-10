//
//  EmployerTests.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/18/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "JreqJob.h"
#import "ATSJob.h"
#import "IDentifer.h"
#import "EmployerModel.h"
#import "JReqJobApplication.h"
#import "ATSJobApplication.h"
#import "Resume.h"
#import "Jobseeker.h"
#import "JSModel.h"
#import "JAModel.h"
#import "JobApplicationCoreFields.h"
#import "Employer.h"
#import "IJob.h"
#import "IJobApplication.h"
#import "JobSeekerRepositiory.h"
#import "JobIDGenerator.h"

@class Employer;
@class IDentifer;

@interface EmployerTests : XCTestCase

@end

@implementation EmployerTests{
    Employer *employer1;
    Employer *employer2;
    id<IJob> job;
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *jobSeekerID;
    IDentifer *employerID1;
    IDentifer *employerID2;
}

- (void)setUp {
    [super setUp];
    
    [[JobSeekerRepositiory sharedInstance] initTheJobSeekerRepo];
    
    UserDisplayName *displayName1 = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Ga"];
    employerID1 = [[IDentifer alloc]initWithInteger:333];
    employer1 = [[Employer alloc]initWithEmployerID:employerID1 andDisplayName:displayName1];
    
    UserDisplayName *displayName2 = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Ga"];
    employerID2 = [[IDentifer alloc]initWithInteger:334];
    employer2 = [[Employer alloc]initWithEmployerID:employerID2 andDisplayName:displayName2];
    
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJReqJobPostingByEmployer1{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test JReq Job-FIRST Jay"], @"");
}

- (void)testPostingJReqJobWithSameNameByEmployer1{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test JReq Job-FIRST Jay"], @"");
}

- (void)testATSJobPostingByEmployer1{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:139];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test ATS Job-FIRST Jay"], @"");
}


- (void)testJReqJobPostingByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Second"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test JReq Job-SECOND Jay"], @"");
    
}

- (void)testPostingJReqJobWithSameNameByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Second"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test JReq Job-SECOND Jay"], @"");

    
}

- (void)testATSJobPostingByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Second"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:139];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob getJobDisplayName]);
    XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test ATS Job-SECOND Jay"], @"");
    
}


-(void)testPostedJreqJobListing{
    
    [[EmployerModel sharedInstance]reset];
    
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];

    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job2" andPoster:jobPosterName];
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job3" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job4" andPoster:jobPosterName];
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    PostedJobs *postedJobsCollection = [employer1 seePostedJobListing];
    
    id<IJob> postedJob1 = [postedJobsCollection postedJobAtIndex:0];
    NSLog(@"Posted jobs are: %@", [postedJob1 getJobDisplayName]);
    XCTAssertTrue([[postedJob1 getJobDisplayName] isEqualToString: @"Test JReq Job1-FIRST Jay"], @"");

    id<IJob> postedJob2 = [postedJobsCollection postedJobAtIndex:1];
    NSLog(@"Posted jobs are: %@", [postedJob2 getJobDisplayName]);
    XCTAssertTrue([[postedJob2 getJobDisplayName] isEqualToString: @"Test JReq Job2-FIRST Jay"], @"");

    id<IJob> postedJob3 = [postedJobsCollection postedJobAtIndex:2];
    NSLog(@"Posted jobs are: %@", [postedJob3 getJobDisplayName]);
    XCTAssertTrue([[postedJob3 getJobDisplayName] isEqualToString: @"Test JReq Job3-FIRST Jay"], @"");
    
    id<IJob> postedJob4 = [postedJobsCollection postedJobAtIndex:3];
    NSLog(@"Posted jobs are: %@", [postedJob4 getJobDisplayName]);
    XCTAssertTrue([[postedJob4 getJobDisplayName] isEqualToString: @"Test JReq Job4-FIRST Jay"], @"");
    
    [[EmployerModel sharedInstance]reset];
    
}

-(void)testPostedATSJobListing{
    
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job2" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job3" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job4" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    PostedJobs *postedJobsArray = [employer1 seePostedJobListing];
    
    
    id<IJob> postedJob1 = [postedJobsArray postedJobAtIndex:0];
    NSLog(@"Posted jobs are: %@", [postedJob1 getJobDisplayName]);
    XCTAssertTrue([[postedJob1 getJobDisplayName] isEqualToString: @"Test ATS Job1-FIRST Jay"], @"");

    id<IJob> postedJob2 = [postedJobsArray postedJobAtIndex:1];
    NSLog(@"Posted jobs are: %@", [postedJob2 getJobDisplayName]);
    XCTAssertTrue([[postedJob2 getJobDisplayName] isEqualToString: @"Test ATS Job2-FIRST Jay"], @"");

    
    id<IJob> postedJob3 = [postedJobsArray postedJobAtIndex:2];
    NSLog(@"Posted jobs are: %@", [postedJob3 getJobDisplayName]);
    XCTAssertTrue([[postedJob3 getJobDisplayName] isEqualToString: @"Test ATS Job3-FIRST Jay"], @"");

    
    id<IJob> postedJob4 = [postedJobsArray postedJobAtIndex:3];
    NSLog(@"Posted jobs are: %@", [postedJob4 getJobDisplayName]);
    XCTAssertTrue([[postedJob4 getJobDisplayName] isEqualToString: @"Test ATS Job4-FIRST Jay"], @"");

    [[EmployerModel sharedInstance]reset];
    
}

-(void)testPostedATS_JreqJobListing{
    
    
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];

    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job];

    
    PostedJobs *postedJobsArray = [employer1 seePostedJobListing];
    
    for (int i = 0; i< [postedJobsArray count]; i++) {
        id<IJob> postedJob = [postedJobsArray postedJobAtIndex:i];
        NSLog(@"Posted jobs are: %@", [postedJob getJobDisplayName]);
        if(i%2==0){
            XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test ATS Job-FIRST Jay"], @"");
            
        }else{
            XCTAssertTrue([[postedJob getJobDisplayName] isEqualToString: @"Test JReq Job-FIRST Jay"], @"");
   
        }
    }
    [[EmployerModel sharedInstance]reset];
    
}


-(void)testSeeApplicationsForAjob{
    
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:1345];

    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:778];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:450];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withOptionalResumeID:resumeID2];
    [jobApplicationCoreFields2 applyForJob:jobApplication withResumeID:resumeID2];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:2345];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    
    
    JobApplications *returnedJobApplications = [employer1 seeApplicationsForAjob:[[IDentifer alloc]initWithInteger:1345]];
    
    for (int i = 0; i<[returnedJobApplications count]; i++) {
        id<IJobApplication> jobApplication = [returnedJobApplications jobApplicationAtIndex:i];
        
        XCTAssertEqual([jobApplication prepareJobApplicationReport], @"something here", @"");
    }
    
    
}

//-(void)testSeeApplicationsForAjobByDay{
//    -(MutableArrayWrap*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
//    XCTAssert([[employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"234"]ByDay:<#(JobApplicationDate *)#>] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
//    
//}
//
//-(void)test{
//    -(MutableArrayWrap*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
//    XCTAssert([[employer seePostedJobListing] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
//    
//}
//
//-(void)test{
//    -(MutableArrayWrap*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
//    XCTAssert([[employer seePostedJobListing] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
//    
//}


@end