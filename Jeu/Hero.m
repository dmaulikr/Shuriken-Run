//
//  Hero.m
//  Jeu
//
//  Created by Enzo on 17/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Hero.h"


@implementation Hero
@synthesize isJumping;
@synthesize JumpAction;

-(id) init{
    //Getting the Window size
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    //Creating the BatchNode
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"AnimPerso-hd.plist"];
    if(self= [super initWithFile :@"AnimPerso-hd.png" capacity : 10])
     {

    // Adding the Walk animated sprites into an array
    NSMutableArray *walkAnimFrames = [NSMutableArray array];
    for (int i=1; i<=4; i++) {
        [walkAnimFrames addObject:
         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
          [NSString stringWithFormat:@"perso%d.png",i]]];
    }
    
         isJumping=NO;
         _hasBonus=NO;
   /*//Initializing The smoke effect for extralife
         [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"AnimSmoke-hd.plist"];
         NSMutableArray *smokeAnimFrames = [NSMutableArray array];
         for (int i=1; i<=4; i++) {
             [smokeAnimFrames addObject:
              [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
               [NSString stringWithFormat:@"smoke%d.png",i]]];
         }
         _smoke=[CCSprite spriteWithSpriteFrameName:@"smoke1.png"];
         _smoke.visible=NO;
         _smoke.position=_extraLife.position;
         [self addChild:_smoke];
         CCAnimation *smokeAnim = [CCAnimation animationWithSpriteFrames:smokeAnimFrames delay:0.1f];
         id smokeCallFuncN = [CCCallFuncN actionWithTarget:self selector:@selector(setInvisible:)];
         _smokeAction = [CCSequence actions:[CCAnimate actionWithAnimation:smokeAnim],smokeCallFuncN, nil];
              */
    //Initialiazing the Character's Sprite
    character= [CCSprite spriteWithSpriteFrameName:@"perso1.png"];
    character.position = ccp(winSize.width/2, winSize.height/3);
    //Making the Character walk
         //Create the walkAction using the sprites in the array
    CCAnimation *walkAnim = [CCAnimation animationWithSpriteFrames:walkAnimFrames delay:0.1f];
    walkAction = [CCRepeatForever actionWithAction:
                  [CCAnimate actionWithAnimation:walkAnim]];
         // on initialise l'action qui nous servira pour les sauts
         JumpAction=[CCJumpBy actionWithDuration:0.5 position:ccp(0,0) height:45 jumps:1];
         // We make our character start running
    [character runAction:walkAction];
    [self addChild:character];
    [self setVisible:YES];
         //Initializing ExtraLife Bonus character
    _extraLife=[[Hero alloc ]initWithPosition:ccp(winSize.width/2-character.contentSize.width,winSize.height/3)];
         
    [_extraLife setVisible:NO];
     }
    return self;
}
-(id) initWithPosition:(CGPoint)p
{    //Creating the BatchNode
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"AnimPerso-hd.plist"];
    if(self= [super initWithFile :@"AnimPerso-hd.png" capacity : 10])
    {
        
        // Adding the Walk animated sprites into an array
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for (int i=1; i<=4; i++) {
            [walkAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"perso%d.png",i]]];
        }
        
        isJumping=NO;
        _hasBonus=NO;
        
        //Initialiazing the Character's Sprite
        character= [CCSprite spriteWithSpriteFrameName:@"perso1.png"];
        character.position = p;
        //Making the Character walk
        //Create the walkAction using the sprites in the array
        CCAnimation *walkAnim = [CCAnimation animationWithSpriteFrames:walkAnimFrames delay:0.1f];
        walkAction = [CCRepeatForever actionWithAction:
                      [CCAnimate actionWithAnimation:walkAnim]];
        // on initialise l'action qui nous servira pour les sauts
        JumpAction=[CCJumpBy actionWithDuration:0.5 position:ccp(0,0) height:45 jumps:1];
        // We make our character start running
        [character runAction:walkAction];
        [self addChild:character];
        [self setVisible:YES];
    return self;
}
}

-(void)finishedJumping{
    isJumping=NO;
}
-(void) jump
{   // Si l'on est pas déjà en train de sauter, on saute
    if(isJumping==NO)
    {
    isJumping=YES;
//On éxécute le saut, puis on rends compte que l'action est terminée
id actionCallFuncN = [CCCallFuncN actionWithTarget:self selector:@selector(finishedJumping)];
        [character runAction: [CCSequence actions: JumpAction,actionCallFuncN,nil]];
        if(_hasBonus==YES)
            [[_extraLife getCharacter]runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.2],[CCJumpBy actionWithDuration:0.5 position:ccp(0,0) height:45 jumps:1] , nil] ];
    }

}

-(CGSize) getCharacterSize{
    return character.contentSize;
}
-(void) collisionDetection:(CCArray*)shurikens :(int) score :(CCSprite*)bonusBox{
    CCNode* temp;
    for(int i=0;i<[shurikens count];i++)
    { temp=[shurikens objectAtIndex:i];
        if([temp visible]==YES)
        {
            if(temp.position.x-temp.contentSize.width/2.5<character.position.x && temp.position.x-temp.contentSize.width/2.5>character.position.x-character.contentSize.width/2.8 && temp.position.y+temp.contentSize.height/2.5<character.position.y+character.contentSize.height/2.5 && temp.position.y+temp.contentSize.height/2.5>character.position.y-character.contentSize.height/2.3)
            {   if(_hasBonus==NO)
                {
                [Helper setInvisible:temp];
                //[[CCDirector sharedDirector] stopAnimation];
                //[[CCDirector sharedDirector] pause];
                    [character stopAllActions];
                //CCScene *gameOverScene = [GameOverLayer sceneWithScore:score];
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFadeBL transitionWithDuration:0.5 scene: [GameOverLayer sceneWithScore:score]]];
                    [self.parent unscheduleUpdate];

                }
            else {
                [Helper setInvisible:_extraLife];
                [Helper setInvisible:temp];
                _hasBonus=NO;
                }
                
            }
        }
    }
    if(bonusBox.visible==YES)
    if(bonusBox.position.x-bonusBox.contentSize.width<character.position.x && bonusBox.position.x-bonusBox.contentSize.width/2.5>character.position.x-character.contentSize.width/2.8 && bonusBox.position.y+bonusBox.contentSize.height<character.position.y+character.contentSize.height/2.5 && bonusBox.position.y+bonusBox.contentSize.height>character.position.y-character.contentSize.height/2.3 )
    {
        [Helper setInvisible:bonusBox];
        if (_hasBonus==NO) {
            _hasBonus=YES;
            //[_smoke runAction:_smokeAction];
            _extraLife.visible=YES;
        }
    }

}
-(id)getExtraLife
{
    return _extraLife;
}
-(CCSprite*)getCharacter
{
    return character;
}
-(void) setInvisible:(CCNode*) node
{
    [Helper setInvisible:node];
}

@end
