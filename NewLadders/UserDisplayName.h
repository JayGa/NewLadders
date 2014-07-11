//
//  UserDisplayName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDisplayName : NSObject{
    
    NSString *gdisplayName;
}

-(UserDisplayName*)initWithFirstName:(NSString *)firstname andLastName:(NSString *)lastname;
-(NSString*)getUserDisplayNameString;

@end
