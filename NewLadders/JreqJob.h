//
//  JreqJob.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "IJob.h"
#import "Resume.h"
#import "JobMetaData.h"
#import "JobIDName.h"

@interface JreqJob : NSObject <IJob>{
    JobIDName *gjobIDName;
    JobMetaData *gjobMetaData;
}
-(id<IJob>)initWithIDName:(JobIDName*)jobIDName AndMetaData:(JobMetaData*)jobMetaData;
-(NSString*)appendJobDisplayName;
-(NSString*)appendJobApplicationReportElements:(NSString*)reportString;

@end