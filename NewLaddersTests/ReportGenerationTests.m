//
//  ReportGenerationTests.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JobApplicationReport.h"
#import "IReport.h"
#import "CSVReportGenerator.h"
#import "HTMLReportGenerator.h"
#import "JobApplicationCoreFields.h"
#import "JReqJobApplication.h"
#import "IJobApplication.h"
#import "ATSJobApplication.h"

@interface ReportGenerationTests : XCTestCase
@end

@implementation ReportGenerationTests{
    
    JobApplicationReport *jobApplicationReport;
}

- (void)setUp {
    [super setUp];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPrepareDailyJobReport{
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    IDentifer *jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    JReqJobApplication *jreqJobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jreqJobApplication withResumeID:resumeID1];
    
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];

    jobSeekerID = [[IDentifer alloc]initWithInteger:778];
    resumeID1 = [[IDentifer alloc]initWithInteger:450];
    jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    jreqJobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jreqJobApplication withResumeID:resumeID1];
    
    
    jobID2 = [[IDentifer alloc]initWithInteger:246];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    

    NSString *jobPostedDateString = [self getTodayDateString];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    JobApplications *returnArray = [jobApplicationReport prepareDailyJobReport:[[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]]];
    
    XCTAssertEqual([returnArray count], 4, @"Should return array of jobs");
    
    
    CSVReportGenerator *cSVReportGenerator = [[CSVReportGenerator alloc]init];
    NSString *csvReportString = [cSVReportGenerator prepareReport:returnArray withTitle:jobPostedDateString];
    NSLog(@"CSV Report is:%@", csvReportString);
    HTMLReportGenerator *hTMLReportGenerator = [[HTMLReportGenerator alloc]init];
    NSString* hTMLReportString = [hTMLReportGenerator prepareReport:returnArray withTitle:jobPostedDateString];
    NSLog(@"HTML Report is:%@", hTMLReportString);
    
}

-(NSString *)getTodayDateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    JobPostedDate *jobPostedDate = [[JobPostedDate alloc]initByPostedDate:[NSDate date]];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobPostedDate];
}

- (void)testPrepareAggregrateReportByJob{
    
    IDentifer *jobID = [[IDentifer alloc]initWithInteger:1345];
    
    XCTAssert([[jobApplicationReport prepareAggregrateReportByJob:jobID] isKindOfClass:[JobApplications class]], @"Should return array of jobs");
}

- (void)testPrepareAggregrateReportByEmployer{
    
    IDentifer *employerID = [[IDentifer alloc]initWithInteger:333];
    
    JobApplications *listOfJobApplications = [jobApplicationReport prepareAggregrateReportByEmployer:employerID];
    
    XCTAssertTrue(false, @"Should return array of jobs");

}

- (void)testPrepareJobApplicationReportByEmployer{
    IDentifer *employerID = [[IDentifer alloc]initWithInteger:333];
//    [[jobApplicationReport prepareJobApplicationReportByEmployer:employerID] isKindOfClass:[MutableArrayWrap class]
    XCTAssertTrue(false, @"Should return array of jobs");
    
}

@end
