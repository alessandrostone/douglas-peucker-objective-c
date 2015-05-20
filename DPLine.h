//
//  DPLine.h
//
//  Created by Sveinbjorn Thordarson on 3/4/11.
//
//  This code is in the public domain.//

#import <Foundation/Foundation.h>
#import "DPVector.h"

@interface DPLine : NSObject 
{
	DPVector *p1, *p2;
}
-(id)initWithPoint1: (DPVector *)point1 point2: (DPVector *)point2;
-(float)lengthSquared;
-(float)distanceToPointSquared: (DPVector *)point;


@end
