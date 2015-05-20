//
//  DouglasPeucker.m
//  GravityTest
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DouglasPeucker.h"
#import "DPVector.h"
#import "DPLine.h"

@implementation DouglasPeucker
@synthesize tolerance;

-(id)initWithArrayOfCGPoints: (NSArray *)arr
{
	if ((self = [super init]))
	{
		endVectors = [[NSMutableArray alloc] initWithCapacity: [arr count]];
		startingVectors = [[NSMutableArray alloc] initWithCapacity: [arr count]];
		
		for (NSValue *v in arr)
		{
			CGPoint p = [v CGPointValue];
			DPVector *vp = [[[DPVector alloc] initWithX: p.x Y: p.y] autorelease];
			[startingVectors addObject: vp];
		}
		
		[[startingVectors objectAtIndex: 0] setInclude: YES];
		[[startingVectors lastObject] setInclude: YES];
		
	}
	return self;
}

-(void)dealloc
{
	[startingVectors dealloc];
	[super dealloc];
}

-(NSMutableArray *)simplerLineWithTolerance: (float)t
{
	tolerance = t;
	toleranceSquared = t*t;
	
	[self douglasPeuckerWithIndex1: 0 index2: [startingVectors count]-1];
	
	for (DPVector *point in startingVectors)
	{
		if (point.include)
		{
			[endVectors addObject: [NSValue valueWithCGPoint: CGPointMake(point.x, point.y)]];
		}
	}
	return endVectors;
}


-(void)douglasPeuckerWithIndex1: (int) startVertexIndex index2: (int)endVertexIndex
{
	if (endVertexIndex <= startVertexIndex+1) // nothing to simplify
		return;
	
	// Make a line from start to end
	DPLine *line = [[DPLine alloc] initWithPoint1: [startingVectors objectAtIndex: startVertexIndex]
										   point2: [startingVectors objectAtIndex: endVertexIndex]];
	
	// Find largest distance from intermediate points to this line
	float maxDistToLineSquared = 0;
	int maxDistIndex;
	
	for (int i = startVertexIndex+1; i < endVertexIndex; i++)
	{
		float distToLineSquared = [line distanceToPointSquared: [startingVectors objectAtIndex: i]];
		
		if (distToLineSquared > maxDistToLineSquared)
		{
			maxDistToLineSquared = distToLineSquared;
			maxDistIndex = i;
		}
	}
	
	if (maxDistToLineSquared > toleranceSquared)
	{
		[[startingVectors objectAtIndex: maxDistIndex] setInclude: YES];
		
		[self douglasPeuckerWithIndex1: startVertexIndex index2: maxDistIndex];
		[self douglasPeuckerWithIndex1: maxDistIndex index2: endVertexIndex];
	}
	
	[line release];
}
@end
