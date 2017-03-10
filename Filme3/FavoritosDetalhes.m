//
//  FavoritosDetalhes.m
//  Filme3
//
//  Created by Rodolfo Teixeira on 03/03/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import "FavoritosDetalhes.h"
#import "Favoritos.h"
#import <CoreData/CoreData.h>
#import "DetalheViewController.h"
#import "filme.h"
#import "AppDelegate.h"
#import <AFNetworking/UIImageView+AFNetworking.h>


@interface FavoritosDetalhes ()

@end

@implementation FavoritosDetalhes
@synthesize device;





- (void)viewDidLoad {
      [super viewDidLoad];
    
    

    
    
    
    //seta nos label os dados do banco 
    // modo 1
    _fdTitle.text=[NSString stringWithFormat:@"%@", [device valueForKey:@"title"]];
    _fdYear.text=[NSString stringWithFormat:@"%@", [device valueForKey:@"year"]];
    _fdRuntime.text=[NSString stringWithFormat:@"%@", [device valueForKey:@"runtime"]];
    _fdPlot.text=[NSString stringWithFormat:@"%@", [device valueForKey:@"plot"]];
    _imageString=[NSString stringWithFormat:@"%@", [device valueForKey:@"imagem"]];
    

//modo 2
    [_fdGener setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"gener"]]];
    [_fdReleased setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"released"]]];
    [_fdActor setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"actor"]]];
    
    //passa a imagemView  por url
    _imagUrl=[NSURL URLWithString:_imageString];
    [_fdImageBack setImageWithURL:_imagUrl];
    [_fdImage setImageWithURL:_imagUrl];
    
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end





