//
//  AreaViewController.m
//  ClimbStreets
//
//  Created by 4g on 11/5/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "AreaViewController.h"

@interface AreaViewController ()

@end

@implementation AreaViewController
@synthesize buttonsCanvas;
@synthesize tableCanvas;
@synthesize selectSectors;
@synthesize selectRoutes;
@synthesize descricao;
@synthesize areaName;
@synthesize photosCanvas;
   BOOL showDescricao;

CGRect rectIni;
CGRect rectFull;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {  showDescricao = NO;}
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
  
    self.descricao.text = [self simulateText];
    self.descricao.delegate = self;
    rectIni = self.descricao.frame;
   // rectIni = CGRectMake(0, 170.0f, 320.0f, 57.0f);
    rectFull = CGRectMake(0, 170.0f, 320.0f, (WALK+20.0f));
    
}

float WALK = 270.0f;


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView2{
    
 if(scrollView2.contentOffset.y == 0.0 && showDescricao){
     [UIView beginAnimations:nil context:nil];
     [UIView setAnimationDuration:0.5];
     [UIView setAnimationDelay:0];
     [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
     
     self.buttonsCanvas.frame =
     CGRectMake(self.buttonsCanvas.frame.origin.x,
                (self.buttonsCanvas.frame.origin.y-WALK),
                self.buttonsCanvas.frame.size.width,
                self.buttonsCanvas.frame.size.height);
     
     self.selectRoutes.frame =
     CGRectMake(self.selectRoutes.frame.origin.x,
                (self.selectRoutes.frame.origin.y-WALK),
                self.selectRoutes.frame.size.width,
                self.selectRoutes.frame.size.height);
     
     self.selectSectors.frame =
     CGRectMake(self.selectSectors.frame.origin.x,
                (self.selectSectors.frame.origin.y-WALK),
                self.selectSectors.frame.size.width,
                self.selectSectors.frame.size.height);
     
     self.tableCanvas.frame =
     CGRectMake(self.tableCanvas.frame.origin.x,
                (self.tableCanvas.frame.origin.y-WALK),
                self.tableCanvas.frame.size.width,
                self.tableCanvas.frame.size.height);
     
     showDescricao = NO;
     
     self.descricao.frame = rectIni;
     
     [UIView commitAnimations];
     
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.y == 0.0f && !showDescricao){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelay:0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        
        self.buttonsCanvas.frame =
        CGRectMake(self.buttonsCanvas.frame.origin.x,
                   (self.buttonsCanvas.frame.origin.y+WALK),
                   self.buttonsCanvas.frame.size.width,
                   self.buttonsCanvas.frame.size.height);
        
        self.selectRoutes.frame =
        CGRectMake(self.selectRoutes.frame.origin.x,
                   (self.selectRoutes.frame.origin.y+WALK),
                   self.selectRoutes.frame.size.width,
                   self.selectRoutes.frame.size.height);
        
        self.selectSectors.frame =
        CGRectMake(self.selectSectors.frame.origin.x,
                   (self.selectSectors.frame.origin.y+WALK),
                   self.selectSectors.frame.size.width,
                   self.selectSectors.frame.size.height);
        
        self.tableCanvas.frame =
        CGRectMake(self.tableCanvas.frame.origin.x,
                   (self.tableCanvas.frame.origin.y+WALK),
                   self.tableCanvas.frame.size.width,
                   self.tableCanvas.frame.size.height);
        showDescricao = YES;
        self.descricao.frame = rectFull;
        [UIView commitAnimations];
    }
}

-(IBAction)backAction {
    [self dismissViewControllerAnimated:YES completion:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




-(NSString*)simulateText{
    return @"A Serra de São Luiz do Purunã é um acidente geográfico localizado na região dos Campos Gerais do Paraná entre o Primeiro Planalto Paranaense e o Segundo Planalto Paranaense. É o ponto culminante do município de Campo Largo e tem 1270 metros de altitude. Distrito de Balsa Nova, município da Região Metropolitana de Curitiba, São Luiz do Purunã fica a cerca de 45 quilômetros da capital paranaense. Para chegar lá basta seguir pela rodovia BR-277, duplicada, em direção ao norte do estado. Quem gosta de aventura pode optar pela histórica Estrada da Faxina, de terra, vencendo o trecho de serra para chegar ao centro da vila, onde até o ano 2002 acontecia uma movimentada festa de rodeio. locais de hospedagem e lazer é possível estadas mais prolongadas, com todo conforto, ou simplesmente um dia no campo, contemplando a natureza, andando a cavalo e saboreando delícias culinárias nos restaurantes abertos ao público nos finais de semana. A região é tão encantadora, sossegada e com alto astral a ponto de frequentadores mais assíduos estarem impulsionando um boom imobiliário, ao adquirirem chácaras para construção de residências de lazer. O ator global Luiz Melo, por exemplo é um desses felizes novos proprietários. Além dos campos e dos paredões rochosos, a região é marcada por muitos, e aprazíveis, bosques. A Serra de São Luiz do Purunã é um acidente geográfico localizado na região dos Campos Gerais do Paraná entre o Primeiro Planalto Paranaense e o Segundo Planalto Paranaense. É o ponto culminante do município de Campo Largo e tem 1270 metros de altitude. Distrito de Balsa Nova, município da Região Metropolitana de Curitiba, São Luiz do Purunã fica a cerca de 45 quilômetros da capital paranaense. Para chegar lá basta seguir pela rodovia BR-277, duplicada, em direção ao norte do estado. Quem gosta de aventura pode optar pela histórica Estrada da Faxina, de terra, vencendo o trecho de serra para chegar ao centro da vila, onde até o ano 2002 acontecia uma movimentada festa de rodeio. locais de hospedagem e lazer é possível estadas mais prolongadas, com todo conforto, ou simplesmente um dia no campo, contemplando a natureza, andando a cavalo e saboreando delícias culinárias nos restaurantes abertos ao público nos finais de semana. A região é tão encantadora, sossegada e com alto astral a ponto de frequentadores mais assíduos estarem impulsionando um boom imobiliário, ao adquirirem chácaras para construção de residências de lazer. O ator global Luiz Melo, por exemplo é um desses felizes novos proprietários. Além dos campos e dos paredões rochosos, a região é marcada por muitos, e aprazíveis, bosques.A Serra de São Luiz do Purunã é um acidente geográfico localizado na região dos Campos Gerais do Paraná entre o Primeiro Planalto Paranaense e o Segundo Planalto Paranaense. É o ponto culminante do município de Campo Largo e tem 1270 metros de altitude. Distrito de Balsa Nova, município da Região Metropolitana de Curitiba, São Luiz do Purunã fica a cerca de 45 quilômetros da capital paranaense. Para chegar lá basta seguir pela rodovia BR-277, duplicada, em direção ao norte do estado. Quem gosta de aventura pode optar pela histórica Estrada da Faxina, de terra, vencendo o trecho de serra para chegar ao centro da vila, onde até o ano 2002 acontecia uma movimentada festa de rodeio. locais de hospedagem e lazer é possível estadas mais prolongadas, com todo conforto, ou simplesmente um dia no campo, contemplando a natureza, andando a cavalo e saboreando delícias culinárias nos restaurantes abertos ao público nos finais de semana. A região é tão encantadora, sossegada e com alto astral a ponto de frequentadores mais assíduos estarem impulsionando um boom imobiliário, ao adquirirem chácaras para construção de residências de lazer. O ator global Luiz Melo, por exemplo é um desses felizes novos proprietários. Além dos campos e dos paredões rochosos, a região é marcada por muitos, e aprazíveis, bosques. A Serra de São Luiz do Purunã é um acidente geográfico localizado na região dos Campos Gerais do Paraná entre o Primeiro Planalto Paranaense e o Segundo Planalto Paranaense. É o ponto culminante do município de Campo Largo e tem 1270 metros de altitude. Distrito de Balsa Nova, município da Região Metropolitana de Curitiba, São Luiz do Purunã fica a cerca de 45 quilômetros da capital paranaense. Para chegar lá basta seguir pela rodovia BR-277, duplicada, em direção ao norte do estado. Quem gosta de aventura pode optar pela histórica Estrada da Faxina, de terra, vencendo o trecho de serra para chegar ao centro da vila, onde até o ano 2002 acontecia uma movimentada festa de rodeio. locais de hospedagem e lazer é possível estadas mais prolongadas, com todo conforto, ou simplesmente um dia no campo, contemplando a natureza, andando a cavalo e saboreando delícias culinárias nos restaurantes abertos ao público nos finais de semana. A região é tão encantadora, sossegada e com alto astral a ponto de frequentadores mais assíduos estarem impulsionando um boom imobiliário, ao adquirirem chácaras para construção de residências de lazer. O ator global Luiz Melo, por exemplo é um desses felizes novos proprietários. Além dos campos e dos paredões rochosos, a região é marcada por muitos, e aprazíveis, bosques.";
}

@end
