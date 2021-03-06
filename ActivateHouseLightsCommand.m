//
//  ActivateHouseLightsCommand.m
//  Shion
//
//  Created by Chris Karr on 10/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ActivateHouseLightsCommand.h"

#import "House.h"

@implementation ActivateHouseLightsCommand

- (NSDictionary *) execute
{
	NSMutableDictionary * result = [NSMutableDictionary dictionary];
	
	if (device != nil)
	{
		NSString * string = nil;
		
		if ([device isKindOfClass:[House class]])
		{
			House * house = (House *) device;
			[house activateLights];
			
			string = [NSString stringWithFormat:@"Activating all lights in %@...", [device name]];
			[result setValue:[NSNumber numberWithBool:YES] forKey:CMD_SUCCESS];
		}
		
		[result setValue:string forKey:CMD_RESULT_DESC];
	}
	else
	{
		[result setValue:@"Please specify a house to activate." forKey:CMD_RESULT_DESC];
		[result setValue:[NSNumber numberWithBool:NO] forKey:CMD_SUCCESS];
	}	
	
	return result;
}

@end
