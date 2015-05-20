//
//  DouglasPeucker.h
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//
//  This code is in the public domain.

#import <Foundation/Foundation.h>

@interface DouglasPeucker : NSObject 
{
	NSMutableArray *startingVectors;
	NSMutableArray *endVectors;
	
	float tolerance;
	float toleranceSquared;
}
@property (readwrite, assign) float tolerance;

-(id)initWithArrayOfCGPoints: (NSArray *)arr;
-(NSMutableArray *)simplerLineWithTolerance: (float)t;
-(void)douglasPeuckerWithIndex1: (int) startVertexIndex index2: (int)endVertexIndex;

@end
