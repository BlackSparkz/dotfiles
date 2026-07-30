hl.config({
  animations = {
    enabled = true,
  }
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.1, 0},     {0.0, 1}     } })
hl.curve("hobbyist",       { type = "spring", mass = 1, stiffness = 30, dampening = 7 } )

hl.animation({ leaf = "global",        enabled = true,  speed = 6,    bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 1,    bezier = "almostLinear" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 6,    spring = "hobbyist",         style = "slide" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 6,    spring = "hobbyist",         style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 6,    spring = "hobbyist",         style = "slide bottom" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 6,    spring = "hobbyist" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 2,    bezier = "almostLinear" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 4,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint",     style = "slide bottom" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 4,    bezier = "almostLinear",     style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.8,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.4,  bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 6,    spring = "hobbyist",         style = "slidefadevert" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 6,    bezier = "quick" })
