REPORT z_manipula_extensao_arquivo.

CLASS zcl_util_arquivo DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_arquivo TYPE string,
      separar_extensao,
      get_extensao RETURNING VALUE(rv_extensao) TYPE string,
      get_caminho_sem_extensao RETURNING VALUE(rv_caminho) TYPE string.

  PRIVATE SECTION.
    DATA:
      mv_arquivo         TYPE string,
      mv_extensao        TYPE string,
      mv_caminho_sem_ext TYPE string.
ENDCLASS.

CLASS zcl_util_arquivo IMPLEMENTATION.

  METHOD constructor.
    mv_arquivo = iv_arquivo.
  ENDMETHOD.

  METHOD separar_extensao.
    DATA(lv_ultimo_ponto) = find( val = mv_arquivo sub = '.' occ = -1 ).

    IF lv_ultimo_ponto > 0.
      mv_extensao        = mv_arquivo+lv_ultimo_ponto.
      mv_caminho_sem_ext = mv_arquivo(lv_ultimo_ponto).
    ELSE.
      mv_extensao        = ''.
      mv_caminho_sem_ext = mv_arquivo.
    ENDIF.
  ENDMETHOD.

  METHOD get_extensao.
    rv_extensao = mv_extensao.
  ENDMETHOD.

  METHOD get_caminho_sem_extensao.
    rv_caminho = mv_caminho_sem_ext.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA(lo_util) = NEW zcl_util_arquivo( iv_arquivo = 'relatorio_final_2025.pdf' ).

  lo_util->separar_extensao( ).

  WRITE: / 'Extensão:', lo_util->get_extensao( ).
  WRITE: / 'Caminho sem extensão:', lo_util->get_caminho_sem_extensao( ).
