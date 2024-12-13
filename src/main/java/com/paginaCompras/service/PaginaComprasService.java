package com.paginaCompras.service;

import com.paginaCompras.domain.PaginaCompras;
import java.util.List;

public interface PaginaComprasService {
    
    //Se carga en una lista lo que tiene prodcuto
    public List<PaginaCompras> getComprases();
    
    //Select en base a un id
    public PaginaCompras getComprases(PaginaCompras paginaCompras);
    
    //Selecciona en base de un iod especifico
    public PaginaCompras getComprasById(Long id);
    
}
