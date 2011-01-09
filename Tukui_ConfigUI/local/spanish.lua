﻿if GetLocale() == "esES" then
	-- general
	TukuiL.option_general = "General"
	TukuiL.option_general_uiscale = "Escala automática de la interfaz"
	TukuiL.option_general_multisample = "Protección frente al multimuestreo (borde de 1px limpio)"
	TukuiL.option_general_customuiscale = "Escala de la interfaz (si la escala automática está desactivada)"
	TukuiL.option_general_embedright = "Addon que se ajustará en el panel de chat derecho (Recount, Omen, Skada)"
	TukuiL.option_general_classtheme = "Colorear los bordes del color de tu clase"
	TukuiL.option_general_autocustomlagtolerance = "Automatically update the Blizzard Custom Lag Tolerance option to your latency."
	 
	--Media
	TukuiL.option_media = "Medios"
	TukuiL.option_media_font = "Ruta de la fuente que será usada como fuente principal"
	TukuiL.option_media_uffont = "Ruta de la fuente que será usada en los marcos de vida/poder"
	TukuiL.option_media_dmgfont = "Ruta de la fuente que se usará como fuente de daño (requiere reinicio)"
	TukuiL.option_media_normTex = "Ruta de la textura que se usará en las barras de vida/poder"
	TukuiL.option_media_glowTex = "Ruta de la textura que se usará como brillo"
	TukuiL.option_media_bubbleTex = "Ruta de la textura que se usará en los puntos de combo (placas de nombre)"
	TukuiL.option_media_blank = "Ruta de la textura que se usará como textura principal"
	TukuiL.option_media_bordercolor = "Color para los bordes generales"
	TukuiL.option_media_altbordercolor = "Color para los bordes de los marcos de vida/poder"
	TukuiL.option_media_backdropcolor = "Color para el fondo de todos los marcos"
	TukuiL.option_media_backdropfadecolor = "Color para los fondos diluídos de ciertos marcos"
	TukuiL.option_media_buttonhover = "Ruta de la textura que se superpone en los botones de las barras de acción"
	TukuiL.option_media_valuecolor = "Color de los textos de datos"
	TukuiL.option_media_raidicons = "Ruta de la textura para los iconos de banda"
	TukuiL.option_media_whisper = "Archivos de sonido que se usará al recibir un susurro"
	TukuiL.option_media_warning = "Sonido de alerta"
	TukuiL.option_media_glossy = "Textura del brillo de las barras"
 
	-- nameplate
	TukuiL.option_nameplates = "Placas de nombre"
	TukuiL.option_nameplates_enable = "Activar placas de nombre"
	TukuiL.option_nameplates_enhancethreat = "Activar visor de amenaza, cambia automáticamente según tu rol: \n Tanque - Verde (aggro) Rojo (noaggro) DPS - Verde (noaggro) Rojo (aggro)"
	TukuiL.option_nameplates_showhealth = "Mostrar vida en las placas de nombre"
 	TukuiL.option_nameplates_combat = "Mostrar las chapas de nombre de los enemigos sólo en combate"
	TukuiL.option_nameplates_goodcolor = "Good threat color, varies depending if your a tank or dps/heal"
	TukuiL.option_nameplates_badcolor = "Bad threat color, varies depending if your a tank or dps/heal"
	TukuiL.option_nameplates_transitioncolor = "Losing/Gaining threat color"
	
	-- addon skins
	TukuiL.option_skin = "Pieles de addons"
	TukuiL.option_skin_dxe = "Deus Vox Encounters"
	TukuiL.option_skin_omen = "Omen"
	TukuiL.option_skin_recount = "Recount"
	TukuiL.option_skin_skada = "Skada"
 
	-- classtimer
	TukuiL.option_classtimer = "Class Timer"
	TukuiL.option_classtimer_enable = "Activar Classtimer"
	TukuiL.option_classtimer_bar_height = "Anchura de la barra"
	TukuiL.option_classtimer_bar_spacing = "Espaciado entre barras"
	TukuiL.option_classtimer_icon_position = "Posición el icono (0-Izquierda,1-Derecha,2-Izquierda fuera,3-Derecha fuera)"
	TukuiL.option_classtimer_layout = "Estilo (1-5)"
	TukuiL.option_classtimer_showspark = "Mostrar chispa"
	TukuiL.option_classtimer_cast_suparator = "Separador de lanzamiento"
	TukuiL.option_classtimer_classcolor = "Color de clase"
	TukuiL.option_classtimer_debuffcolor = "Color de la barra de perjuicios"
	TukuiL.option_classtimer_buffcolor = "Color de la barra de beneficios"
	TukuiL.option_classtimer_proccolor = "Color de la barra de abalorios/proc"
 
	-- datatext
	TukuiL.option_datatext = "Textos de datos"
	TukuiL.option_datatext_24h = "Activar tiempo en 24h"
	TukuiL.option_datatext_localtime = "Usar la hora local en vez de la del serviodr"
	TukuiL.option_datatext_bg = "Activar las estadísticas en los campos de batalla"
	TukuiL.option_datatext_guild = "Posición de la hermandad (0 para desactivar)"
	TukuiL.option_datatext_mem = "Posición de la memoria (0 para desactivar)"
	TukuiL.option_datatext_bags = "Posición de las bolas (0 para desactivar)"
	TukuiL.option_datatext_fontsize = "Tamaño de la fuente"
	TukuiL.option_datatext_system = "Posición de la latencia y los FPS (0 para desactivar)"
	TukuiL.option_datatext_friend = "Posición de los amigos (0 para desactivar)"
	TukuiL.option_datatext_time = "Posición de la hora (0 para desactivar)"
	TukuiL.option_datatext_gold = "Posición del oro (0 para desactivar)"
	TukuiL.option_datatext_dur = "Posición de la durabilidad (0 for disabled)"
	TukuiL.option_datatext_stat1 = "Posición de la estadística 1"
	TukuiL.option_datatext_stat2 = "Posición de la estadística 2"
	TukuiL.option_datatext_dps = "Posicion de Daño por segundo"
	TukuiL.option_datatext_hps = "Posicion de Curas por Segundo"
	
	-- auras
	TukuiL.option_auras = "Auras"
	TukuiL.option_auras_minimapauras = "Auras al lado del minimapa"
	TukuiL.option_auras_arenadebuffs = "Mostras únicamente auras importantes dentro de arenas/campos de batalla"
	TukuiL.option_auras_auratimer = "Activar el tiempo en las auras"
	TukuiL.option_auras_targetaura = "Activar las auras del objetivo"
	TukuiL.option_auras_focusdebuff = "Activar las auras del foco"
	TukuiL.option_auras_playeraura = "Mostrar auras en el cuadro del jugador"
	TukuiL.option_auras_aurascale = "Escala del texto de las auras"
	TukuiL.option_auras_totdebuffs = "Activar los perjuicios en el ToT"
	TukuiL.option_auras_playershowonlydebuffs = "Mostras perjuicios en el marco de jugador únicamente (requiere activar mostrar auras)"
	TukuiL.option_auras_playerdebuffsonly = "Mostras solamente tus perjuicios/CCs en el objetivo \n (auraFilter.lua para configurar)"
	TukuiL.option_auras_RaidUnitBuffWatch = "Activar visor de beneficios en los marcos de banda"
 
	-- raidframes
	TukuiL.option_raidframes = "Marcos de banda"
	TukuiL.option_raidframes_enable = "Activar marcos de banda"
	TukuiL.option_raidframes_gridonly = "Usar el formato de 25 miembros en grupo"
	TukuiL.option_raidframes_healcomm = "Activar HealComm (sólo en el estilo de sanadores)"
	TukuiL.option_raidframes_boss = "Activar los marcos de los jefes"
	TukuiL.option_raidframes_hpvertical = "Mostrar la barra de vida vertical en el Grid (sólo en el estilo de sanadores)"
	TukuiL.option_raidframes_enablerange = "Activar advertencia de rango en los marcos de banda/grupo"
	TukuiL.option_raidframes_range = "Alpha de las unidades fuera de rango en banda/grupo"
	TukuiL.option_raidframes_maintank = "Activar tanque principal"
	TukuiL.option_raidframes_mainassist = "Activar asistente principal"
	TukuiL.option_raidframes_playerparty = "Mostrarse así mismo en grupo"
	TukuiL.option_raidframes_hidenonmana = "Mostrar la barra de poder sólo en las unidades que usen maná (no en los marcos de grupo)"
	TukuiL.option_raidframes_fontsize = "Tamaño de la fuenta en los marcos de banda"
	TukuiL.option_raidframes_scale = "Escala de los marcos de banda (en decimales ej: 0.96)"
	TukuiL.option_raidframes_disableblizz = "Desactivar los marcos de banda/grupo por defecto de Blizzard"
 	TukuiL.option_raidframes_griddps = "Display the DPS Layout in grid layout instead of a vertical layout (Not Party)"
	
	-- castbar
	TukuiL.option_castbar = "Barra de lanzamiento"
	TukuiL.option_castbar_nointerruptcolor = "Color de la barra de lanzamiento si no se puede interrumpir"
	TukuiL.option_castbar_castbarcolor = "Color de la barra de lanzamiento"
	TukuiL.option_castbar_castbar = "Activar barra de lanzamiento"
	TukuiL.option_castbar_latency = "Mostrar la latencia en la barra de lanzamiento"
	TukuiL.option_castbar_icon = "Mostrar iconos en la barra de lanzamiento"
	TukuiL.option_castbar_castermode = "Activar una barra de lanzamiento mayor (recomendada para casters)"
	TukuiL.option_castbar_classcolor = "Colorear la barra de lanzamiento según el color de clase"
 
	-- unit frames
	TukuiL.option_unitframes_unitframes = "Marcos de unidad"
	TukuiL.option_unitframes_healthcolor = "Color de las barras de vida"
	TukuiL.option_unitframes_combatfeedback = "Texto de comabate para el jugador y el objetivo"
	TukuiL.option_unitframes_totalhpmp = "Mostrar vida/poder total"
	TukuiL.option_unitframes_aurawatch = "Mostrar los beneficios en las esquinas"
	TukuiL.option_unitframes_saveperchar = "Guarda la posición de los marcos para cada personaje"
	TukuiL.option_unitframes_playeraggro = "Mostrar alerta de amenaza en uno mismo"
	TukuiL.option_unitframes_smooth = "Activar barras suaves"
	TukuiL.option_unitframes_portrait = "Activar retratos en los marcos de jugador y objetivo"
	TukuiL.option_unitframes_enable = "Activar los marcos de unidades Tukui"
	TukuiL.option_unitframes_enemypower = "Activar la barra de poder (maná, ira...) sólo en el jugador"
	TukuiL.option_unitframes_raidaggro = "Mostrar alerta de amenaza"
	TukuiL.option_unitframes_symbol = "Mostrar símbolos en banda/grupo"
	TukuiL.option_unitframes_threatbar = "Activar barra de amenaza"
	TukuiL.option_unitframes_focus = "Activar marco de foco"
	TukuiL.option_unitframes_manalow = "Indicador de maná bajo"
	TukuiL.option_unitframes_classcolor = "Colorear los marcos de unidad con el color de la clase"
	TukuiL.option_unitframes_SwingBar = "Activar barra de swing (sólo para el estilo DPS)"
	TukuiL.option_unitframes_DebuffHighlight = "Colorear marcos según el color del perjuicio si es disipable"
	TukuiL.option_unitframes_mendpet = "Mostrar la barra de Aliviar Mascota en el marco de mascota (sólo para el estilo DPS)"
	TukuiL.option_unitframes_fontsize = "Tamaño de la fuente"
	TukuiL.option_unitframes_unitframes_poweroffset = "Compensación de la barra de poder dentro del marco de unidad (0 para no usar compensación)"
	TukuiL.option_unitframes_classbar = "Activar la barra de clase (Totems, Runas, poder sagrado, almas, Eclipse)"
	TukuiL.option_unitframes_healthbackdropcolor = "Color de fondo de la barra de vida para todas las unidades"
	TukuiL.option_unitframes_healthcolorbyvalue = "Color Healthbars by Health Remaining"
	TukuiL.option_unitframes_combat = "Fade unitframes while not in-combat"
			
	 -- frame sizes
	TukuiL.option_framesizes = "Tamaño de los marcos de unidad"
	TukuiL.option_framesizes_playtarwidth = "Width of the Player/Target frames"
	TukuiL.option_framesizes_playtarheight = "Height of the Player/Target frames"
	TukuiL.option_framesizes_smallwidth = "Width of the TargetTarget/Focus/FocusTarget/PlayersPet frames"
	TukuiL.option_framesizes_smallheight = "Height of the TargetTarget/Focus/FocusTarget/PlayersPet frames"
	TukuiL.option_framesizes_arenabosswidth = "Width of the Arena/Boss frames"
	TukuiL.option_framesizes_arenabossheight = "Height of the Arena/Boss frames"
	TukuiL.option_framesizes_assisttankwidth = "Width of the MainTank/MainAssist frames"
	TukuiL.option_framesizes_assisttankheight = "Height of the MainTank/MainAssist frames"

	-- loot
	TukuiL.option_loot = "Loot"
	TukuiL.option_loot_enableloot = "Enable loot window"
	TukuiL.option_loot_autogreed = "Enable auto-greed for green item at max level"
	TukuiL.option_loot_enableroll = "Enable item roll window"
 
	-- tooltip
	TukuiL.option_tooltip = "Botín"
	TukuiL.option_tooltip_enable = "Activar tooltip"
	TukuiL.option_tooltip_hidecombat = "Ocultar el tooltip inferior derecho en combate"
	TukuiL.option_tooltip_hidebutton = "Ocultar el tooltip en las barras de acción"
	TukuiL.option_tooltip_hideuf = "Ocultar el tooltip en los marcos de unidades"
	TukuiL.option_tooltip_cursor = "Adjuntar el tooltip al puntero"
	TukuiL.option_tooltip_combatraid = "Ocultar el tooltip sólo durante un combate de banda"
	TukuiL.option_tooltip_colorreaction = "Colorear el borde y la barra de vida del tooltip según la reacción"
	TukuiL.option_tooltip_xOfs = "Compensación en el eje X del tooltip (-x = Izquierda, +x = Derecha)"
	TukuiL.option_tooltip_yOfs = "Compensación en el eje Ydel tooltip (-y = Izquierda, +y = Arriba)"
	TukuiL.option_tooltip_itemid = "Display Item ID"
	
	-- others
	TukuiL.option_others = "Otros"
	TukuiL.option_others_bg = "Activar la liberación automática del cadáver en los campos de batalla"
	TukuiL.option_others_autosell = "Vender la basura automáticamente"
	TukuiL.option_others_autorepair = "Reparar automáticamente los objetos"
	TukuiL.option_others_autoinvite = "Aceptar las invitaciones de amigos y miembros de hermandad automáticamente"
	TukuiL.option_others_enablemap = "Activar el mapa"
	TukuiL.option_others_errorhide = "Ocultar los errores (textos en rojo) que aparecen en mitad de la pantalla"
	TukuiL.option_others_spincam = "Girar la cámara cuando se está AUS"
	TukuiL.option_others_bagenable = "Unir todas las bolsas del inventario en una"
 
	-- reminder
	TukuiL.option_reminder = "Advertencia de auras"
	TukuiL.option_reminder_enable = "Activar las advertencias de auras para el jugador"
	TukuiL.option_reminder_sound = "Activar el sonido de alerta"
	TukuiL.option_reminder_RaidBuffReminder = "Activar la barra de recordatorio de auras (frascos, comidas...) debajo del minimapa"
 
	-- action bar
	TukuiL.option_actionbar = "Barras de acción"
	TukuiL.option_actionbar_hidess = "Ocultar la barra de cambio de forma y/o barra de tótems"
	TukuiL.option_actionbar_showgrid = "Mostrar siempre la cuadrícula en las barras de acción"
	TukuiL.option_actionbar_enable = "Activar las barras de acción Tukui"
	TukuiL.option_actionbar_rb = "Activar la barra de acción derecha al pasar el ratón"
	TukuiL.option_actionbar_hk = "Mostrar los atajos en los botones"
	TukuiL.option_actionbar_ssmo = "Mostrar la barra de cambio de forma y/o totems al pasar el ratón"
	TukuiL.option_actionbar_rbn = "Número de barras de acción inferiores (1 o 2)"
	TukuiL.option_actionbar_rbn2 = "Número de barras de acción inferiores (1, 2, o 3)"
	TukuiL.option_actionbar_rn = "Número de barras de acción en la derecha (1, 2 o 3)"
	TukuiL.option_actionbar_splitbar = "Activar las barras de acción partidas"
	TukuiL.option_actionbar_bottompetbar = "Posicionar la barra de mascota bajo la barra principal de acción, la barra de acción principal se desplazará hacia arriba"
	TukuiL.option_actionbar_buttonsize = "Tamaño de los botones de la barra principal"
	TukuiL.option_actionbar_buttonspacing = "Espacio entre los botones de la barra principal"
	TukuiL.option_actionbar_petbuttonsize = "Tamaño de los botones de la barra de mascota/estancia"
	TukuiL.option_actionbar_petbuttonspacing = "Espacio entre los botones de la barra de mascota/estancia"
	TukuiL.option_actionbar_swaptopbottombar = "Swap the top and bottom actionbar positions"
	
	-- arena
	TukuiL.option_arena = "Arena"
	TukuiL.option_arena_st = "Activar seguimiento de hechizos del enemigo en arenas"
	TukuiL.option_arena_uf = "Activar los marcos de arena"
 
	-- cooldowns
	TukuiL.option_cooldown = "Cooldowns"
	TukuiL.option_cooldown_enable = "Activar el tiempo de enfriamiento en los botones"
	TukuiL.option_cooldown_th = "Cambiar de color el número cuando queda X tiempo"
	TukuiL.option_cooldown_expiringcolor = "Color de expiración"
	TukuiL.option_cooldown_secondscolor = "Color de los segundos"
	TukuiL.option_cooldown_minutescolor = "Color de los minutos"
	TukuiL.option_cooldown_hourscolor = "Color de las horas"
	TukuiL.option_cooldown_dayscolor = "Color de los días"
 
	-- chat
	TukuiL.option_chat = "Chat"
	TukuiL.option_chat_bubbles = "Burbujas de chat skineadas (encima de las cabezas)"
	TukuiL.option_chat_enable = "Activar el chat Tukui"
	TukuiL.option_chat_whispersound = "Reproducir sonido cuando se recibe un privado"
	TukuiL_option_chat_chatwidth = "Anchura del chat (horizontal)"
	TukuiL_option_chat_backdrop = "Mostrar fondo en el chat"
	TukuiL_option_chat_chatheight = "Altura del chat"
	TukuiL_option_chat_fadeoutofuse = "Ocultar chat cuando no está en uso"
	TukuiL_option_chat_sticky = "Fijar algunas pestañas del chat cuando se edita"
 
	-- buttons
	TukuiL.option_button_reset = "Reiniciar interfaz"
	TukuiL.option_button_load = "Aplicar cambios"
	TukuiL.option_button_close = "Cerrar"
	TukuiL.option_setsavedsetttings = "Guardar opciones por personje"
	TukuiL.option_resetchar = "¿Seguro que desea reiniciar las opcioens de este personaje a las por defecto?"
	TukuiL.option_resetall = "¿Seguro que desea reiniciar TODAS las opciones a las por defecto?"
	TukuiL_option_perchar = "¿Seguro que desea cambiar la configuración 'por personaje'?"
	TukuiL_option_makeselection = "Tiene que seleccionar una opción antes de seguir con la configuración."
end