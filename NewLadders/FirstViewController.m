//
//  FirstViewController.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "FirstViewController.h"
#import "Employer.h"
#import "IJob.h"
#import "IJobApplication.h"
#import "JreqJob.h"
#import "ATSJob.h"

@interface FirstViewController (){
    Employer *employer;
    id<IJob> job;
    id<IJobApplication> jobApplication;
}

@end

@implementation FirstViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postJReq:(id)sender{
    employer = [[Employer alloc]initWithEmployerID:[[IDentifer alloc] initWithString:@"1234"] andDisplayName:[[DisplayName alloc] initWithString:@"TheLadders"]];
    job = [[JreqJob alloc]init];
    [employer postJobWithName:@"Test JReq Job" withJobType:job];
}

-(IBAction)postATS:(id)sender{
    employer = [[Employer alloc]initWithEmployerID:[[IDentifer alloc] initWithString:@"1234"] andDisplayName:[[DisplayName alloc] initWithString:@"TheLadders"]];
    job = [[ATSJob alloc]init];
    [employer postJobWithName:@"Test ATS Job" withJobType:job];
}
@end
