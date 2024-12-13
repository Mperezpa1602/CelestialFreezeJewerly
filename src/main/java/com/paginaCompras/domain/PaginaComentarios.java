package com.paginaCompras.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

//Import de lombok.Data
@Data
@Entity
//Apunta a la tabla que se va a usar
@Table(name = "comentarios")

public class PaginaComentarios {
    
    //Se incrementa en una unidad (para el auto incrementable de productos)
    private static final long serialVersionUID = 1L;
    
    //Genera la estragegia de llave de identidad
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    //Se asocian los datos con las columnas del esquema
    //Como buena practica, las variables no llevaban "_"
    //Entonces, se le apunta a cual columna va
    @Column(name = "comentario_id")
    private long idComentario;
    @Column(name = "producto_id")
    private long idProducto;
    @Column(name = "comentario_texto")
    private String txtcomentario;

    public PaginaComentarios() {
    }

    public PaginaComentarios(long idProducto, String txtcomentario) {
        this.idProducto = idProducto;
        this.txtcomentario = txtcomentario;
    }            
    
}
