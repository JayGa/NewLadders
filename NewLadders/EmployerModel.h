//
//  EmployerModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"
#import "IDentifer.h"

@interface EmployerModel : NSObject
+(EmployerModel*)sharedInstance;
@property (atomic, strong) NSMutableDictionary *employerJobMutableDict;
@property (atomic, strong) NSString *testJay;
@property (atomic, strong) NSMutableArray *employerJobMutableArray;
-(BOOL)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID;
-(NSMutableArray*)getPostedJobsForEmployerID:(IDentifer *)employerID;
@end
