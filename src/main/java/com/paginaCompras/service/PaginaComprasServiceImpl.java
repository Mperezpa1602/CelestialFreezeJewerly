/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.paginaCompras.service;

import com.paginaCompras.domain.PaginaCompras;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.paginaCompras.dao.PaginaComprasDao;

@Service
public class PaginaComprasServiceImpl implements PaginaComprasService{
    
    @Autowired
    private PaginaComprasDao paginaComprasDao;
    
    @Override
    //Se setea como read only, ya que es una consulta.
    @Transactional(readOnly = true)
    
    //Proceso para cargas los productos
    public List<PaginaCompras> getComprases() {
        //Mete los producto dentro de una lista y la devuelve.
        var lista = paginaComprasDao.findAll();        
        return lista;
    }
    
    @Override
    //Se setea como read only, ya que es una consulta.
    @Transactional(readOnly = true)
    //Proceso el cual carga el producto por id buscado
    public PaginaCompras getComprases(PaginaCompras paginaCompras){
        //Retorna el producto encontrado, si no encuentra, devuelve null.
        return paginaComprasDao.findById(paginaCompras.getIdProducto()).orElse(null);
    }
    
}
