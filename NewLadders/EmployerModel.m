//
//  EmployerModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "EmployerModel.h"

static EmployerModel *sharedInstance;

@implementation EmployerModel
@synthesize employerJobMutableDict;

+(EmployerModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[EmployerModel alloc] init];
    }
    return sharedInstance;
}

-(BOOL)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID{
    
    if(self.employerJobMutableDict == nil){
        [self setEmployerJobMutableDict:[[NSMutableDictionary alloc]init]];
    }
    
    NSMutableArray *tempArray;
    if([[self employerJobMutableDict] objectForKey:employerID] == nil){
        tempArray = [[NSMutableArray alloc]init];
        [[self employerJobMutableDict] setValue:tempArray forKey:employerID];
    }
    
    tempArray = [[self employerJobMutableDict] objectForKey:employerID];
    [tempArray addObject:job];
    return true;
}

-(NSMutableArray*)getPostedJobsForEmployerID:(IDentifer *)employerID{
    return [[self employerJobMutableDict] objectForKey:employerID];
}


@end
