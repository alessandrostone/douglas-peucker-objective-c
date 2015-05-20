//
//  DPVector.h
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//
//  This code is in the public domain.

#import <Foundation/Foundation.h>


@interface DPVector : NSObject 
{
	float x, y;
	BOOL include;
}
@property (readonly, assign) float x,y;
@property (readwrite, assign) BOOL include;

-(id)initWithX: (float)the_x Y: (float)the_y;
-(float)dotProduct: (DPVector *)v;
-(float)magnitude;
-(DPVector *)unitVector;
@end
