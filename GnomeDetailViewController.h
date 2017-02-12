//
//  GnomeDetailViewController.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GnomeDetailViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface GnomeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (instancetype)initWithViewModel:(GnomeDetailViewModel *)viewModel;

@end
