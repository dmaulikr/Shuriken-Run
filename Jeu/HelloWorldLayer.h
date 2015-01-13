//
//  HelloWorldLayer.h
//  Jeu
//
//  Created by Enzo on 08/07/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import"AppDelegate.h"
#import "PauseLayer.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    
    //CCArray *_shurikens;
    int _nextShuriken;
    double _nextShurikenSpawn;
}
@property(nonatomic,strong) ShurikenManager* shurikens;
@property(nonatomic,strong) BonusManager* bonus;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)onExit;
-(void)onEnter;

@end
