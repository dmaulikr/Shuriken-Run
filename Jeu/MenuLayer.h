//
//  MenuLayer.h
//  Jeu
//
//  Created by Enzo on 07/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface MenuLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    
}
@property(nonatomic,strong) CCSprite* background;
@property(nonatomic,strong)CCSprite* playOption;

+(CCScene *) scene;
-(void)startGame:(id) sender;
@end
