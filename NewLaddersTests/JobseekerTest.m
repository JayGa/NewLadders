//
//  JobseekerTest.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>

//#import "IJob.h"
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
#import "UserDisplayName.h"
#import "JobSeekerRepositiory.h"
#import "JobIDGenerator.h"

@class Jobseeker;
@class IJob;

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    IDentifer *jobSeekerID;
    IDentifer *jobID;
    Employer *employer;
    Resume  *resume;
    id<IJob> job;
    PostedJobs *postedJobs;
    NSString *jobName;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    
    [[JobSeekerRepositiory sharedInstance]initTheJobSeekerRepo];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    employerID = [[IDentifer alloc]initWithInteger:333];
    postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];

    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:jobPosterName];

#warning Use id generate method or hard code job IDs.
//    IDentifer *jobID1 = [[JobIDGenerator sharedInstance]generateATSJobID];
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JreqJob *job1 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:135] AndName:jobName1];
    job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job1 andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    ATSJob *job2 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:246] AndName:jobName2];
    job2 = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job2 andID:jobID2];
    
    IDentifer *jobID3 = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName3 = [[JobDisplayName alloc]initWithJob:@"Second Test JReq Job" andPoster:jobPosterName];
    JreqJob *job3 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData3 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName3 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:579] AndName:jobName3];
    job3 = [[JreqJob alloc]initWithIDName:jobIDName3 AndMetaData:jobMetaData3];
    [employer postJobWithName:jobName3 withJobType:job3 andID:jobID3];
    
    IDentifer *jobID4 = [[IDentifer alloc]initWithInteger:248];
    JobDisplayName *jobName4 = [[JobDisplayName alloc]initWithJob:@"Second Test ATS Job" andPoster:jobPosterName];
    ATSJob *job4 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData4 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName4 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:680] AndName:jobName4];
    job4 = [[ATSJob alloc]initWithIDName:jobIDName4 AndMetaData:jobMetaData4];
    [employer postJobWithName:jobName4 withJobType:job4 andID:jobID4];
    
    postedJobs = [[EmployerModel sharedInstance]jobsPostedByEmployerWithID:employerID];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    jobSeeker = nil;
    resumeID = nil;
}


- (void) testSaveJReqJob{
    [self resetJAAndJSModel];
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:0]];
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 getJobDisplayName]);
    XCTAssertTrue([[savedJob1 getJobDisplayName] isEqualToString: @"Test JReq Job-FIRST Jay"], @"");
}


- (void) testSaveATSJob{
    [self resetJAAndJSModel];
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:1]];
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 getJobDisplayName]);
    XCTAssertTrue([[savedJob1 getJobDisplayName] isEqualToString: @"Test ATS Job-FIRST Jay"], @"");

}


- (void) testSeeSavedJobs{
    [self resetJAAndJSModel];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:2]];
    
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:3]];
    

    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];

    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 getJobDisplayName]);
    XCTAssertTrue([[savedJob1 getJobDisplayName] isEqualToString: @"Second Test JReq Job-FIRST Jay"], @"");

    id<IJob> savedJob2 = [savedJobs savedJobAtIndex:1];
    NSLog(@"Saved job2 is: %@", [savedJob2 getJobDisplayName]);
    XCTAssertTrue([[savedJob2 getJobDisplayName] isEqualToString: @"Second Test ATS Job-FIRST Jay"], @"");
//    XCTAssertEqual([savedJobs count], 2, @"");
}

- (void)testApplyForJreqJobWithCorrectResume{
    [self resetJAAndJSModel];
    
    jobID = [[IDentifer alloc]initWithInteger:135];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];

    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 135, @"Should be True");
}

- (void)testApplyForJreqJobWithOtherPersonsResume{
    
    [self resetJAAndJSModel];
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:450];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];//Resume belongs to different user.
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual(afterAppliedJobCount - beforeAppliedJobCount, 0, @"");
    XCTAssertEqual(afterJobApplicationCount - beforeJobApplicationCount, 0, @"");
    XCTAssertEqual(afterJobApplicationByDayCount - beforeJobApplicationByDayCount, 0, @"");
}


- (void)testApplyForJreqJobWithNOResume{
    
    [self resetJAAndJSModel];
    
//    jobID = [[IDentifer alloc]initWithInteger:135];
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:nil];//NO RESUME
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:nil];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual(afterAppliedJobCount - beforeAppliedJobCount, 0, @"");
    XCTAssertEqual(afterJobApplicationCount - beforeJobApplicationCount, 0, @"");
    XCTAssertEqual(afterJobApplicationByDayCount - beforeJobApplicationByDayCount, 0, @"");

}

- (void)testApplyForDifferentJreqJobWithDifferentResume{
    
    [self resetJAAndJSModel];
    
    jobID = [[IDentifer alloc]initWithInteger:137];
//    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];//Different JREQ JOB
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:441];//Different resume but belongs to the right jobseeker.
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 137, @"Should be True");
}

- (void)testApplyForATSJob{
    
    [self resetJAAndJSModel];
    
    jobID = [[IDentifer alloc]initWithInteger:246];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 246, @"Should be True");
}

- (void)testApplyForATSJobWithResume{
    
    [self resetJAAndJSModel];
    
    jobID = [[IDentifer alloc]initWithInteger:246];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
        IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];

    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 246, @"Should be True");

}

- (void)testApplyForDifferentATSJob{
    [self resetJAAndJSModel];
    
    jobID = [[IDentifer alloc]initWithInteger:680];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 680, @"Should be True");
    
}

- (void) testSeeAppliedJobs{
    
    [self resetJAAndJSModel];
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplications  *jobApplicationsCollection = [jobSeeker seeAppliedJobs];
    
    id<IJobApplication> jobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"In testSeeAppliedJobs JOB1ID is:%d", [jobApplication1 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication1 prepareJobApplicationReport], 135, @"Should be True");

    id<IJobApplication> jobApplication2 = [jobApplicationsCollection jobApplicationAtIndex:1];
    NSLog(@"In testSeeAppliedJobs JOB2ID is:%d", [jobApplication2 prepareJobApplicationReport]);
    XCTAssertEqual([jobApplication2 prepareJobApplicationReport], 246, @"Should be True");
}

-(void)resetJAAndJSModel{
    [[JAModel sharedInstance]reset];
    [[JSModel sharedInstance]reset];
}
@end

