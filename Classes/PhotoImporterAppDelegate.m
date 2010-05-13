//
//  PhotoImporterAppDelegate.m
//  PhotoImporter
//
//  Created by Jacob Bandes-Storch on 5/12/10.
//  Copyright Jacob Bandes-Storch 2010. All rights reserved.
//

#import "PhotoImporterAppDelegate.h"

@implementation PhotoImporterAppDelegate

@synthesize window, viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	[window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

- (IBAction)importPhotos:(id)sender {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
														 NSUserDomainMask, YES);
	NSString *dir = [paths objectAtIndex:0];
	
	for (NSString *file in [[NSFileManager defaultManager] enumeratorAtPath:dir]) {
		UIImage *img = [UIImage imageWithContentsOfFile:[dir stringByAppendingPathComponent:file]];
		if (img) {
			NSLog(@"Imported %@", file);
			UIImageWriteToSavedPhotosAlbum(img, nil, nil, NULL);
		}
	}
	NSLog(@"Finished import");
}

- (IBAction)showPhotos:(UIButton *)sender {
	UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
	ipc.delegate = self;
	UIPopoverController *pc = [[UIPopoverController alloc] initWithContentViewController:ipc];
	pc.delegate = self;
	[ipc release];
	[pc presentPopoverFromRect:sender.frame
						inView:sender.superview
	  permittedArrowDirections:UIPopoverArrowDirectionUp
					  animated:YES];
}
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	[popoverController release];
}
- (void)dealloc {
	[viewController release];
    [window release];
    [super dealloc];
}


@end
