//
//  Hero.h
//  Jeu
//
//  Created by Enzo on 17/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"


@interface Hero : CCSpriteBatchNode {
    BOOL isJumping;
    CCSprite *character;
    CCAction *walkAction;
    
}
@property(nonatomic,readwrite)BOOL isJumping;
@property(nonatomic,readwrite)BOOL hasBonus;
@property( nonatomic, strong) CCAction *JumpAction;
@property(nonatomic,retain) Hero* extraLife;
@property(nonatomic,retain) CCSpriteBatchNode* smokeNode;
@property(nonatomic,retain) CCAction* smokeAction;
@property(nonatomic,retain) CCSprite* smoke;

-(id) init;
-(id) initWithPosition:(CGPoint)p;
-(void)jump;
-(id) getExtraLife;
-(CGSize) getCharacterSize;
-(void) collisionDetection:(CCArray*)shurikens :(int) score :(CCSprite*)bonusBox;
-(CCSprite*)getCharacter;
- (void)setInvisible:(CCNode *)node;

@end
