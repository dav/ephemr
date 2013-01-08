//
//  SKFirstViewController.h
//  Ephemr
//
//  Created by dav on 1/8/13.
//  Copyright (c) 2013 SekaiNo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFirstViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) IBOutlet UIButton* pickButton;

- (IBAction) pickTapped:(id)sender;

@end
