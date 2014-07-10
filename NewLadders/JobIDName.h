//
//  JobIDName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "JobDisplayName.h"

@interface JobIDName : NSObject{
    
    IDentifer *ijobID;
    JobDisplayName *ijobName;
}
- (JobIDName*)initWithJobID:(IDentifer*)jobID AndName:(JobDisplayName*)jobName;
- (NSString*)getJobDisplayName;
@end
