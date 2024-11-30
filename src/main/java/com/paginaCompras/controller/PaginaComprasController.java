package com.paginaCompras.controller;

import com.paginaCompras.domain.PaginaCompras;
import com.paginaCompras.service.PaginaComprasService;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/productos")

public class PaginaComprasController {

    @Autowired
    private PaginaComprasService paginaComprasService;

    //Devuelve la lista complete, la cual sera filtrada para descuentos.
    @GetMapping(value = "/paginaComprasDescuento")
    public String listado(Model model) {
        var lista = paginaComprasService.getComprases();
        model.addAttribute("productos", lista);
        //model.addAttribute("totalProductos", lista.size());
        return "/productos/paginaComprasDescuento";
    }

    //Muestra solo productos en tendencia
    @GetMapping(value = "/paginaComprasTendencias")
    public String mostrarTendencias(Model model) {
        var lista = paginaComprasService.getComprases();

        // Filtra solo los productos que están en tendencia y sean a igual "Si"
        var productosEnTendencia = lista.stream()
                .filter(producto -> "Si".equals(producto.getTendencias()))
                .collect(Collectors.toList());

        model.addAttribute("productos", productosEnTendencia);
        return "/productos/paginaComprasTendencias";
    }
    
    //Muestra el catalogo completo
    @GetMapping(value = "/paginaComprasCatalogo")
    public String mostrarCatalogo(Model model) {
        var lista = paginaComprasService.getComprases();
        model.addAttribute("productos", lista);
        //model.addAttribute("totalProductos", lista.size());
        return "/productos/paginaComprasCatalogo";
    }

}
