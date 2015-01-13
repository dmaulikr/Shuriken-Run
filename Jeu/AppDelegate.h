//
//  AppDelegate.h
//  Jeu
//
//  Created by Enzo on 08/07/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "Hero.h"
#import "BackgroundManager.h"
#import "ShurikenManager.h"
#import "GameOverLayer.h"
#import "BonusManager.h"
#import "ScoreLayer.h"
#import"Helper.h"
@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*__unsafe_unretained director_;							// weak ref
}

@property (nonatomic, strong) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (unsafe_unretained, readonly) CCDirectorIOS *director;

@end
