//
//  JobSeekerRepositiory.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/3/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobSeekerRepositiory.h"


static JobSeekerRepositiory *sharedInstance;


@implementation JobSeekerRepositiory
+(JobSeekerRepositiory*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JobSeekerRepositiory alloc] init];
    }
    return sharedInstance;
}

-(void)initTheJobSeekerRepo{
    
    jobSeekersCollection = [[JobSeekersCollection alloc]init];
    
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    
    IDentifer *resumeID11 = [[IDentifer alloc]initWithInteger:440];
    IDentifer *resumeID12 = [[IDentifer alloc]initWithInteger:441];

    Resume *resume11 = [[Resume alloc]initWithID:resumeID11];
    Resume *resume12 = [[Resume alloc]initWithID:resumeID12];
    
    Resumes *resumes1 = [[Resumes alloc]init];
    [resumes1 addResume:resume11];
    [resumes1 addResume:resume12];

    
    UserDisplayName *jobSeekerdisplayName1 = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"JSFirst"];
    JobSeekerIDName *jobSeekerIDName1 = [[JobSeekerIDName alloc]initWithID:jobSeekerID1 andName:jobSeekerdisplayName1];
    Jobseeker *jobSeeker1 = [[Jobseeker alloc]initWithID:jobSeekerIDName1 andResumeArray:resumes1];
    
    
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    
    IDentifer *resumeID21 = [[IDentifer alloc]initWithInteger:450];
    IDentifer *resumeID22 = [[IDentifer alloc]initWithInteger:451];
    
    Resume *resume21 = [[Resume alloc]initWithID:resumeID21];
    Resume *resume22 = [[Resume alloc]initWithID:resumeID22];
    
    Resumes *resumes2 = [[Resumes alloc]init];
    [resumes2 addResume:resume21];
    [resumes2 addResume:resume22];


    
    UserDisplayName *jobSeekerdisplayName2 = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"JSSecond"];
    JobSeekerIDName *jobSeekerIDName2 = [[JobSeekerIDName alloc]initWithID:jobSeekerID2 andName:jobSeekerdisplayName2];
    Jobseeker *jobSeeker2 = [[Jobseeker alloc]initWithID:jobSeekerIDName2 andResumeArray:resumes2];
    
    [jobSeekersCollection addJobSeeker:jobSeeker1 forJobseekerID:jobSeekerID1];
    [jobSeekersCollection addJobSeeker:jobSeeker2 forJobseekerID:jobSeekerID2];
    
}

-(BOOL)verifyTheResumeWithID:(IDentifer*)resumeID belongsToJobSeekerWithID:(IDentifer*)jobSeekerID{
    
    Jobseeker *jobseeker = [[Jobseeker alloc]init];
    jobseeker = (Jobseeker*)[jobSeekersCollection getJobSeekerForJobSeekerID:jobSeekerID];
    Resumes *resumes = (Resumes*)[jobseeker getAllResumeForJobseeker];
    Resume *resume = [[Resume alloc]initWithID:resumeID];
    BOOL retVal =  [resumes containsResumeWithID:resume];
    return retVal;
}

-(Jobseeker*)getJobSeekerAtIndex:(NSUInteger)index{
    
    return [jobSeekersCollection jobSeekerAtIndex:index];
}

-(Jobseeker*)getJobSeekerWithID:(IDentifer*)jobSeekerID{
    
    return [jobSeekersCollection jobSeekerWithID:jobSeekerID];
}
@end
