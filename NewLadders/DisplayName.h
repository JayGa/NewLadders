//
//  DisplayName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayName : NSString{
    
    NSString *gdisplayName;
}
-(DisplayName*)initWithFirstName:(NSString *)firstname andLastName:(NSString *)lastname;

-(DisplayName*)initWithJob:(NSString *)jobName andPoster:(NSString *)postersName;

@end
