//
//  JobMetaData.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "JobPostedDate.h"

@interface JobMetaData : NSObject{
    
    IDentifer *ijobPosterID;
    JobPostedDate *ijobPostedDate;
}
- (JobMetaData*)initWithEmployerID:(IDentifer*)jobPosterID AndName:(JobPostedDate*)jobPostedDate;
@end
