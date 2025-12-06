-- Minimal Fake Lag Adjuster (Neverlose v2)

-- Cria um novo tab “Fake Lag” com o grupo “Settings”
local fl_ui     = ui.create("Fake Lag", "Settings")
-- Slider que vai de 1 a 64 (valor inicial 32)
local fl_slider = fl_ui:slider("Fake Lag Limit", 1, 22)

-- A cada tick de movimentação, aplica o valor selecionado
events.createmove:set(function(cmd)
    cvar.sv_maxusrcmdprocessticks:int(fl_slider:get())
end)
