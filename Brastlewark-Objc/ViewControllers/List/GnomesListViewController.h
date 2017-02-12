//
//  GnomesListViewController.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GnomesListViewModel.h"

@interface GnomesListViewController : UIViewController

- (instancetype)initWithViewModel:(GnomesListViewModel *)viewModel;

@end
