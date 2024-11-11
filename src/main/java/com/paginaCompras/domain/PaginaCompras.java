package com.paginaCompras.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

//Import de lombok.Data
@Data
@Entity
//Apunta a la tabla que se va a usar
@Table(name = "productos")

public class PaginaCompras implements Serializable {

    //Se incrementa en una unidad (para el auto incrementable de productos)
    private static final long serialVersionUID = 1L;

    //Genera la estragegia de llave de identidad
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    //Se asocian los datos con las columnas del esquema
    //Como buena practica, las variables no llevaban "_"
    //Entonces, se le apunta a cual columna va
    @Column(name = "product_id")
    private long idProducto;
    @Column(name = "product_name")
    private String nombreProducto;
    @Column(name = "product_price")
    private BigDecimal precioProducto;
    @Column(name = "discount_price")
    private BigDecimal precioDescuento;
    @Column(name = "product_image")
    private String imagenProducto;
    @Column(name = "tendencias")
    private String tendencias;

    public PaginaCompras() {
    }

    public PaginaCompras(String nombreProducto, BigDecimal precioProducto, BigDecimal precioDescuento, String imagenProducto, String tendencias) {
        this.nombreProducto = nombreProducto;
        this.precioProducto = precioProducto;
        this.precioDescuento = precioDescuento;
        this.imagenProducto = imagenProducto;
        this.tendencias = tendencias;
    }

    

}
