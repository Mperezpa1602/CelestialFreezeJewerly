package com.paginaCompras.controller;

import com.paginaCompras.domain.PaginaComentarios;
import com.paginaCompras.domain.PaginaCompras;
import com.paginaCompras.service.PaginaComentariosService;
import com.paginaCompras.service.PaginaComprasService;
import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/productos")

public class PaginaComprasController {

    @Autowired
    private PaginaComprasService paginaComprasService;

    @Autowired
    private PaginaComentariosService paginaComentariosService;

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
                .filter(producto -> "SI".equals(producto.getTendencias()))
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

    //Procedimiento que recibe un String de parametro desde la barra de busqueda
    @GetMapping(value = "/buscarProductos")
    public String buscarProductos(@RequestParam(name = "buscarTendencia") String buscarTendencia, Model model) {
        var lista = paginaComprasService.getComprases();

        //Busca los productos que contengan el string buscado y que esten en tendencia
        var productosBuscados = lista.stream()
                .filter(producto -> producto.getNombreProducto().toLowerCase().contains(buscarTendencia.toLowerCase()) && "Si".equals(producto.getTendencias()))
                .collect(Collectors.toList());

        //Agrega al modelo los productos encontrados
        model.addAttribute("productos", productosBuscados);
        return "/productos/paginaComprasTendencias";
    }

    //Procedimiento para buscar en Descuentos
    @GetMapping(value = "/buscarDescuentos")
    public String buscarDescuentos(@RequestParam(name = "buscarDescuento") String buscarDescuento, Model model) {
        var lista = paginaComprasService.getComprases();

        //Busca el producto con el nombre y que tenga un descuento
        var descuentosBuscados = lista.stream()
                .filter(producto -> producto.getNombreProducto().toLowerCase().contains(buscarDescuento.toLowerCase())
                && producto.getPrecioDescuento().compareTo(BigDecimal.ZERO) > 0)
                .collect(Collectors.toList());
        //Agrega al modelo los productos encontrados
        model.addAttribute("descuentos", descuentosBuscados);
        return "/productos/paginaComprasDescuento";
    }

    //Procedimiento para buscar en Catalogo
    @GetMapping(value = "/buscarCatalogo")
    public String buscarCatalogo(@RequestParam(name = "buscarProducto") String buscarProducto, Model model) {
        var lista = paginaComprasService.getComprases();

        //Busca el producto con el nombre
        var productosBuscados = lista.stream()
                .filter(producto -> producto.getNombreProducto().toLowerCase().contains(buscarProducto.toLowerCase()))
                .collect(Collectors.toList());
        //Agrega al modelo los productos encontrados
        model.addAttribute("productos", productosBuscados);
        return "/productos/paginaComprasCatalogo";
    }

    @GetMapping("/detalle/{id}")
    public String mostrarDetalleProducto(@PathVariable("id") Long id, Model model) {
        PaginaCompras producto = paginaComprasService.getComprasById(id);
        List<PaginaComentarios> comentarios = paginaComentariosService.getComentarios(id);
        model.addAttribute("producto", producto);
        model.addAttribute("comentarios", comentarios);
        return "/productos/detalleProducto";
    }

}
