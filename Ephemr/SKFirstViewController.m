//
//  SKFirstViewController.m
//  Ephemr
//
//  Created by dav on 1/8/13.
//  Copyright (c) 2013 SekaiNo. All rights reserved.
//

#import "SKFirstViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SKSecondViewController.h"

@interface SKFirstViewController ()

@end

@implementation SKFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = @"Select";
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (IBAction) pickTapped:(id)sender {
  UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
  imagePicker.delegate = self;
  
  imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
  
  imagePicker.allowsEditing = YES;
  [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  [self dismissViewControllerAnimated:YES completion:nil];
  NSLog(@"Picked %@", info);
  UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
  if (image) {
    SKSecondViewController* displayController = [self.tabBarController.viewControllers objectAtIndex:1];
    if (displayController) {
      displayController.displayImage = image;
      
      NSData* imageData = UIImageJPEGRepresentation(image, 8);
      [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"imageData"];
      [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.tabBarController setSelectedIndex:1];
  }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
