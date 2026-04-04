##| use_midi_defaults port: "loopmidi_port_2"
##| midi_port = "loopmidi_port_1"
use_debug false
use_bpm 172


#################################################################################################

#################################################################################################

define :reset_all do
  set :master_hpf, 0
  set :master_lpf, 130
  
  set :k1, 0; set :k2, 0; set :k3, 0; set :k4, 0; set :k5, 0; set :k6, 0; set :k7, 0
  set :h1, 0; set :h2, 0; set :h3, 0; set :h4, 0; set :hardk1, 0; set :hardk2, 0;   set :hardk3, 0
  
  set :vol_drloop1, 0; set :vol_drloop3, 0
  set :vol_gli, 0; set :vol_rbreakhalf, 0
  set :vol_amen, 0; set :vol_amencore1, 0; set :vol_amencore2, 0; set :vol_amencore3, 0
  
  set :vol_bass, 0; set :vol_serumbass, 0; set :vol_nerobass1, 0; set :vol_nerobass2, 0
  set :vol_nerobass3, 0; set :vol_nerobass4, 0; set :vol_nerobass5, 0
  set :vol_arp, 0; set :vol_bossmelody, 0
  
  set :vol_amb1, 0; set :vol_amb2, 0; set :vol_amb3, 0; set :vol_disambi, 0
  
  set :vol_bossmelody1, 0;   set :vol_boss_lead, 0;   set :vol_boss_lead, 0
  set :vol_boss_lead, 0;   set :vol_fuguebass, 0;   set :vol_fuguebass, 0
  set :vol_fuguebass, 0;  set :vol_fuguekick, 0;  set :vol_fuguekick, 0
  set :vol_fuguekick, 0;  set :vol_fugue_answer, 0
  
  set :vol_blade, 0
  set :vol_blade_cut, 0
  set :vol_blade_phase, 0
  set :vol_amen_s, 0
  
  set :vol_neuro_drums, 0
  set :vol_nerolead, 0
  set :vol_padloop, 0
  set :vol_padloop2, 0
  
  set :vol_dont, 0
  
  set :vol_arp2, 0
  
  set :vol_amen_katran, 0
  set :vol_synth_katran, 0
  set :vol_bass2_katran, 0
  set :vol_drum5_katran, 0
  set :vol_vox_katran, 0
  set :vol_basspluck_katran, 0
  set :vol_ezel1_katran, 0
  set :vol_ezel2_katran, 0
  
  set :vj_tech, 0
  set :vj_dnb, 0
  set :vj_tech2, 0
  set :vj_dnb2, 0
  set :vj_boss_active, 0
  set :vj_glitch, 0
  
end

define :fill_breakcore do
  ##| reset_all
  set :vol_gli, 1
  set :vol_neuro_drums, 1
  set :vol_nerolead, 0
  set :vol_nerobass2, 0
  set :vol_nerobass3, 1
  set :vol_nerobass4, 0
  set :vol_padloop, 0.6
  set :vol_padloop2, 0
  
  set :vj_dnb, 1
  set :vj_glitch, 0
end

define :fill_frenchcore do
  ##| reset_all
  set :master_hpf, 0
  
  set :k5, 0
  set :k3, 1
  set :vol_amen_katran, 0
  set :vol_synth_katran, 1
  set :vol_bass2_katran, 0
  set :vol_drum5_katran, 0
  set :vol_vox_katran, 1
  set :vol_basspluck_katran, 0
  
  set :vol_amencore3, 0
  set :vol_ezel1_katran, 1
  set :vol_ezel2_katran, 1.2
  
  set :vj_dnb, 1
  set :vj_glitch, 0
  
end

define :fill_boss_tease do
  ##| reset_all
  set :vol_rbreakhalf, 0
  
  set :vol_bossmelody1, 1
  set :vol_fuguebass, 1
  set :vol_fuguekick, 1
  set :vol_amencore2, 1
  set :vol_fugue_answer, 1
  set :vol_boss_lead, 1
  
  set :vj_boss_active, 1
  
end

define :set1 do
  ##| reset_all
  set :master_hpf, 0
  set :k3, 1
  set :vol_disambi, 1
  set :vol_amb1, 0
  set :vol_amb2, 0
  set :vol_amb3, 1
  
  set :vj_tech, 1
  set :vj_tech2, 1
  
end

define :set2 do
  ##| reset_all
  set :master_hpf, 70
  set :hardk1, 1
  set :h1, 0
  set :vol_bass, 1
  ##| set :bass_pattern, (ring 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  set :bass_pattern, (ring 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0)
  ##| set :bass_pattern, (ring 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  set :vol_disambi, 0
  set :vol_amb1, 1
  
  set :vol_blade, 0
  set :vol_blade_cut, 0
  set :vol_blade_phase, 0
  
  set :vj_tech, 0
  set :vj_tech2, 1
  set :vj_glitch, 0
end

define :set3 do
  ##| reset_all
  set :master_hpf, 0
  set :master_lpf, 130
  set :k3, 0
  set :h4, 0
  set :vol_amen, 1
  set :vol_amen_s, 0
  set :vol_nerobass5, 1
  set :vol_amb1, 1
  
  set :vj_dnb2, 1
  set :vj_tech2, 0
  
end

define :set4 do
  ##| reset_all
  set :vol_bossmelody1, 1
  set :vol_rbreakhalf, 1
  set :vol_amen_s, 0
  
  set :vj_dnb, 0
  set :vj_dnb2, 0
  
  set :vj_boss_active, 1
  
end

define :set5 do
  ##| reset_all
  set :master_hpf, 0
  
  set :vol_amencore1, 1
  set :vol_nerobass2, 1
  set :vol_padloop, 0.5
  
  set :vj_dnb, 1
  
end

define :set6 do
  ##| reset_all
  set :master_hpf, 70
  set :hardk3, 1
  set :h1, 1
  set :vol_drloop1, 0
  set :vol_serumbass, 1
  set :vol_nerobass1, 0
  set :vol_amencore1, 0
  set :vol_arp, 1
  
  set :vj_tech, 1
  set :vj_dnb, 0
  set :vj_tech2, 1
  set :vj_dnb2, 0
  
end

define :set7 do
  ##| reset_all
  set :master_hpf, 0
  
  set :k3, 0
  set :hardk2, 0
  set :h1, 0
  set :h4, 0
  set :vol_gli, 0.1
  set :vol_arp, 0
  set :vol_serumbass, 0
  
  set :vj_tech, 0
  set :vj_tech2, 0
  
  
end


#################################################################################################

##| set3
##| fill_breakcore
##| fill_frenchcore
fill_boss_tease

#################################################################################################

##| :::::::::      :::     :::::::::      :::     ::::    ::::  :::    ::: :::    :::
##| :+:    :+:   :+: :+:   :+:    :+:   :+: :+:   +:+:+: :+:+:+ :+:    :+: :+:   :+:
##| +:+    +:+  +:+   +:+  +:+    +:+  +:+   +:+  +:+ +:+:+ +:+ +:+    +:+ +:+  +:+
##| +#++:++#+  +#++:++#++: +#++:++#:  +#++:++#++: +#+  +:+  +#+ +#+    +:+ +#++:++
##| +#+    +#+ +#+     +#+ +#+    +#+ +#+     +#+ +#+       +#+ +#+    +#+ +#+  +#+
##| #+#    #+# #+#     #+# #+#    #+# #+#     #+# #+#       #+# #+#    #+# #+#   #+#
##| #########  ###     ### ###    ### ###     ### ###       ###  ########  ###    ###


live_loop :click do
  sleep 1
end
#################################################################################################

live_loop :hardkick1, sync: :click do
  amp_val = get[:hardk1]
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/hardcore_kick1.wav",
      amp: amp_val, hpf: current_hpf
  end
  sleep 1
end

live_loop :hardkick2, sync: :click do
  amp_val = get[:hardk2] - 0.3
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/hardcore_kick2.wav", beat_stretch: 1.15,
      amp: amp_val, hpf: current_hpf
  end
  sleep 1
end

live_loop :hardkick3, sync: :click do
  amp_val = get[:hardk3]
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/hardcore_kick4.mp3",
      amp: amp_val, hpf: current_hpf
  end
  sleep 1
end

live_loop :kick2, sync: :click do
  amp_val = get[:k2]
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    with_fx :distortion, mix: 0.1 do
      sample "C:/Users/Berke/Music/avril4/indust_kick2.wav", beat_stretch: 1,
        amp: amp_val, hpf: current_hpf
    end
  end
  sleep 1
end

live_loop :kick3, sync: :click do
  amp_val = get[:k3] * 1.2
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/indust_kick3.wav", beat_stretch: 1,
      amp: amp_val, hpf: current_hpf
  end
  sleep 1
end

live_loop :kick4, sync: :click do
  amp_val = get[:k4] - 0.3
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    with_fx :eq, low: 0.2 do
      with_fx :distortion, mix: 0.3 do
        sample "C:/Users/Berke/Music/avril4/indust_kick4.wav", amp: amp_val, hpf: current_hpf
      end
    end
  end
  sleep [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5].tick
end

live_loop :kick5, sync: :click do
  amp_val = get[:k5] - 0.5
  
  if amp_val > 0
    with_fx :distortion, mix: 0.2 do
      sample "C:/Users/Berke/Music/avril4/indust_kick5.wav", beat_stretch: 0.5,
        amp: amp_val,
        hpf: 70
    end
  end
  sleep [0.5, 1.5, 1.5, 1, 1.5, 1.5, 0.5].tick
end

live_loop :kick6, sync: :click do
  amp_val = get[:k6] - 0.4
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    with_fx :eq, low: 0.3 do
      with_fx :distortion, mix: 0.2 do
        sample "C:/Users/Berke/Music/avril4/indust_kick6.wav", beat_stretch: 1,
          amp: amp_val, hpf: current_hpf
      end
    end
  end
  sleep 1
end

#################################################################################################

live_loop :hat, sync: :click do
  amp_val = get[:h1]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/hatloop.wav", amp: amp_val * 2
  end
  sleep 4
end

live_loop :hats, sync: :click do
  amp_val = get[:h2]
  
  if amp_val > 0
    with_fx :krush, mix: 0.3 do
      sample "C:/Users/Berke/Music/avril4/hatsloop.wav", amp: amp_val * 2
    end
  end
  sleep 4
end

live_loop :hi_hat_random, sync: :click do
  amp_val = get[:h3]
  
  sleep 0.5
  
  if amp_val > 0 && one_in(2)
    with_fx :reverb, mix: 0.2 do
      sample :drum_cymbal_closed, cutoff: 120, pan: rrand(-1, 0.6), amp: amp_val * 1.5
    end
  end
end

live_loop :hat_new, sync: :click do
  amp_val = get[:h4]
  
  if amp_val > 0
    sample "C:/Users/Berke/Music/avril4/hatloop.wav", amp: amp_val * 2,
      beat_stretch: 4, num_slices: 16, slice: pick
  end
  sleep 0.25
end

#################################################################################################

live_loop :drloop1, sync: :click do
  amp_val = get[:vol_drloop1] * 1.3
  if amp_val > 0
    with_fx :eq, low: -0.5 do
      with_fx :distortion, mix: 0.5 do
        sample "C:/Users/Berke/Music/avril4/indust_drumloop1.wav", amp: amp_val
      end
    end
  end
  
  sleep 32
end

live_loop :drloop3, sync: :click do
  amp_val = get[:vol_drloop3] * 1.3
  if amp_val > 0
    with_fx :eq, low: -0.3, mid: 0.2, high: 0.2 do
      with_fx :distortion, mix: 0.3 do
        with_fx :bitcrusher, mix: 0.3 do
          sample "C:/Users/Berke/Music/avril4/indust_drumloop3.wav", amp: amp_val
        end
      end
    end
  end
  sleep 32
end

live_loop :gli, sync: :click do
  amp_val = get[:vol_gli] * 1.3
  if amp_val > 0
    with_fx :bitcrusher do
      
      sample "C:/Users/Berke/Music/avril4/indust_glitch.wav", amp: amp_val
    end
  end
  sleep 32
end


live_loop :r_break_half, sync: :click do
  amp_val = get[:vol_rbreakhalf]
  if amp_val > 0
    with_fx :distortion, mix: 0.2 do
      sample "C:/Users/Berke/Music/avril4/reaktor_break_half.wav", amp: amp_val
    end
  end
  sleep 8
end

live_loop :amen, sync: :click do
  amp_val = get[:vol_amen]
  current_hpf = get[:master_hpf]
  current_lpf = get[:master_lpf]
  if amp_val > 0
    with_fx :eq, low: 0.7, mid: 0.4 do
      with_fx :distortion, mix: 0.2 do
        sample "C:/Users/Berke/Music/clips/cw_amen17_175.wav", amp: amp_val,
          beat_stretch: 16, hpf: current_hpf, lpf: current_lpf
      end
    end
  end
  sleep 16
end

live_loop :amen_sweep, sync: :click do
  amp_val = get[:vol_amen_s]
  current_hpf = get[:master_hpf]
  
  if amp_val > 0
    with_fx :eq, low: 0.6 do
      with_fx :distortion, mix: 0.2 do
        with_fx :rlpf, cutoff: 50, cutoff_slide: 16 do |f|
          
          sample "C:/Users/Berke/Music/clips/cw_amen17_175.wav", amp: amp_val,
            beat_stretch: 16, hpf: current_hpf
          control f, cutoff: 100
          
        end
        
      end
    end
  end
  sleep 16
end

live_loop :amencore1, sync: :click do
  amp_val = get[:vol_amencore1]
  current_hpf = get[:master_hpf]
  if amp_val > 0
    with_fx :eq, low: 0.4 do
      with_fx :distortion, mix: 0.2 do
        sample "C:/Users/Berke/Music/avril4/amencore1.wav", amp: amp_val,
          beat_stretch: 64, hpf: current_hpf
      end
    end
  end
  sleep 64
end

live_loop :amencore2, sync: :click do
  amp_val = get[:vol_amencore2]
  current_hpf = get[:master_hpf]
  if amp_val > 0
    with_fx :eq, low: 0.4 do
      with_fx :distortion, mix: 0.2 do
        sample "C:/Users/Berke/Music/avril4/amencore2.wav", amp: amp_val,
          beat_stretch: 64, hpf: current_hpf
      end
    end
  end
  sleep 64
end

#################################################################################################

live_loop :acid_bass1, sync: :click do
  amp_val = get[:vol_bass] * 2
  pat = get[:bass_pattern]
  
  s = tick
  p = pat.look
  
  if amp_val > 0 && p == 1
    with_fx :distortion, mix: 0.7 do
      sample "C:/Users/Berke/Music/avril4/acid_bass1.wav",
        beat_stretch: 64,
        num_slices: 16,
        slice: (s % 16),
        amp: amp_val * 1.3
    end
  end
  
  sleep 4
end

with_fx :distortion, mix: 0.3 do
  live_loop :serum_bass, sync: :click do
    amp_val = get[:vol_serumbass]
    sample "C:/Users/Berke/Music/avril4/serumBass.wav", amp: amp_val * 1.7 if amp_val > 0
    sleep 8
  end
end

live_loop :nero_bass, sync: :click do
  amp_val = get[:vol_nerobass1] * 1.7
  sample "C:/Users/Berke/Music/avril4/neurofunk_bass1.wav", beat_stretch: 32, amp: amp_val if amp_val > 0
  sleep 32
end

live_loop :nero_bass2, sync: :click do
  amp_val = get[:vol_nerobass2] * 2
  sample "C:/Users/Berke/Music/avril4/neurofunk_bass2.wav", beat_stretch: 32, amp: amp_val if amp_val > 0
  sleep 32
end

live_loop :nero_bass3, sync: :click do
  amp_val = get[:vol_nerobass3]
  sample "C:/Users/Berke/Music/avril4/neurofunk_bass3.wav", beat_stretch: 4, amp: amp_val if amp_val > 0
  sleep 4
end


live_loop :nero_bass4, sync: :click do
  amp_val = get[:vol_nerobass4] * 1.6
  sample "C:/Users/Berke/Music/avril4/neurofunk_bass4.wav", beat_stretch: 16, amp: amp_val if amp_val > 0
  sleep 16
end

live_loop :nero_bass5, sync: :click do
  amp_val = get[:vol_nerobass5]
  sample "C:/Users/Berke/Music/avril4/neurofunk_bass5.wav", beat_stretch: 16, amp: amp_val if amp_val > 0
  sleep 16
end

live_loop :dont, sync: :click do
  amp_val = get[:vol_dont] * 1.7
  sample "C:/Users/Berke/Music/avril4/dontplay_me.wav", beat_stretch: 16, amp: amp_val if amp_val > 0
  sleep 16
end


live_loop :psy_arp, sync: :click do
  amp_val = get[:vol_arp] * 1.1
  sample "C:/Users/Berke/Music/avril4/psy_arp1.wav", beat_stretch: 8, amp: amp_val if amp_val > 0
  sleep 8
end

live_loop :psy_arp_v2_drone, sync: :click do
  amp_val = get[:vol_arp2] || 0
  
  if amp_val <= 0
    sleep 4
    next
  end
  
  with_fx :reverb, room: 0.9, mix: 0.8 do
    with_fx :flanger, depth: 7, phase: 8 do
      with_fx :wobble, phase: 16, cutoff_min: 50, cutoff_max: 100 do
        
        sample "C:/Users/Berke/Music/avril4/psy_arp1.wav",
          beat_stretch: 8,
          rate: -0.5,
          pitch: -12,
          amp: amp_val * 2
        
      end
    end
  end
  
  sleep 16
end

live_loop :nero_lead, sync: :click do
  amp_val = get[:vol_nerolead]
  sample "C:/Users/Berke/Music/avril4/lead_loop.wav", beat_stretch: 16, amp: amp_val if amp_val > 0
  sleep 16
end


live_loop :padloop, sync: :click do
  amp_val = get[:vol_padloop]
  sample "C:/Users/Berke/Music/avril4/padloopfordnb-1.wav", beat_stretch: 64, amp: amp_val if amp_val > 0
  sleep 64
end

live_loop :padloop2, sync: :click do
  amp_val = get[:vol_padloop2]
  sample "C:/Users/Berke/Music/avril4/padloop2-1.wav", beat_stretch: 64, amp: amp_val if amp_val > 0
  sleep 64
end


#################################################################################################

live_loop :massambi1, sync: :click do
  amp_val = get[:vol_amb1]
  sample "C:/Users/Berke/Music/avril4/massive_ambiance1.wav", amp: amp_val if amp_val > 0
  sleep 8
end

live_loop :massambi2, sync: :click do
  amp_val = get[:vol_amb2]
  sample "C:/Users/Berke/Music/avril4/massive_ambiance2.wav", amp: amp_val if amp_val > 0
  sleep 8
end

live_loop :massambi3, sync: :click do
  amp_val = get[:vol_amb3]
  sample "C:/Users/Berke/Music/avril4/massive_ambiance3.wav", amp: amp_val if amp_val > 0
  sleep 8
end

live_loop :disambi, sync: :click do
  amp_val = get[:vol_disambi]
  with_fx :eq, mid: 0.5, high: 0.2 do
    sample "C:/Users/Berke/Music/avril4/distantambi1.wav", amp: amp_val if amp_val > 0
    sleep 8
  end
end

