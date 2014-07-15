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

//@class Employer;
//@class IDentifer;
//@class JreqJob;
//@class ATSJob;
//@class IDentifer;
//@class EmployerModel;
//@class EmployerModel;
//@class JReqJobApplication;
//@class ATSJobApplication;
//@class Resume;
//@class Jobseeker;
//@class JSModel;
//@class JAModel;
//@class JobApplicationCoreFields;
//@class Employer;
//@class IJob;
//@class IJobApplication;
//@class JobSeekerRepositiory;
//@class JobIDGenerator;

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
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPFIRST Jay"], @"");
}

- (void)testPostingJReqJobWithSameNameByEmployer1{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPFIRST Jay"], @"");
}

- (void)testATSJobPostingByEmployer1{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:139];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID1];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID1];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test ATS Job-EMPFIRST Jay"], @"");
}


- (void)testJReqJobPostingByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPSecond"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPSECOND Jay"], @"");
    
}

- (void)testPostingJReqJobWithSameNameByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPSecond"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPSECOND Jay"], @"");

    
}

- (void)testATSJobPostingByEmployer2{
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPSecond"];

    IDentifer *jobID = [[IDentifer alloc]initWithInteger:139];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID2 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
//    NSUInteger beforePostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
    [employer2 postJobWithName:jobName withJobType:job andID:jobID];
//    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID2];
//    XCTAssertEqual(afterPostArrayCount - beforePostArrayCount, 1, @"");
    PostedJobs *postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID2];
    id<IJob> postedJob = [postedJobs postedJobAtIndex:0];
    NSLog(@"Posted job ATS job is: %@", [postedJob appendJobDisplayName]);
    XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test ATS Job-EMPSECOND Jay"], @"");
    
}


-(void)testPostedJreqJobListing{
    
    [[EmployerModel sharedInstance]reset];
    
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];

    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job2" andPoster:jobPosterName];
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job3" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job4" andPoster:jobPosterName];
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    PostedJobs *postedJobsCollection = [employer1 seePostedJobListing];
    
    id<IJob> postedJob1 = [postedJobsCollection postedJobAtIndex:0];
    NSLog(@"Posted jobs are: %@", [postedJob1 appendJobDisplayName]);
    XCTAssertTrue([[postedJob1 appendJobDisplayName] isEqualToString: @"Test JReq Job1-EMPFIRST Jay"], @"");

    id<IJob> postedJob2 = [postedJobsCollection postedJobAtIndex:1];
    NSLog(@"Posted jobs are: %@", [postedJob2 appendJobDisplayName]);
    XCTAssertTrue([[postedJob2 appendJobDisplayName] isEqualToString: @"Test JReq Job2-EMPFIRST Jay"], @"");

    id<IJob> postedJob3 = [postedJobsCollection postedJobAtIndex:2];
    NSLog(@"Posted jobs are: %@", [postedJob3 appendJobDisplayName]);
    XCTAssertTrue([[postedJob3 appendJobDisplayName] isEqualToString: @"Test JReq Job3-EMPFIRST Jay"], @"");
    
    id<IJob> postedJob4 = [postedJobsCollection postedJobAtIndex:3];
    NSLog(@"Posted jobs are: %@", [postedJob4 appendJobDisplayName]);
    XCTAssertTrue([[postedJob4 appendJobDisplayName] isEqualToString: @"Test JReq Job4-EMPFIRST Jay"], @"");
    
    [[EmployerModel sharedInstance]reset];
    
}

-(void)testPostedATSJobListing{
    
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job2" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job3" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job4" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    PostedJobs *postedJobsArray = [employer1 seePostedJobListing];
    
    
    id<IJob> postedJob1 = [postedJobsArray postedJobAtIndex:0];
    NSLog(@"Posted jobs are: %@", [postedJob1 appendJobDisplayName]);
    XCTAssertTrue([[postedJob1 appendJobDisplayName] isEqualToString: @"Test ATS Job1-EMPFIRST Jay"], @"");

    id<IJob> postedJob2 = [postedJobsArray postedJobAtIndex:1];
    NSLog(@"Posted jobs are: %@", [postedJob2 appendJobDisplayName]);
    XCTAssertTrue([[postedJob2 appendJobDisplayName] isEqualToString: @"Test ATS Job2-EMPFIRST Jay"], @"");

    
    id<IJob> postedJob3 = [postedJobsArray postedJobAtIndex:2];
    NSLog(@"Posted jobs are: %@", [postedJob3 appendJobDisplayName]);
    XCTAssertTrue([[postedJob3 appendJobDisplayName] isEqualToString: @"Test ATS Job3-EMPFIRST Jay"], @"");

    
    id<IJob> postedJob4 = [postedJobsArray postedJobAtIndex:3];
    NSLog(@"Posted jobs are: %@", [postedJob4 appendJobDisplayName]);
    XCTAssertTrue([[postedJob4 appendJobDisplayName] isEqualToString: @"Test ATS Job4-EMPFIRST Jay"], @"");

    [[EmployerModel sharedInstance]reset];
    
}

-(void)testPostedATS_JreqJobListing{
    
    
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    
    JobDisplayName *jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];
    
    jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];

    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    jobName = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    jobIDName = [[JobIDName alloc]initWithJobID:jobID AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    [employer1 postJobWithName:jobName withJobType:job andID:jobID];

    
    PostedJobs *postedJobsArray = [employer1 seePostedJobListing];
    
    for (int i = 0; i< [postedJobsArray count]; i++) {
        id<IJob> postedJob = [postedJobsArray postedJobAtIndex:i];
        NSLog(@"Posted jobs are: %@", [postedJob appendJobDisplayName]);
        if(i%2==0){
            XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test ATS Job-EMPFIRST Jay"], @"");
            
        }else{
            XCTAssertTrue([[postedJob appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPFIRST Jay"], @"");
   
        }
    }
    [[EmployerModel sharedInstance]reset];
    
}


-(void)testSeeApplicationsForAjob{
    
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
//    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer1 postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    
    
    
    
    
//    APPLYING FOR JOB
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:450];
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication withResumeID:resumeID2];
    
    
    
//    POSTING SECOND JOB
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
//    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID1 AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID2 AndName:jobName2];
    job = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer1 postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    
//    APPLY FOR TEH SECOND JOB
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    JobAppliedDateResume *jobAppliedDateResume3 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:[[IDentifer alloc]initWithInteger:0]];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withJobAppliedDateResumeID:jobAppliedDateResume3];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    
//    METHOD CALL
    JobApplications *returnedJobApplications = [employer1 seeApplicationsForAjob:[[IDentifer alloc]initWithInteger:135]];
    
//    TESTING
    id<IJobApplication> jobApplication1 = [returnedJobApplications jobApplicationAtIndex:0];
    NSLog(@"Applied jobs are:%@", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertTrue([[jobApplication1 prepareJobApplicationReport] isEqualToString: @"JSFIRST Jay,Test JReq Job1-EMPFIRST Jay"], @"");

    
    id<IJobApplication> jobApplication2 = [returnedJobApplications jobApplicationAtIndex:1];
    NSLog(@"Applied jobs are:%@", [jobApplication2 prepareJobApplicationReport]);
    XCTAssertTrue([[jobApplication2 prepareJobApplicationReport] isEqualToString:@"JSSECOND Jay,Test JReq Job1-EMPFIRST Jay"], @"");

    
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