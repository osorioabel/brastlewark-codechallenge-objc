//
//  GnomeTableViewCell.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GnomeCellViewModel.h"
#import "Gnome.h"

@interface GnomeTableViewCell : UITableViewCell

@property (strong,nonatomic) GnomeCellViewModel * viewModel;
@property (strong,nonatomic) Gnome * gnome;
@property (strong,nonatomic) NSString * name;

@end
