//
//  HelloWorldLayer.m
//  Jeu
//
//  Created by Enzo on 08/07/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
#import "HelloWorldLayer.h"

@interface HelloWorldLayer ()
{
    
}

@property (nonatomic, strong) CCSprite *character;
@property(nonatomic,strong) Hero* player;
@property(nonatomic,strong) BackgroundManager *background;
@property(nonatomic,strong) ScoreLayer* Hud;
@property(nonatomic,strong) PauseLayer* pauseMenu;
@end

@implementation HelloWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
    PauseLayer* pLayer=[[PauseLayer alloc] initWithGlayer:layer];
	[scene addChild: layer z:0 tag:1];
    [scene addChild:pLayer z:7 tag:2];
	return scene;
} 

-(id) init {
    if((self = [super init])) {
        // TODO...
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"AnimPerso-hd.plist"];
       // CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"AnimPerso-hd.png"];
        //[self addChild:spriteSheet z:2];
        
         _player = [[Hero alloc] init];
        [self addChild:_player z:5];
        [self addChild:[_player getExtraLife] z:5];
        [self setIsTouchEnabled:YES];
        
         //_backgroundNode = [CCParallaxNode node];
        //_backgroundNode.position=ccp(winSize.width/2, winSize.height);
        _background =[ [BackgroundManager alloc] initWithFile:@"mockup2.jpg"];

        [self addChild:_background z:-1];
        
        _Hud=[[ScoreLayer alloc]init];
        [self addChild:_Hud z:7];
        
        _pauseMenu=[[PauseLayer alloc]init];
         [self addChild:_pauseMenu z:7];
        /*CCSprite* background=[CCSprite spriteWithFile:@"mockup.jpg"];
        background.position=ccp(winSize.width/2, winSize.height/2);
        [_backgroundNode addChild:background z:1 parallaxRatio:ccp(0.1, 0.1) positionOffset:background.position];
        CCSprite* background2=[CCSprite spriteWithFile:@"mockup.jpg"];
        background2.position=ccp(winSize.width/2+background2.contentSize.width, winSize.height/2);
        [_backgroundNode addChild:background2 z:1 parallaxRatio:ccp(0.1,0.1) positionOffset:background2.position];
        CCSprite* background3=[CCSprite spriteWithFile:@"mockup.jpg"];
        background3.position=ccp(winSize.width/2+2*background3.contentSize.width, winSize.height/2);
        [_backgroundNode addChild:background3 z:1 parallaxRatio:ccp(0.1,0.1) positionOffset:background3.position];*/
        /*NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for (int i=1; i<=4; i++) {
            [walkAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"perso%d.png",i]]];
        }*/
        //CCAnimation *walkAnim = [CCAnimation
                              //   animationWithSpriteFrames:walkAnimFrames delay:0.1f];
        //self.character= [CCSprite spriteWithSpriteFrameName:@"perso1.png"];
        //self.character.position = ccp(winSize.width/2, winSize.height/2);
        //self.walkAction = [CCRepeatForever actionWithAction:
                          // [CCAnimate actionWithAnimation:walkAnim]];
        //[self.character runAction:self.walkAction];
        //[spriteSheet addChild:self.character];
        [self scheduleUpdate];
        [_Hud schedule:@selector(increaseScore:) interval:0.5];
        [self setIsTouchEnabled:YES];
        
        /*_shurikens = [[CCArray alloc] initWithCapacity:10];
        for(int i = 0; i < 10; ++i) {
            CCSprite *shuriken = [CCSprite spriteWithFile:@"projectile-hd.png"];
            shuriken.visible = NO;
            [self addChild:shuriken];
            [_shurikens addObject:shuriken];
        }
        // Initialiser pour pas que les shurikens arrivent dès le lancement de la partie
        _nextShurikenSpawn=CACurrentMediaTime()+2.0;*/
     _shurikens=[[ShurikenManager alloc]init];
        [self addChild:_shurikens z:3];
    
        _bonus=[[BonusManager alloc]init];
        [self addChild:_bonus z:2];

    }
    return self;
}
- (float)randomValueBetween:(float)low andValue:(float)high {
    return (((float) arc4random() / 0xFFFFFFFFu) * (high - low)) + low;
}
- (void)setInvisible:(CCNode *)node {
    node.visible = NO;
}
- (void)update:(ccTime)dt {
    //CGSize winSize = [[CCDirector sharedDirector] winSize];
    /*CGPoint backgroundScrollVel = ccp(-1000, 0);
    NSLog(@"tt%f",_backgroundNode.position.x);
    if(_backgroundNode.position.x<-24.5*winSize.width) _backgroundNode.position=ccp(winSize.width/2, winSize.height);
    _backgroundNode.position = ccpAdd(_backgroundNode.position, ccpMult(backgroundScrollVel, dt));*/
    [_background scroll:dt];
    //Shurikens
    [_shurikens throwShuriken:[_player getCharacterSize] :[_Hud getScore]];
    [_bonus bonusSpawnWithScore:[_Hud getScore] andWindow:[_player getCharacterSize]];
    [_player collisionDetection:[_shurikens getArray] :[_Hud getScore] :[_bonus getBonusBox]];
    [_Hud updateScore];
    
    /*double curTime = CACurrentMediaTime();
    if (curTime > _nextShurikenSpawn) {
        
        float randSecs = [self randomValueBetween:0.75 andValue:2.67];
        _nextShurikenSpawn = randSecs + curTime;
        
        float randY = [self randomValueBetween:winSize.height/2-self.character.contentSize.height/2.4 andValue:winSize.height/2-self.character.contentSize.height/4.5];
        float randDuration = [self randomValueBetween:1.5 andValue:2.5];
        
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
    }*/
         /*for (CCSprite *shuriken in _shurikens)
        {
            if(CGRectIntersectsRect(shuriken.boundingBox, self.character.boundingBox))
            {
                shuriken.visible=NO;
                
            }
    
        }*/
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.character stopAllActions];
    //NSLog(@"marche");
    //[self.character runAction: [CCJumpBy actionWithDuration:0.5 position:ccp(0,0) height:40 jumps:1]];
    //[self.character runAction:self.walkAction];
    [_player jump];
  
}

-(void)onExit
{
   [super onExit];
    //[self unscheduleUpdate];
    //[[_player getCharacter ] pauseSchedulerAndActions];

}
-(void)onEnter
{
   [super onEnter];
    //[self scheduleUpdate];
    //[[_player getCharacter ] resumeSchedulerAndActions];
}
@end