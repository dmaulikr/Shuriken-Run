//
//  Helper.m
//  Jeu
//
//  Created by Enzo on 18/07/13.
//
//

#import "Helper.h"

@implementation Helper

+ (float)randomValueBetween:(float)low andValue:(float)high {
    return (((float) arc4random() / 0xFFFFFFFFu) * (high - low)) + low;
}
+(void)setInvisible:(CCNode *)node {
    node.visible = NO;
}

@end
