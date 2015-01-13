//
//  ShurikenManager.m
//  Jeu
//
//  Created by Enzo on 18/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ShurikenManager.h"


@implementation ShurikenManager
-(id) init{
    if(self=[super init ])
    {
        _shurikens = [[CCArray alloc] initWithCapacity:10];
        for(int i = 0; i < 10; ++i) {
            CCSprite *shuriken = [CCSprite spriteWithFile:@"projectile-hd.png"];
            shuriken.visible = NO;
            [self addChild:shuriken];
            [_shurikens addObject:shuriken];
            _minTime=0.75;
            _maxTime=2.67;
            _minDuration=1.6;
            _maxDuration=2.2;
        }
        // Initialiser pour pas que les shurikens arrivent dès le lancement de la partie
        _nextShurikenSpawn=CACurrentMediaTime()+4.0;

    }
    return self;
}

-(void) throwShuriken:(CGSize) window :(int)score
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    double curTime = CACurrentMediaTime();
    if (curTime > _nextShurikenSpawn) {
        
        float randSecs = [Helper randomValueBetween:_minTime andValue:_maxTime];
        _nextShurikenSpawn = randSecs + curTime;
        
        float randY = [Helper randomValueBetween:winSize.height/3-window.height/2.4 andValue:winSize.height/3-window.height/4];
        float randDuration = [Helper randomValueBetween:_minDuration andValue:_maxDuration];
        if(_minDuration>1.3 && score>5) _minDuration-=_minDuration/score;
        else {
            if(_maxDuration>_minDuration+0.3) _maxDuration-=0.1-_maxDuration/score;
            else
            {
                if(_maxTime>1)
                {
                    _maxTime-=0.1-_maxTime/score;
                    _minDuration-=0.01-_minDuration/score;
                }
                
            }
        }
        NSLog(@" minDuration %f maxDuration : %f randuration : %f maxTime : %f randSecs: %f"  ,_minDuration,_maxDuration,randDuration, _maxTime, randSecs);
        CCSprite *shuriken = [_shurikens objectAtIndex:_nextShuriken];
        _nextShuriken++;
        if (_nextShuriken >= _shurikens.count) _nextShuriken = 0;
        
        [shuriken stopAllActions];
        shuriken.position = ccp(winSize.width+shuriken.contentSize.width/2,randY );
        shuriken.visible = YES;
        [shuriken runAction:[CCSequence actions:
                             [CCMoveBy actionWithDuration:randDuration position:ccp(-winSize.width-shuriken.contentSize.width, 0)],
                             [CCCallFuncN actionWithTarget:self selector:@selector(setInvisible:)],
                             nil]];
    }

    
}
-(void)setInvisible:(CCNode *)node {
    node.visible = NO;
}
-(CCArray*) getArray{
    return _shurikens;
}
@end
