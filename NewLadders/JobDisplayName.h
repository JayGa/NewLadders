//
//  JobDisplayName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDisplayName.h"
@interface JobDisplayName : NSObject{
    
    NSString *gdisplayName;
}

-(JobDisplayName*)initWithJob:(NSString *)jobName andPoster:(UserDisplayName *)postersName;
-(NSString*)getJobDisplayNameString;
@end
