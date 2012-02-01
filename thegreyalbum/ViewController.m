//
//  ViewController.m
//  thegreyalbum
//
//  Created by Naveen Selvadurai on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "../submodules/greyscale-uiimage/UIImage+Greyscale.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor blackColor];
//    
//    UIImage *image = [UIImage imageNamed:@"art.jpg"];
//    UIImageView *iv = [[UIImageView alloc] initWithImage:[image greyscale]];
//    [iv setFrame:CGRectMake(0, 100, 320, 239)];
//    [self.view addSubview:iv];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showPicker];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark image picker

- (void)showPicker
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [picker setDelegate:self];
    picker.allowsEditing = NO;
    
    [self presentModalViewController:picker animated:NO];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // save image
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // left the error condition nil for now; @selector(image:finishedSavingWithError:contextInfo:)
        UIImageWriteToSavedPhotosAlbum([image convertToGreyscale], self, nil, nil);
    }

    // dismiss picker
    [self dismissModalViewControllerAnimated:NO];
    
    // show picker
    [self showPicker];
}

// TODO figure out a way to override cancel
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
}

@end
