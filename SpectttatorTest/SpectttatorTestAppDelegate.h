//
//  SpectttatorTestAppDelegate.h
//  SpectttatorTest
//
//  Created by David Keegan on 6/25/11.
//  Copyright 2011 InScopeApps {+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpectttatorTestAppDelegate : NSObject <NSApplicationDelegate, NSTextViewDelegate> {
    NSWindow *_window;
    NSProgressIndicator *_spinner;
    NSTextField *_username;
    NSTextView *_shots;
    NSPopUpButton *_listPopup;
    NSTextView *_listShots;
    BOOL _userUpdating, _listUpdating;
}

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSProgressIndicator *spinner;
@property (strong) IBOutlet NSTextField *username;
@property (assign) IBOutlet NSTextView *shots;
@property (assign) IBOutlet NSPopUpButton *listPopup;
@property (assign) IBOutlet NSTextView *listShots;
@property BOOL userUpdating, listUpdating;

- (IBAction)userChanged:(id)sender;
- (IBAction)listChanged:(id)sender;

@end