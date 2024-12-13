package com.paginaCompras.service;

import com.paginaCompras.dao.PaginaComentariosDao;
import com.paginaCompras.domain.PaginaComentarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PaginaComentariosServiceImpl implements PaginaComentariosService {

    @Autowired
    private PaginaComentariosDao paginaComentariosDao;

    @Override
    @Transactional(readOnly = true) 
    public List<PaginaComentarios> getComentarios(Long idProducto) {
        return paginaComentariosDao.findByIdProducto(idProducto);
    }
    
}
