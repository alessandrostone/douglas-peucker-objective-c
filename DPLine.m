//
//  DPLine.m
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//
//  This code is in the public domain.

#import "DPLine.h"
#import "DPVector.h"

@implementation DPLine

-(id)initWithPoint1: (DPVector *)point1 point2: (DPVector *)point2
{
	if ((self = [super init]))
	{
		p1 = point1;
		p2 = point2;
	}
	return self;
}

-(float)lengthSquared
{
	float dx = p1.x - p2.x;
	float dy = p1.y - p2.y;
	
	return dx * dx + dy * dy;
}

-(float)distanceToPointSquared: (DPVector *)point
{
	DPVector *v = [[DPVector alloc] initWithX: point.x - p1.x Y: point.y - p1.y];
	DPVector *l = [[DPVector alloc] initWithX: p2.x - p1.x Y: p2.y - p1.y];
	
	float dot = [v dotProduct: [l unitVector]];
	
	if (dot <= 0)  // Point nearest P1
	{
		DPLine *dl = [[DPLine alloc] initWithPoint1: p1 point2: point];
		return [dl lengthSquared];
	}
	
	if ((dot*dot) >= [self lengthSquared])  // Point nearest P2
	{
		DPLine *dl = [[DPLine alloc] initWithPoint1: p2 point2: point];
		return [dl lengthSquared];
	}
	else  // Point within line
	{
		DPLine *v2 = [[DPLine alloc] initWithPoint1: p1 point2: point];
		float h = [v2 lengthSquared];
		return h - (dot * dot);
	}
}
@end