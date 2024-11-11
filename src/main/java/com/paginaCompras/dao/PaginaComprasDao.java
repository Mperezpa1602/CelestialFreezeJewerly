package com.paginaCompras.dao;

import com.paginaCompras.domain.PaginaCompras;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaginaComprasDao extends JpaRepository<PaginaCompras,Long>{
    
}
