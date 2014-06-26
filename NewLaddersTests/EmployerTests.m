//
//  EmployerTests.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/18/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "Employer.h"
#import "IJob.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import "IDentifer.h"
#import "IJobApplication.h"
#import "EmployerModel.h"
#import "JReqJobApplication.h"
#import "ATSJobApplication.h"
#import "Resume.h"
#import "Jobseeker.h"
#import "JSModel.h"
#import "JAModel.h"

@interface EmployerTests : XCTestCase

@end

@implementation EmployerTests{
    Employer *employer;
    id<IJob> job;
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *jobseekerID;
}

- (void)setUp {
    [super setUp];
    employer = [[Employer alloc]init];
    employer.employerID = [[IDentifer alloc]initWithString:@"333"];
    jobseekerID = [[IDentifer alloc]initWithString:@"777"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [JSModel sharedInstance].jobSeekerAppliedJobsMutableDict = nil;
    [JAModel sharedInstance].jobIDApplicationsMutableDict = nil;
    [JAModel sharedInstance].dayApplicationsMutableDict = nil;
//    NSLog(@"In tear down array size is:%d ",[[[[EmployerModel sharedInstance] employerJobMutableDict] objectForKey:employer.employerID] count] );
}

- (void)testpostJReqJobWithNameType{
    NSString *jobName = @"Test JReq Job";
    job = [[JreqJob alloc]init];
    
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]initWithEmployerID:employer.employerID AndName:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];

    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
                                    
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:tempJobMetaData];
    
    NSUInteger beforePostArrayCount = [[[[EmployerModel sharedInstance] employerJobMutableDict] getJobsPostedByEmployerWithID:employer.employerID] count];
    
    [employer postJobWithName:jobName withJobType:job];
    NSUInteger afterPostArrayCount = [[[[EmployerModel sharedInstance] employerJobMutableDict] getJobsPostedByEmployerWithID:employer.employerID] count];

    XCTAssertTrue( (afterPostArrayCount - beforePostArrayCount)==1, @"Should return True");
}

- (void)testpostATSJobWithNameType{
    NSString *jobName = @"Test ATS Job";
    job = [[ATSJob alloc]init];
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]initWithEmployerID:employer.employerID AndName:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName = [[JobIDName alloc]initWithJobID:[job generateJobID] AndName:jobName];
    job = [[JreqJob alloc]initWithIDName:jobIDName AndMetaData:tempJobMetaData];
    NSUInteger beforePostArrayCount = [[[[EmployerModel sharedInstance] employerJobMutableDict] getJobsPostedByEmployerWithID:employer.employerID] count];
    [employer postJobWithName:jobName withJobType:job];
    NSUInteger afterPostArrayCount = [[[[EmployerModel sharedInstance] employerJobMutableDict] getJobsPostedByEmployerWithID:employer.employerID] count];
    XCTAssertTrue( (afterPostArrayCount - beforePostArrayCount)==1, @"Should return True");
}

-(void)testSeePostedJobListing{
    PostedJobs *postedJobsArray = [employer seePostedJobListing];
    
    XCTAssert([postedJobsArray count]==2, @"Should return a MutableArrayWrap");
}

-(void)testSeeApplicationsForAjob{

    IDentifer *jobID = [[IDentifer alloc]initWithString:@"1345"];
    jobApplication = [[JReqJobApplication alloc]init];
    jobApplication.jobID = jobID;
    jobApplication.jobseekerID = jobseekerID;
    Resume *resume1 = [[Resume alloc]init];
    jobSeeker = [[Jobseeker alloc]init];
    jobSeeker.jobseekerID = jobseekerID = [[IDentifer alloc]initWithString:@"777"];
    [jobSeeker applyForJob: jobApplication WithResume:resume1];
    
    Resume *resume2 = [[Resume alloc]init];
    jobSeeker = [[Jobseeker alloc]init];
    jobSeeker.jobseekerID = jobseekerID = [[IDentifer alloc]initWithString:@"778"];
    [jobSeeker applyForJob: jobApplication WithResume:resume2];
    
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    jobApplication = [[ATSJobApplication alloc]init];
    jobApplication.jobID = jobID;
    jobApplication.jobseekerID = [[IDentifer alloc]initWithString:@"777"];
    [jobSeeker applyForJob:jobApplication WithResume:nil];
    
    
    JobApplications *tempArray = [employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"1345"]];
    XCTAssert([tempArray count]== 2, @"Should return a MutableArrayWrap");
    
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