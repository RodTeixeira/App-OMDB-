//
//  DetalheViewController.m
//  Filme3
//
//  Created by Rodolfo Teixeira on 07/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import "DetalheViewController.h"
#import "filme.h"
#import "ViewController.h"
#import "ListaFilmes.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "AppDelegate.h"
#import "ListaSaveViewController.h"
#import <CoreData/CoreData.h>

@interface DetalheViewController ()




@end

@implementation DetalheViewController
-(NSManagedObjectContext *)managedObjectContext;{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    NSLog(@"%@", context);
    return context;
    
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.activiDetalhe startAnimating];
    _detalhePlot.text=@"";
    _detalheYear.text=@"";
    _detalheGener.text=@"";
    _detalheImage.image=NULL;
    _detalheTitle.text=@"";
    _detalheActors.text=@"";
    _detalheRuntime.text=@"";
    _detalheReleased.text=@"";
    
    
    


}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self pegaDetalhe];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}





-(void)pegaDetalhe {
    NSString *imdbID = self.objFilme.imdbID;
    NSLog(@"%@", imdbID);
    [[ListaFilmes threadService]fncDetalhe:imdbID success:^(filme* filme) {
        self.objFilme = filme;
        _detalheTitle.text = self.objFilme.title;
        _detalheYear.text =self.objFilme.year;
        _detalheActors.text=self.objFilme.actors;
        _detalheGener.text= self.objFilme.genre;
        _detalhePlot.text= self.objFilme.plot;
        _detalheReleased.text=self.objFilme.released;
        _detalheRuntime.text=self.objFilme.runtime;
        [_detalheImage cancelImageDownloadTask];
        
        [_detalheImage setImageWithURL: _objFilme.posterUrl];
        [_imageBack setImageWithURL:_objFilme.backUrl];
        
        [self.activiDetalhe stopAnimating];
        
    }error:^(NSURLSessionDataTask *ssessionTesk, NSError *error) {
        NSLog(@"erro");
        if (error) {
            UIAlertController * erro =[UIAlertController alertControllerWithTitle:@"ERROR" message:@"time out!" preferredStyle:UIAlertControllerStyleActionSheet];
            
            
            UIAlertAction* ok =[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [erro dismissViewControllerAnimated:YES
                 
                                         completion:^{
                                             
                                             
                                         }];
            }];
            
            [erro addAction:ok];
            [self.activiDetalhe stopAnimating];
            [self presentViewController:erro animated:YES completion:nil];
            
            
        }

        
    }];
}
- (IBAction)btnSalvar:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
   
        
    NSManagedObject *listaFav = [NSEntityDescription insertNewObjectForEntityForName:@"DBfilmes" inManagedObjectContext:context];
    [listaFav setValue:self.detalheTitle.text forKey:@"title"];
    [listaFav setValue:self.detalhePlot.text forKey:@"plot"];
    [listaFav setValue:self.detalheYear.text forKey:@"year"];
    [listaFav setValue:self.detalheActors.text forKey:@"actor"];
    [listaFav setValue:self.detalheGener.text forKey:@"gener"];
    [listaFav setValue:self.detalheRuntime.text forKey:@"runtime"];
    [listaFav setValue:self.detalheReleased.text forKey:@"released"];
    [listaFav setValue:self.objFilme.posterUrl forKey:@"imagem"];


         
        NSLog(@"%@",listaFav);
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
            
    
        }
   
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
