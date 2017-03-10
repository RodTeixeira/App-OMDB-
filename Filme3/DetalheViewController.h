//
//  DetalheViewController.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 07/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "filme.h"

@interface DetalheViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageBack;
@property (strong, nonatomic) IBOutlet UIImageView *detalheImage;
@property (weak, nonatomic) IBOutlet UILabel *detalheTitle;
@property (weak, nonatomic) IBOutlet UILabel *detalheYear;
@property (strong, nonatomic) IBOutlet UILabel *detalheReleased;
@property (weak, nonatomic) IBOutlet UILabel *detalheRuntime;
@property (weak, nonatomic) IBOutlet UILabel *detalheGener;
@property (weak, nonatomic) IBOutlet UILabel *detalheActors;
@property (weak, nonatomic) IBOutlet UILabel *detalhePlot;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activiDetalhe;
@property (weak, nonatomic) IBOutlet UIButton *btnSalvar;



@property (strong,nonatomic) filme* objFilme;







@end
