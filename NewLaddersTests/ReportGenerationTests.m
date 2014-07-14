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
#import "EmployerModel.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import"Jobseeker.h"
#import "JobSeekerRepositiory.h"
#import "JAModel.h"
#import "JSModel.h"
#import "JobApplicationDate.h"

@interface ReportGenerationTests : XCTestCase
@end

@implementation ReportGenerationTests{
    
    JobApplicationReport *jobApplicationReport;
    id<IJob> job;
    Jobseeker *jobSeeker;
    Employer *employer;
    IDentifer *employerID;
}

- (void)setUp {
    [super setUp];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    
    [[JobSeekerRepositiory sharedInstance]initTheJobSeekerRepo];
    


    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPrepareDailyJobReport{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    employerID = [[IDentifer alloc]initWithInteger:333];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:jobPosterName];
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];//DIFFERENT JOB
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    job = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    //    APPLYING FOR JOB
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    
    NSString *jobPostedDateString = [self getTodayDateString];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    JobApplications *jobApplications = [jobApplicationReport prepareDailyJobReport:[[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]]];
    CSVReportGenerator *cSVReportGenerator = [[CSVReportGenerator alloc]init];
    NSString *csvReportString = [cSVReportGenerator prepareReport:jobApplications withTitle:jobPostedDateString];
    NSLog(@"CSV Report is:%@", csvReportString);
//    XCTAssertTrue([csvReportString isEqualToString:@"Job Application Report,20140714\nJOB SEEKER, JOB DETAILS, APP DATE\nJSFIRST Jay, Test JReq Job-EMPFIRST Jay, 14Jul2014"],@"");
    HTMLReportGenerator *hTMLReportGenerator = [[HTMLReportGenerator alloc]init];
    NSString* hTMLReportString = [hTMLReportGenerator prepareReport:jobApplications withTitle:jobPostedDateString];
    NSLog(@"HTML Report is:%@", hTMLReportString);
//    XCTAssertTrue([hTMLReportString isEqualToString:@"<p>Job Application Report: 20140714</p><table><tr><th>JOB SEEKER</th><th>JOB DETAILS</th><th>APP DATE</th></tr><tr><td>JSFIRST Jay</td><td>Test JReq Job-EMPFIRST Jay</td><td>14Jul2014</td></tr></table>"],@"");
    
}

-(NSString *)getTodayDateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    JobPostedDate *jobPostedDate = [[JobPostedDate alloc]initByPostedDate:[NSDate date]];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobPostedDate];
}

- (void)testPrepareAggregrateReportByJob{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    employerID = [[IDentifer alloc]initWithInteger:333];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:jobPosterName];
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];//DIFFERENT JOB
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    job = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    //    APPLYING FOR JOB
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    
    NSString *jobPostedDateString = [self getTodayDateString];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    JobApplications *jobApplications = [jobApplicationReport prepareDailyJobReport:[[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]]];

    

}

- (void)testPrepareJobApplicationReportByEmployer{
    IDentifer *employerID = [[IDentifer alloc]initWithInteger:333];
//    [[jobApplicationReport prepareJobApplicationReportByEmployer:employerID] isKindOfClass:[MutableArrayWrap class]
    XCTAssertTrue(false, @"Should return array of jobs");
    
}

-(void)resetJAAndJSModel{
    [[JAModel sharedInstance]reset];
    [[JSModel sharedInstance]reset];
}


@end
