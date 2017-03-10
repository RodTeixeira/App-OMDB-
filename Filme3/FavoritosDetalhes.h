//
//  FavoritosDetalhes.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 03/03/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritosDetalhes : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fdImage;
@property (weak, nonatomic) IBOutlet UIImageView *fdImageBack;
@property (weak, nonatomic) IBOutlet UILabel *fdTitle;
@property (weak, nonatomic) IBOutlet UILabel *fdYear;
@property (weak, nonatomic) IBOutlet UILabel *fdReleased;
@property (weak, nonatomic) IBOutlet UILabel *fdRuntime;
@property (weak, nonatomic) IBOutlet UILabel *fdGener;
@property (weak, nonatomic) IBOutlet UILabel *fdActor;
@property (weak, nonatomic) IBOutlet UILabel *fdPlot;

@property(strong) NSManagedObjectModel *device;


@property (strong,nonatomic)NSURL*imagUrl;
@property (strong,nonatomic)NSString* imageString;

@end
