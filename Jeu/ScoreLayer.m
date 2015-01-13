//
//  ScoreLayer.m
//  Jeu
//
//  Created by Enzo on 25/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ScoreLayer.h"


@implementation ScoreLayer
-(id)init{
    if(self=[super init])
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        _scoreLabel=[CCLabelTTF labelWithString:@"Menu" fontName:@"Arial" fontSize:15];
        _scoreLabel.color=ccc3(0,0,0);
         _scoreLabel.position = ccp(winSize.width* 0.9, winSize.height * 0.95);
        [self addChild:_scoreLabel];
        _score=0;
        
    }
    return self;
}
-(void) setScore:(int) s{
    _scoreLabel.string=[NSString stringWithFormat:@"Score : %d",s];
    //NSLog(_scoreLabel.string);
}
-(void) increaseScore:(ccTime)dt
{
    _score+=5;
    [self setScore:_score];
}
-(void) updateScore
{
    
}
-(int) getScore
{
    return _score;
}
@end
