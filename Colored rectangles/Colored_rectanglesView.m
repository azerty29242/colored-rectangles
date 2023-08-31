//
//  Colored_rectanglesView.m
//  Colored rectangles
//
//  Created by Jules on 20/08/2023.
//

#import "Colored_rectanglesView.h"

@implementation Colored_rectanglesView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/5.0];
        coloredRect = NSMakeRect(0, 0, frame.size.width/10, frame.size.height/10);
        initialMovement = NSMakePoint(frame.size.width/100, frame.size.width/100);
        currentMovements = [NSMutableArray arrayWithArray: @[
            [NSValue valueWithPoint:NSMakePoint(frame.size.width/100, frame.size.width/100)]
        ]];
        colors = [NSMutableArray arrayWithArray: @[
            [NSColor colorWithCalibratedRed:1.00f green:0.00f blue:0.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:1.00f green:0.25f blue:0.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:1.00f green:0.50f blue:0.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:1.00f green:0.75f blue:0.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:1.00f green:1.00f blue:0.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.75f green:1.00f blue:0.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.50f green:1.00f blue:0.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.25f green:1.00f blue:0.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.00f green:1.00f blue:0.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.00f green:1.00f blue:0.25f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.00f green:1.00f blue:0.50f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.00f green:1.00f blue:0.75f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.00f green:1.00f blue:1.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.00f green:0.75f blue:1.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.00f green:0.50f blue:1.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.00f green:0.25f blue:1.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.00f green:0.00f blue:1.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.25f green:0.00f blue:1.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:0.50f green:0.00f blue:1.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:0.75f green:0.00f blue:1.00f alpha:1.0f],
            [NSColor colorWithCalibratedRed:1.00f green:0.00f blue:1.00f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:1.00f green:0.00f blue:0.75f alpha:1.0f],
            [NSColor colorWithCalibratedRed:1.00f green:0.00f blue:0.50f alpha:1.0f],
//            [NSColor colorWithCalibratedRed:1.00f green:0.00f blue:0.25f alpha:1.0f]
        ]];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    NSColor *currentColor = colors.firstObject;
    NSPoint currentMovement;
    
    for (NSInteger i = 0; i < [colors count]; i++) {
        
        currentMovement = [[currentMovements lastObject] pointValue];
        
        currentColor = colors[i];
        [currentColor set];
        
        NSRectFill(coloredRect);
        
        if (coloredRect.origin.x + currentMovement.x > rect.size.width - coloredRect.size.width)
            currentMovement.x = -[[currentMovements lastObject] pointValue].x;
        if (coloredRect.origin.x + currentMovement.x < rect.origin.x)
            currentMovement.x = -[[currentMovements lastObject] pointValue].x;
        if (coloredRect.origin.y + currentMovement.y > rect.size.height - coloredRect.size.height)
            currentMovement.y = -[[currentMovements lastObject] pointValue].y;
        if (coloredRect.origin.y + currentMovement.y < rect.origin.y) {
            currentMovement.y = -[[currentMovements lastObject] pointValue].y;
        }
        
        coloredRect.origin.x += currentMovement.x;
        coloredRect.origin.y += currentMovement.y;
        
        [currentMovements addObject:[NSValue valueWithPoint:NSMakePoint(currentMovement.x, currentMovement.y)]];
    }
    
    for (NSInteger i = [currentMovements count] - 2; i > 0; i--) {
        currentMovement = [[currentMovements lastObject] pointValue];
        [currentMovements removeLastObject];

        coloredRect.origin.x -= currentMovement.x;
        coloredRect.origin.y -= currentMovement.y;
    }
    
    [currentMovements removeObjectAtIndex:0];
}

- (void)animateOneFrame
{
    NSColor *firstColor = [colors firstObject];
    [colors removeObjectAtIndex:0];
    [colors addObject:firstColor];
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
