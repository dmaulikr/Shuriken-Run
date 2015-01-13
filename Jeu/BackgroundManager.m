//
//  BackgroundManager.m
//  Jeu
//
//  Created by Enzo on 17/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BackgroundManager.h"


@implementation BackgroundManager
-(id) initWithFile:(NSString *)filename{
     CGSize winSize = [[CCDirector sharedDirector] winSize];
    if(self=[super init] )
    {
       self.position=ccp(winSize.width/2, winSize.height);
        CCSprite* background=[CCSprite spriteWithFile:filename];
        background.position=ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:1 parallaxRatio:ccp(0.1, 0.0) positionOffset:background.position];
        CCSprite* background2=[CCSprite spriteWithFile:filename];
        background2.position=ccp(winSize.width/2+background2.contentSize.width, winSize.height/2);
        [self addChild:background2 z:1 parallaxRatio:ccp(0.1,0.0) positionOffset:background2.position];
        CCSprite* background3=[CCSprite spriteWithFile:filename];
        background3.position=ccp(winSize.width/2+2*background3.contentSize.width, winSize.height/2);
        [self addChild:background3 z:1 parallaxRatio:ccp(0.1,0.0) positionOffset:background3.position];

    }
    return self;
}
-(void)scroll : (ccTime) dt
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CGPoint backgroundScrollVel = ccp(-1000, 0);
    //NSLog(@"tt%f",self.position.x);
    if(self.position.x<-24.5*winSize.width) self.position=ccp(winSize.width/2, winSize.height);
    self.position = ccpAdd(self.position, ccpMult(backgroundScrollVel, dt));

}
@end
