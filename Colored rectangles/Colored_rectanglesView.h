//
//  Colored_rectanglesView.h
//  Colored rectangles
//
//  Created by Jules on 20/08/2023.
//

#import <ScreenSaver/ScreenSaver.h>

@interface Colored_rectanglesView : ScreenSaverView {
    NSWindow *_configSheet;
    NSRect coloredRect;
    NSPoint initialMovement;
    CGFloat framesPerSecond;
    CGFloat movementWidth;
    NSMutableArray *currentMovements;
    NSMutableArray *colors;
}

@end
