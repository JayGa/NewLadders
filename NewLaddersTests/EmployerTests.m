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
    job = [[JreqJob alloc]init];
    BOOL result = [employer postJobWithName:@"Test JReq Job" withJobType:job];
    XCTAssertTrue(result, @"Should return True");
}

- (void)testpostATSJobWithNameType{
    job = [[ATSJob alloc]init];
    BOOL result = [employer postJobWithName:@"Test ATS Job" withJobType:job];
    XCTAssertTrue(result, @"Should return True");
    
}

-(void)testSeePostedJobListing{
    
    XCTAssert([[employer seePostedJobListing] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
    
}


-(void)testSeeApplicationsForAjob{

    XCTAssert([[employer seeApplicationsForAjob:[[IDentifer alloc]initWithString:@"234"]] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
    
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