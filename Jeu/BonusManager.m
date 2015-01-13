//
//  BonusManager.m
//  Jeu
//
//  Created by Enzo on 05/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BonusManager.h"


@implementation BonusManager

-(id)init
{
    if(self= [super init])
    {
        bonusBox=[CCSprite spriteWithFile:@"Icon-Small.png"];
        bonusBox.visible=NO;
        [self addChild:bonusBox];
        _nextBonusSpawn=CACurrentMediaTime()+20.0;


       
    }
    return self;
}
-(void) bonusSpawnWithScore:(int)score andWindow:(CGSize) window
{
    if( bonusBox.visible==NO)
    {
        double curTime = CACurrentMediaTime();
        if(curTime>_nextBonusSpawn)
        { CGSize winSize = [[CCDirector sharedDirector] winSize];
            
            float randSecs = [Helper randomValueBetween:20.0 andValue:80.0];
            _nextBonusSpawn = randSecs + curTime;
            
            //picking a random Y position for the bonus
            float randY = [Helper randomValueBetween:winSize.height/3-window.height/2.4 andValue:winSize.height/3];
            float Duration  = 2.0;
            bonusBox.position=ccp(winSize.width+bonusBox.contentSize.width,randY);
            bonusBox.visible=YES;
            [bonusBox runAction:[CCSequence actions:
                                 [CCMoveBy actionWithDuration:Duration position:ccp(-winSize.width-bonusBox.contentSize.width, 0)],
                                 [CCCallFuncN actionWithTarget:self selector:@selector(setInvisible:)],
                                 nil]];
        }
    }
}
-(void) setInvisible:(CCNode*) node
{
    [Helper setInvisible:node];
}
-(CCSprite*) getBonusBox
{
    return bonusBox;
}
@end
