//
//  PhotoImporterAppDelegate.h
//  PhotoImporter
//
//  Created by Jacob Bandes-Storch on 5/12/10.
//  Copyright Jacob Bandes-Storch 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoImporterAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate> {
    UIWindow *window;
	UIViewController *viewController;
	UIPopoverController *popover;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;

- (IBAction)importPhotos:(id)sender;
- (IBAction)showPhotos:(id)sender;

@end

