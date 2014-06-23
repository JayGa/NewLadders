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
#import "MutableDictionaryWrap.h"
#import "MutableArrayWrap.h"

@interface EmployerModel : NSObject{
    NSString *testJay;
}
+(EmployerModel*)sharedInstance;
@property (atomic, strong) MutableDictionaryWrap *employerJobMutableDict;
-(BOOL)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID;
-(MutableArrayWrap*)getPostedJobsForEmployerID:(IDentifer *)employerID;
@end
