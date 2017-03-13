//
//  ViewController.m
//  Filme3
//
//  Created by Rodolfo Teixeira on 07/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//



#import "ViewController.h"
#import "DetalheViewController.h"
#import "ListaFilmes.h"
#import "filme.h"
#import <UIActivityIndicatorView+AFNetworking.h>
#import "Favoritos.h"

@interface ViewController ()
{
    //NSMutableArray *totalStrings;
    //NSMutableArray *filtroStrings;
    
}
 @property (weak) NSString *matrix;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // testa se a conexao com a internet
    [super viewDidLoad];
    
    [self becomeFirstResponder];
    
    NSURL * testeURL =[NSURL URLWithString:@"https://www.google.com"];
    NSData * data =[NSData  dataWithContentsOfURL:testeURL];
    if (data) {
        //ativa search bar
       self.SearchBar.delegate=self;
       self.TableView.delegate=self;
       self.TableView.dataSource=self;
      
         // retorna erro de conexão
    }else{
        UIAlertController * erro =[UIAlertController alertControllerWithTitle:@"ERROR" message:@"Sem conexao com a internet!" preferredStyle:UIAlertControllerStyleActionSheet];
        
        
        UIAlertAction* ok =[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [erro dismissViewControllerAnimated:YES
             
                                     completion:^{
                                         
                                     }];
        }];
        
        [erro addAction:ok];
        [self presentViewController:erro animated:YES completion:nil];
    }
    
}
  //informar que a view pode responder aos toques
- (BOOL)canBecomeFirstResponder {
    return YES;
}

   //desativa o teclado quando for tocado fora do SearchBar
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    //Verifique se o seu textField está com o teclado aberto e se o toque foi fora dele.
    if ([_SearchBar isFirstResponder] && [touch view] != _SearchBar) {
        [_SearchBar resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}



//metodo criado para solicitar o serviço de busca na api
-(void)rbcServico{
    
      
    _matrix = _SearchBar.text;
    [[ListaFilmes threadService] fncfilme:_matrix success:^(NSArray<filme *> *resultaFilme) {
        self.resultFilme = resultaFilme;
        [[self TableView]reloadData ];
        NSLog(@"%@",resultaFilme);
            } error:^(NSURLSessionDataTask *sessionTesk, NSError *travo) {
        NSLog(@"error");
                if (travo) {
                    UIAlertController * erro =[UIAlertController alertControllerWithTitle:@"ERROR" message:@"filme não econtrado!" preferredStyle:UIAlertControllerStyleActionSheet];
                    
                    
                    UIAlertAction* ok =[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                        [erro dismissViewControllerAnimated:YES
                        
                                                 completion:^{
                                                     
                                         
                                                 }];
                    }];
                    
                    [erro addAction:ok];
                    [self.activi stopAnimating];
                    [self presentViewController:erro animated:YES completion:nil];
                    
                    
                }
                
                
    }];
    
    
}
   // ativa a busca pelo teclado
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self rbcServico];
    [self becomeFirstResponder];
    [self.activi startAnimating];
    
}

/*
//button chama q executa o serviço
- (IBAction)btnOK:(id)sender {
    [self rbcServico];
    [self.activi startAnimating];
 
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
 
    
    filtroStrings=[[NSMutableArray alloc]init];
    //conpara a pesquisa como que esta alocado no array
    for (NSString *str in totalStrings)
    {
        NSRange stringRange=[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if (stringRange.location != NSNotFound)
        {

        
            [filtroStrings addObject:str];
            
        }
    }
    
    
    
    [self.TableView reloadData];
}

*/



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.resultFilme count];
 
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //passa os parametros para ir para outra tela
    NSLog(@"Segue para detalhe");
    DetalheViewController * detalhe = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"detalhe"];
    filme* ctrl= self.resultFilme [indexPath.row];
    detalhe.objFilme = ctrl;
    NSLog(@"%@", detalhe.objFilme);
    
    
    [self.navigationController pushViewController:detalhe animated:YES];
  //  [self textFieldShouldReturn:_SearchBar];

    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *cellIdentifier=@"Cell";
    
   
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    filme *filmeObjeto = self.resultFilme [indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat: @"%@", filmeObjeto.title];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    [self.activi stopAnimating];
  
   
    }
    // chama lista de favoritos
- (IBAction)btnLista:(id)sender {
    Favoritos * lista = [ [UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"fav"];
    
    [self.navigationController pushViewController:lista animated:YES];
    

}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
