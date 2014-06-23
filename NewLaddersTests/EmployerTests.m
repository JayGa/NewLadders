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

@interface EmployerTests : XCTestCase

@end

@implementation EmployerTests{
        Employer *employer;
        id<IJob> job;
    id<IJobApplication> jobApplication;
}

- (void)setUp {
    [super setUp];
    employer = [[Employer alloc]init];
    employer.employerID = [[IDentifer alloc]initWithString:@"333"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
//    NSLog(@"In tear down array size is:%d ",[[[[EmployerModel sharedInstance] employerJobMutableDict] objectForKey:employer.employerID] count] );
}

- (void)testpostJReqJobWithNameType{
    // This is an example of a functional test case.
    
    job = [[JreqJob alloc]init];
    BOOL result = [employer postJobWithName:@"Test JReq Job" withJobType:job];
    XCTAssertTrue(result, @"Should return True");
}

- (void)testpostATSJobWithNameType{
    // This is an example of a functional test case.
    
    job = [[ATSJob alloc]init];
    BOOL result = [employer postJobWithName:@"Test ATS Job" withJobType:job];
    XCTAssertTrue(result, @"Should return True");
    
}

-(void)testSeePostedJobListing{
    
    XCTAssert([[employer seePostedJobListing] isKindOfClass:[NSArray class]], @"Should return a NSArray");
    
}


-(void)testSeeApplicationsForAjob{

    XCTAssert([[employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"234"]] isKindOfClass:[NSArray class]], @"Should return a NSArray");
    
}

//-(void)testSeeApplicationsForAjobByDay{
//    -(NSArray*)seeApplicationsForAjob:(IDentifer *)jobID ByDay:(JobApplicationDate*)jobApplicationDate;
//    XCTAssert([[employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"234"]ByDay:<#(JobApplicationDate *)#>] isKindOfClass:[NSArray class]], @"Should return a NSArray");
//    
//}
//
//-(void)test{
//    -(NSArray*)seeApplicationsForAjobByApplicationDate:(JobApplicationDate*)jobApplicationDate;
//    XCTAssert([[employer seePostedJobListing] isKindOfClass:[NSArray class]], @"Should return a NSArray");
//    
//}
//
//-(void)test{
//    -(NSArray*)seeApplicationsForAjobByDate:(JobPostedDate*)date ByJob:(id<IJob>)job;
//    XCTAssert([[employer seePostedJobListing] isKindOfClass:[NSArray class]], @"Should return a NSArray");
//    
//}


@end