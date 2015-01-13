//
//  BackgroundManager.h
//  Jeu
//
//  Created by Enzo on 17/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"
@interface BackgroundManager : CCParallaxNode {
    
}
-(id) initWithFile: (NSString*) filename;
-(void) scroll: (ccTime)dt;
@end
