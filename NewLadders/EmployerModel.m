//
//  EmployerModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "EmployerModel.h"

@implementation EmployerModel
@synthesize employerJobMutableDict;

+(EmployerModel*)sharedInstance{
    static EmployerModel *sharedInstance;
    sharedInstance = [[EmployerModel alloc] init];
    return sharedInstance;
}

-(BOOL)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID{
     NSLog(@"In postJob BEFORE: %@", [self testJay]);
//    if(self.employerJobMutableArray == nil){
//        [self setEmployerJobMutableArray:[[NSMutableArray alloc]init]];
//    }
//    NSMutableArray *tempArray;
//    if([[self employerJobMutableDict] objectForKey:employerID] == nil){
//        
//        tempArray = [[NSMutableArray alloc]init];
//        [[self employerJobMutableDict] setValue:tempArray forKey:employerID];
//    }
//    
//    tempArray = [[self employerJobMutableDict] objectForKey:employerID];
//    [[self employerJobMutableDict] removeObjectForKey:employerID];
//    [tempArray addObject:job];
//    [[self employerJobMutableDict] setValue:tempArray forKey:employerID];

//    [[self employerJobMutableArray] addObject:job];
    self.testJay = @"Jay";
    NSLog(@"In postJob AFTER: %@", [self testJay]);

    return true;
}

-(NSMutableArray*)getPostedJobsForEmployerID:(IDentifer *)employerID{
    NSLog(@"In getPostedJobsForEmployerID MODEL is: %@", [self employerJobMutableArray]);
    
    return [self employerJobMutableArray];
//            objectForKey:employerID];
}


@end
