package com.paginaCompras.dao;

import com.paginaCompras.domain.PaginaComentarios;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaginaComentariosDao extends JpaRepository<PaginaComentarios,Long>{
    
    List<PaginaComentarios> findByIdProducto(Long idProducto);
    
}
