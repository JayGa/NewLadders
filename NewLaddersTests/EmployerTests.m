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
#import "DisplayName.h"
#import "JobApplicationCoreFields.h"
#import "Employer.h"
#import "IJob.h"
#import "IJobApplication.h"
#import "JobSeekerRepositiory.h"

@class Employer;
@class IDentifer;

@interface EmployerTests : XCTestCase

@end

@implementation EmployerTests{
    Employer *employer;
    id<IJob> job;
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *jobSeekerID;
    IDentifer *employerID;
}

- (void)setUp {
    [super setUp];
    
    [[JobSeekerRepositiory sharedInstance] initTheJobSeekerRepo];
    DisplayName *displayName = [[DisplayName alloc]initWithFirstName:@"Jay" andLastName:@"Ga"];
    employerID = [[IDentifer alloc]initWithString:@"333"];
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:displayName];
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJReqJobPosting{
    NSString *jobName = @"Test JReq Job";
    job = [[JreqJob alloc]init];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    [employer postJobWithName:jobName withJobType:job];
    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    XCTAssertTrue( (afterPostArrayCount - beforePostArrayCount)==1, @"Should return True");

}

- (void)testPostingJReqJobWithSameName{
    NSString *jobName = @"Test JReq Job";
    job = [[JreqJob alloc]init];
    JobMetaData *jobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:jobMetaData];
    NSUInteger beforePostArrayCount = [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    [employer postJobWithName:jobName withJobType:job];
    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    XCTAssertTrue( (afterPostArrayCount - beforePostArrayCount)==1, @"Should return True");

    

}

- (void)testATSJobPosting{
    NSString *jobName = @"Test ATS Job";
    job = [[ATSJob alloc]init];
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
    job = [[ATSJob alloc]initWithIDName:jobIDName AndMetaData:tempJobMetaData];
    NSUInteger beforePostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    [employer postJobWithName:jobName withJobType:job];
    NSUInteger afterPostArrayCount =  [[EmployerModel sharedInstance] getNumberOfPostedJobsByEmployerWithId:employerID];
    XCTAssertTrue( (afterPostArrayCount - beforePostArrayCount)==1, @"Should return a count of 1");
}

-(void)testPostedJobListing{
    
    NSString *jobName = @"Test JReq Job";
    job = [[JreqJob alloc]init];
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:tempJobMetaData];

    [employer postJobWithName:jobName withJobType:job];
    
    PostedJobs *postedJobsArray = [employer seePostedJobListing];
    
    XCTAssert([postedJobsArray count]==2, @"");
    [[EmployerModel sharedInstance]reset];
    
}

-(void)testSeeApplicationsForAjob{
    
    
    IDentifer *jobID = [[IDentifer alloc]initWithString:@"1345"];
    
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    jobSeekerID = [[IDentifer alloc]initWithString:@"778"];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithString:@"441"];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withOptionalResumeID:resumeID2];
    [jobApplicationCoreFields2 applyForJob:jobApplication withResumeID:resumeID2];
    
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:nil];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:NULL];
    
    
    JobApplications *returnedJobApplications = [employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"1345"]];
    XCTAssert([returnedJobApplications count]== 2, @"Should return a count of 2");
    
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