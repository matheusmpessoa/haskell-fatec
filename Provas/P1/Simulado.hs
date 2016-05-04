{-Objetos A,B,C
    ob(C) = {A,B,C}
    hom(C) = {idA,idB,idC,f,g} //vide apostila (.pdf)
    idA :: A -> A
    idB :: B -> B
    idC :: C -> C
    f :: C -> B
    g :: A -> B
    fg :: A->(B->C)  // expressao/funcao
    fg : f.g  //canarozo
    CORRETO (PELO PROFESSOR) ::: h = f.g
    
    Elemento neutro
    idB . f = f = f . idA
    No caso acima, idA e idB sao elementos neutros, pois nao causam impacto em f. COMO
    SE FOSSE MONOIDES
    
    Associatividade (teoria das categorias):
    (h.g).f = h.(g.f)
    (taxi da balsa pro pereque).onibus pra balsa = (helicoptero de santos p/ centro gja).onibus centro gja ate pereque
    ONDE: 
    (h.g) -- taxi da balsa p/ pereque
    f (esquerda) -- onibus p/ balsa
    (g.f) -- helicoptero de santos para centro guaruja
    h (direita) -- onibus do centro do gja ate o pereque
    
        
    
    (VIDE PDF)
    f :: A->B
    h :: A->B
    g :: B->A
    idA = A
    idB = B
    
    (h.g).f = idB . f = f
    h.(g.f) = h .idA = h
    
-}