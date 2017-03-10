//
//  ListaFilmes.m
//  Filme3
//
//  Created by Rodolfo Teixeira on 09/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import "ListaFilmes.h"


@interface ListaFilmes()
//faz a comunicação com site (AFTHTTP....)
@property(strong,nonatomic)AFHTTPSessionManager *Httpmaneger;




@end


@implementation ListaFilmes
//servico que gerencia a chamda do programa para não aver chamada dupla e
//gerar comflito na excução
+(instancetype)threadService {
    static ListaFilmes *__threadService=nil;
    static dispatch_once_t token;
    _dispatch_once(&token, ^{
        __threadService = [[ListaFilmes alloc]init];
        
    });
    
    return __threadService;
    
}

-(instancetype)init {
    if (self =[super init]) {
      //indica qual a URL ou site que feito a solicitação do serviço
        NSString * url =@"http://www.omdbapi.com/";
        
        self.Httpmaneger= [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:url] sessionConfiguration:nil];
        //faz a requisição do json
        self.Httpmaneger.requestSerializer =[AFJSONRequestSerializer new];
        //recebe a resposta do json
        self.Httpmaneger.responseSerializer =[AFJSONResponseSerializer new];
        [_Httpmaneger.requestSerializer setTimeoutInterval:20];
        
    }
    
    
    return self;
    
}
// foi criado un dicionario  para reseber a resposta  do "NSArray filme DA função fncFilme"
//função vai me fazer a pesuisa e retorna a resposta da pesuisa pelo "array arJson "
//função fncFilme foi declarada na classe "filme.h'
-(void)fncfilme:(NSString *)filmeNfc success:(void (^)(NSArray<filme *> *))success error:(void (^)(NSURLSessionDataTask *, NSError *))error{
    NSDictionary*dcnFilme = [NSDictionary dictionaryWithObjectsAndKeys:filmeNfc,@"s", nil];
    [self.Httpmaneger GET:@"/" parameters:dcnFilme progress:nil success:^(NSURLSessionDataTask*urlsess,id idresponse ){
        NSArray *arJson =[idresponse objectForKey:@"Search"];
        NSMutableArray* rcbLista =[NSMutableArray arrayWithCapacity:arJson.count];
        for (NSDictionary * forDcn in arJson ) {
            filme *movie = [[filme alloc] initWithData:forDcn];
            [rcbLista addObject:movie];
            NSLog(@"%@", movie.title);
            
        }
        
        success(rcbLista);
        //NSLog(@"%@", rcbLista);
        
        
    }
                 failure:error];
    
}


-(void)fncDetalhe:(NSString *)detalhe success:(void (^)(filme *))success error:(void (^)(NSURLSessionDataTask *, NSError *))error{
    NSDictionary* listF = [NSDictionary dictionaryWithObjectsAndKeys:detalhe,@"i", nil];
    
    [self.Httpmaneger GET:@"/" parameters:listF progress:nil success:^(NSURLSessionDataTask * urlsess, id  idresponse ) {
        filme *detalheFilme = [[filme alloc] initWithData:idresponse];
        success(detalheFilme);
     }
      failure:error];
}




@end
