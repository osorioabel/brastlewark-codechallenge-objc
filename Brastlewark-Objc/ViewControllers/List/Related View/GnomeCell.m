//
//  GnomeCell.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomeCell.h"
#import "Brastlewark_Objc-Swift.h"


@implementation GnomeCell

@synthesize nameLabel,imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	self.imageView.userInteractionEnabled = YES;
	ImagePinchGestureRecognizer *gesture = [[ImagePinchGestureRecognizer alloc] initWithTarget:self action:nil];
	[self.imageView addGestureRecognizer:gesture];
}

- (void)prepareForReuse{
	self.nameLabel.text = nil;
	self.imageView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateWithGnome:(Gnome*) gnome{
	self.nameLabel.text = gnome.name;
	[self.imageView sd_setImageWithURL:gnome.thumbnail];
}

@end
