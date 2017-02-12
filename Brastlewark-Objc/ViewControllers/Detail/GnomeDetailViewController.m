//
//  GnomeDetailViewController.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomeDetailViewController.h"
#import "GnomeDetailViewModel.h"
#import "Brastlewark_Objc-Swift.h"

@interface GnomeDetailViewController ()

@property (nonatomic, strong, readonly) GnomeDetailViewModel *viewModel;

@end

@implementation GnomeDetailViewController

#pragma mark - Lifecycle

- (instancetype)initWithViewModel:(GnomeDetailViewModel *)viewModel {
	self = [super initWithNibName:@"GnomeDetailViewController" bundle:nil];
	if (!self) return nil;
	
	_viewModel = viewModel;
	
	return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = [self.viewModel title ];
	self.view.backgroundColor = [UIColor blackColor];
	[self setupView ];
}

- (void)setupView{
	self.nameLabel.text = [self.viewModel name ];
	[self.imageView sd_setImageWithURL:[self.viewModel thumbnail]];
	self.descriptionLabel.text = [self.viewModel detail ];
	self.imageView.userInteractionEnabled = YES;
	ImagePinchGestureRecognizer *gesture = [[ImagePinchGestureRecognizer alloc] initWithTarget:self action:nil];
	[self.imageView addGestureRecognizer:gesture];
}

@end
