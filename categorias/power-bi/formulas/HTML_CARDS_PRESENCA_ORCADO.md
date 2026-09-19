HTML_CARDS_PRESENCA_ORCADO = // HTML_CARDS_PRESENCA_ORCADO
// 4 KPI cards: Escalados Hoje · Real HC · Orçado · Terceiros
// Responde ao contexto de filtros (data, área, turno, etc.)

VAR _datas_slicer  = DISTINCT(CONTROLE_PRESENCA[Data])
VAR _maxData_try   = CALCULATE(MAX('FAT_SUPP_PRESENÇAS_DIA'[Data]), TREATAS(_datas_slicer, 'FAT_SUPP_PRESENÇAS_DIA'[Data]))
VAR _maxData       = _maxData_try
VAR _maxDataTerc_try = CALCULATE(MAX(FAT_TERCEIROS_UDI[DATA_PRESENCA]), TREATAS(_datas_slicer, FAT_TERCEIROS_UDI[DATA_PRESENCA]))
VAR _maxDataTerc = _maxDataTerc_try

VAR _escal_raw = CALCULATE(
    SUM('FAT_SUPP_PRESENÇAS_DIA'[Contagem]),
    'FAT_SUPP_PRESENÇAS_DIA'[Status] = "-",
    'FAT_SUPP_PRESENÇAS_DIA'[Data] = _maxData,
    TREATAS(VALUES(DIM_AREA[Área]), 'FAT_SUPP_PRESENÇAS_DIA'[AREA])
)
VAR _escal = IF(ISBLANK(_escal_raw), 0, _escal_raw)
VAR _real  = IF(ISBLANK([QTDE_REAL]),    0, [QTDE_REAL])
VAR _orc   = IF(ISBLANK([QTDE_ORCADOS]), 0, [QTDE_ORCADOS])
VAR _terc_n = IF(
    ISBLANK(CALCULATE([QTD_TERCEIROS], REMOVEFILTERS(FAT_TERCEIROS_UDI), FAT_TERCEIROS_UDI[DATA_PRESENCA] = _maxDataTerc)),
    0,
    CALCULATE([QTD_TERCEIROS], REMOVEFILTERS(FAT_TERCEIROS_UDI), FAT_TERCEIROS_UDI[DATA_PRESENCA] = _maxDataTerc)
)
VAR _terc_fmt = FORMAT(_maxDataTerc, "DD/MM")

VAR _dif_escal = _real - _escal
VAR _dif_real  = _orc  - _real
VAR _gap_pct   = FORMAT(DIVIDE(_orc - _real, _orc, 0) * 100, "0") & "%"
VAR _real_pct  = FORMAT(DIVIDE(_real, _orc, 0), "0%")

// Cargo com maior presença no dia (top 1 por QTD)
VAR _terc_cargo =
    MAXX(
        TOPN(1,
            SUMMARIZE(
                FILTER(FAT_TERCEIROS_UDI, FAT_TERCEIROS_UDI[DATA_PRESENCA] = _maxDataTerc),
                FAT_TERCEIROS_UDI[CARGO], "C", SUM(FAT_TERCEIROS_UDI[NUM])
            ),
            [C], DESC
        ),
        FAT_TERCEIROS_UDI[CARGO]
    )
// Qtd de cargos distintos no dia
VAR _qtd_cargos =
    CALCULATE(
        DISTINCTCOUNT(FAT_TERCEIROS_UDI[CARGO]),
        REMOVEFILTERS(FAT_TERCEIROS_UDI),
        FAT_TERCEIROS_UDI[DATA_PRESENCA] = _maxDataTerc
    )
// Sub-texto: lista todos os cargos separados por " · " (ordenados por QTD desc)
VAR _cargos_sub =
    CONCATENATEX(
        TOPN(99,
            SUMMARIZE(
                FILTER(FAT_TERCEIROS_UDI, FAT_TERCEIROS_UDI[DATA_PRESENCA] = _maxDataTerc),
                FAT_TERCEIROS_UDI[CARGO], "C", SUM(FAT_TERCEIROS_UDI[NUM])
            ),
            [C], DESC
        ),
        FAT_TERCEIROS_UDI[CARGO],
        " &middot; ",
        [C], DESC
    )
// Sub-texto final: data + cargos
VAR _cargo_sub =
    IF(ISBLANK(_terc_cargo), "sem terceiros", _terc_fmt & " &middot; " & _cargos_sub)
// Badge: top cargo (+ N outros se houver mais de 1)
VAR _cargo_badge =
    IF(ISBLANK(_terc_cargo), "Terceiros",
        IF(_qtd_cargos = 1,
            IF(LEN(_terc_cargo) > 22, LEFT(_terc_cargo, 20) & "…", _terc_cargo),
            IF(LEN(_terc_cargo) > 14, LEFT(_terc_cargo, 12) & "…", _terc_cargo) &
            " +" & FORMAT(_qtd_cargos - 1, "0") & IF(_qtd_cargos - 1 > 1, " cargos", " cargo")
        )
    )

VAR _escal_badge =
    IF(_dif_escal >= 0,
        "&#9660; " & FORMAT(_dif_escal, "0") & " vs Real HC",
        "&#9650; " & FORMAT(ABS(_dif_escal), "0") & " vs Real HC"
    )
VAR _real_badge =
    IF(_dif_real >= 0,
        "&#9660; " & FORMAT(_dif_real, "0") & " vs Or&ccedil;ado",
        "&#9650; " & FORMAT(ABS(_dif_real), "0") & " vs Or&ccedil;ado"
    )

// Cores dos badges
VAR _escal_badge_cor = IF(_dif_escal > 0, "rgba(240,68,56,.15)", IF(_dif_escal < 0, "rgba(41,196,107,.15)", "rgba(255,255,255,.06)"))
VAR _escal_badge_txt = IF(_dif_escal > 0, "#F04438", IF(_dif_escal < 0, "#29C46B", "#8CA0B3"))
VAR _real_badge_cor  = IF(_dif_real > 0, "rgba(240,68,56,.15)", IF(_dif_real < 0, "rgba(41,196,107,.15)", "rgba(255,255,255,.06)"))
VAR _real_badge_txt  = IF(_dif_real > 0, "#F04438", IF(_dif_real < 0, "#29C46B", "#8CA0B3"))

RETURN
IF(ISBLANK(_orc), "",

"<style>*{box-sizing:border-box;margin:0;padding:0;}html,body{height:100%;background:#212B36;}</style>" &
"<div style='font-family:Segoe UI,sans-serif;background:#212B36;height:100%;display:grid;grid-template-columns:repeat(4,1fr);gap:14px;padding:14px;align-content:start;'>" &

// ── Card 1: Escalados Hoje
"<div style='background:#1A2330;border:1px solid #2E3D4F;border-radius:6px;padding:18px 20px;position:relative;overflow:hidden;'>" &
    "<div style='position:absolute;top:0;left:0;right:0;height:3px;background:#F37E38;'></div>" &
    "<div style='font-size:24px;font-weight:500;letter-spacing:2px;color:#8CA0B3;text-transform:uppercase;margin-bottom:8px;'>Escalados Hoje</div>" &
    "<div style='font-size:42px;font-weight:400;line-height:1;letter-spacing:-1px;color:#F37E38;'>" & FORMAT(_escal, "0") & "</div>" &
    "<div style='font-size:20px;color:#8CA0B3;margin-top:6px;font-family:Courier New,monospace;'>colaboradores no dia</div>" &
    "<div style='display:inline-flex;align-items:center;gap:4px;font-size:20px;font-weight:600;padding:2px 7px;border-radius:3px;margin-top:8px;background:" & _escal_badge_cor & ";color:" & _escal_badge_txt & ";'>" & _escal_badge & "</div>" &
"</div>" &

// ── Card 2: Real Head Count
"<div style='background:#1A2330;border:1px solid #2E3D4F;border-radius:6px;padding:18px 20px;position:relative;overflow:hidden;'>" &
    "<div style='position:absolute;top:0;left:0;right:0;height:3px;background:#F37E38;opacity:0.5;'></div>" &
    "<div style='font-size:24px;font-weight:500;letter-spacing:2px;color:#8CA0B3;text-transform:uppercase;margin-bottom:8px;'>Real Head Count</div>" &
    "<div style='font-size:42px;font-weight:400;line-height:1;letter-spacing:-1px;color:#FFFFFF;'>" & FORMAT(_real, "0") & " / " & _real_pct & "</div>" &
    "<div style='font-size:20px;color:#8CA0B3;margin-top:6px;font-family:Courier New,monospace;'>colaboradores ativos</div>" &
    "<div style='display:inline-flex;align-items:center;gap:4px;font-size:20px;font-weight:600;padding:2px 7px;border-radius:3px;margin-top:8px;background:" & _real_badge_cor & ";color:" & _real_badge_txt & ";'>" & _real_badge & "</div>" &
"</div>" &

// ── Card 3: Orçado Total
"<div style='background:#1A2330;border:1px solid #2E3D4F;border-radius:6px;padding:18px 20px;position:relative;overflow:hidden;'>" &
    "<div style='position:absolute;top:0;left:0;right:0;height:3px;background:#F04438;'></div>" &
    "<div style='font-size:24px;font-weight:500;letter-spacing:2px;color:#8CA0B3;text-transform:uppercase;margin-bottom:8px;'>Or&ccedil;ado Total</div>" &
    "<div style='font-size:42px;font-weight:400;line-height:1;letter-spacing:-1px;color:#FFFFFF;'>" & FORMAT(_orc, "0") & "</div>" &
    "<div style='font-size:20px;color:#8CA0B3;margin-top:6px;font-family:Courier New,monospace;'>posi&ccedil;&otilde;es planejadas</div>" &
    "<div style='display:inline-flex;align-items:center;gap:4px;font-size:20px;font-weight:600;padding:2px 7px;border-radius:3px;margin-top:8px;background:rgba(240,68,56,.15);color:#F04438;'>&#9660; " & _gap_pct & " gap HC</div>" &
"</div>" &

// ── Card 4: Terceiros Presentes
"<div style='background:#1A2330;border:1px solid #2E3D4F;border-radius:6px;padding:18px 20px;position:relative;overflow:hidden;'>" &
    "<div style='position:absolute;top:0;left:0;right:0;height:3px;background:#29C46B;'></div>" &
    "<div style='font-size:24px;font-weight:500;letter-spacing:2px;color:#8CA0B3;text-transform:uppercase;margin-bottom:8px;'>Terceiros Presentes</div>" &
    "<div style='font-size:42px;font-weight:400;line-height:1;letter-spacing:-1px;color:#29C46B;'>" & FORMAT(_terc_n, "0") & "</div>" &
    "<div style='font-size:16px;color:#8CA0B3;margin-top:6px;font-family:Courier New,monospace;'>" & _cargo_sub & "</div>" &
    IF(_terc_n > 0,
        "<div style='display:inline-flex;align-items:center;gap:4px;font-size:18px;font-weight:600;padding:2px 7px;border-radius:3px;margin-top:8px;background:rgba(41,196,107,.15);color:#29C46B;'>&#9650; " & _cargo_badge & " &middot; HUB</div>",
        "<div style='display:inline-flex;align-items:center;gap:4px;font-size:18px;font-weight:600;padding:2px 7px;border-radius:3px;margin-top:8px;background:rgba(255,255,255,.06);color:#8CA0B3;'>sem terceiros</div>"
    ) &
"</div>" &

"</div>"
)
