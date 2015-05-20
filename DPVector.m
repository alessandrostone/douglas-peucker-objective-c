//
//  DPVector.m
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//
//  This code is in the public domain.
//

#import "DPVector.h"


@implementation DPVector
@synthesize x,y,include;

-(id)initWithX: (float)the_x Y: (float)the_y
{
	if ((self = [super init]))
	{
		x = the_x;
		y = the_y;
	}
	return self;
}
	
-(float)dotProduct: (DPVector *)v
{
	return (x * v.x + y * v.y);
}

-(float)magnitude
{
	return sqrt(x*x + y*y);
}

-(DPVector *)unitVector
{
	if ([self magnitude] == 0)
		return [[DPVector alloc] initWithX: 0 Y: 0];
	
	return [[DPVector alloc] initWithX: x / [self magnitude] Y: y / [self magnitude]];
}

@end
