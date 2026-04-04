
##|             __                                __                  __
##|            /  |                              /  |                /  |
##|  __     __ $$/   _______  __    __   ______  $$ |  _______       $$ |____   __    __
##| /  \   /  |/  | /       |/  |  /  | /      \ $$ | /       |      $$      \ /  |  /  |
##| $$  \ /$$/ $$ |/$$$$$$$/ $$ |  $$ | $$$$$$  |$$ |/$$$$$$$/       $$$$$$$  |$$ |  $$ |
##|  $$  /$$/  $$ |$$      \ $$ |  $$ | /    $$ |$$ |$$      \       $$ |  $$ |$$ |  $$ |
##|   $$ $$/   $$ | $$$$$$  |$$ \__$$ |/$$$$$$$ |$$ | $$$$$$  |      $$ |__$$ |$$ \__$$ |
##|    $$$/    $$ |/     $$/ $$    $$/ $$    $$ |$$ |/     $$/       $$    $$/ $$    $$ |
##|     $/     $$/ $$$$$$$/   $$$$$$/   $$$$$$$/ $$/ $$$$$$$/        $$$$$$$/   $$$$$$$ |
##|                                                                            /  \__$$ |
##|                                                                            $$    $$/
##|                                                                             $$$$$$/
##|   ______   __        __            __
##|  /      \ /  |      /  |          /  |
##| /$$$$$$  |$$ |   __ $$/  _______  $$ |____    ______    ______    ______    ______    ______
##| $$ \__$$/ $$ |  /  |/  |/       \ $$      \  /      \  /      \  /      \  /      \  /      \
##| $$      \ $$ |_/$$/ $$ |$$$$$$$  |$$$$$$$  |/$$$$$$  |/$$$$$$  |/$$$$$$  |/$$$$$$  |/$$$$$$  |
##|  $$$$$$  |$$   $$<  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$    $$ |$$ |  $$/
##| /  \__$$ |$$$$$$  \ $$ |$$ |  $$ |$$ |  $$ |$$ \__$$ |$$ |__$$ |$$ |__$$ |$$$$$$$$/ $$ |
##| $$    $$/ $$ | $$  |$$ |$$ |  $$ |$$ |  $$ |$$    $$/ $$    $$/ $$    $$/ $$       |$$ |
##|  $$$$$$/  $$/   $$/ $$/ $$/   $$/ $$/   $$/  $$$$$$/  $$$$$$$/  $$$$$$$/   $$$$$$$/ $$/
##|                                                       $$ |      $$ |
##|                                                       $$ |      $$ |
##|                                                       $$/       $$/


set :vj_war, (1..29).to_a + (49..50).to_a + (81..107).to_a + (120..126).to_a
set :vj_protest, (30..48).to_a + (51..81).to_a + (108..119).to_a

use_midi_defaults port: "loopmidi_port_2"

live_loop :vj_techno_strobe, sync: :click do
  active = get[:vj_tech] || 0
  
  if active <= 0
    sleep 0.5
    next
  end
  
  war_scenes = get[:vj_war]
  target_scene = war_scenes.choose
  
  midi target_scene, 127
  sleep 0.5
end

live_loop :vj_techno_strobe2, sync: :click do
  active = get[:vj_tech2] || 0
  
  if active <= 0
    sleep 0.5
    next
  end
  
  war_scenes = get[:vj_war]
  
  # Tick çift ise sahne seç, tek ise 0'a (siyaha) dön
  if tick(:vj_tech2) % 2 == 0
    midi war_scenes.choose, 127, port: "loopmidi_port_2"
  else
    midi 0, 127, port: "loopmidi_port_2"
  end
  
  sleep 0.5
end


live_loop :vj_dnb_strobe, sync: :click do
  active = get[:vj_dnb] || 0
  
  if active <= 0
    sleep 0.25
    next
  end
  
  protest_scenes = get[:vj_protest]
  rhythm_map = (ring 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0)
  beat = rhythm_map.tick(:vj_dnb)
  
  if beat == 1
    midi protest_scenes.choose, 127
  end
  
  sleep 0.25
end

live_loop :vj_dnb_strobe2, sync: :click do
  active = get[:vj_dnb2] || 0
  
  if active <= 0
    sleep 0.25
    next
  end
  
  protest_scenes = get[:vj_protest]
  # 16'lık nota hassasiyetinde ritim haritası
  rhythm_map = (ring 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0)
  beat = rhythm_map.tick(:vj_dnb2)
  
  if beat == 1
    midi protest_scenes.choose, 127, port: "loopmidi_port_2"
  else
    midi 0, 127, port: "loopmidi_port_2"
  end
  
  sleep 0.25
end


live_loop :vj_boss_continuous, sync: :click do
  active = get[:vj_boss_active] || 0
  
  if active <= 0
    set :boss_trig, false
    sleep 1
    next
  end
  
  triggered = get[:boss_trig] || false
  
  if !triggered
    midi 30, 127
    set :boss_trig, true
    set :boss_count, 0
  end
  
  counter = get[:boss_count] + 1
  set :boss_count, counter
  
  if counter >= 1500
    set :boss_trig, false
  end
  
  sleep 1
end





live_loop :vj_glitch_walk, sync: :click do
  active = get[:vj_glitch] || 0
  
  if active <= 0
    set :vj_glitch_pos, 5
    sleep 0.5
    next
  end
  
  current_pos = get[:vj_glitch_pos] || 5
  
  if one_in(4)
    target = current_pos + rrand_i(-15, 15)
    
    target = 1 if target < 1
  else
    target = current_pos + 1
  end
  
  target = 5 if target >= 126
  
  set :vj_glitch_pos, target
  midi target, 127
  
  sleep 0.25
end

