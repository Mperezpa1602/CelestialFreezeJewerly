package com.paginaCompras.service;

import com.paginaCompras.domain.PaginaComentarios;
import java.util.List;

public interface PaginaComentariosService {

    //Selecciona en base de un id especifico
    List<PaginaComentarios> getComentarios(Long productoId);

}
