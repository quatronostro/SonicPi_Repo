
use_midi_defaults port: "loopmidi_port_1"
midi_port = "loopmidi_port_1"
use_debug false

use_bpm 172

file = "C:/Users/Berke/Music/KatranDuo160"

set :vol_amen_katran, 0
set :vol_synth_katran, 0
set :vol_bass2_katran, 0
set :vol_drum5_katran, 0
set :vol_vox_katran, 0
set :vol_basspluck_katran, 0
set :vol_ezel1_katran, 0
set :vol_ezel2_katran, 0



#################################################################################################


live_loop :amen_katran, sync: :click do
  amp_val = get[:vol_amen_katran]
  current_hpf = get[:master_hpf]
  s = (ring "/inDust/amen.wav", "/inDust/amen2.wav").tick
  
  if amp_val > 0
    with_fx :eq, low: 0.75 do
      with_fx :distortion, mix: 0.4 do
        sample file + s, amp: amp_val * 1.5, cutoff: 130, beat_stretch: 16
      end
    end
  end
  sleep 16
end

live_loop :synth_katran, sync: :click do
  amp_val = get[:vol_synth_katran]
  
  if amp_val > 0
    with_fx :eq, mid: 0.5, high: -0.25 do
      sample file + "/inDust/synth.wav", amp: amp_val * 0.9, beat_stretch: 32
    end
  end
  sleep 32
end

live_loop :bass2_katran, sync: :click do
  amp_val = get[:vol_bass2_katran]
  
  if amp_val > 0
    with_fx :eq, low: 0.5 do
      sample file + "/inDust/bass2.wav", amp: amp_val * 1.3, beat_stretch: 16
    end
  end
  sleep 16
end

live_loop :drum5_katran, sync: :click do
  amp_val = get[:vol_drum5_katran]
  
  if amp_val > 0
    with_fx :eq, low: -0.5 do
      sample file + "/inDust/drum5.wav", amp: amp_val * 0.9, cutoff: 120, beat_stretch: 16
    end
  end
  sleep 16
end

live_loop :vox_katran, sync: :click do
  amp_val = get[:vol_vox_katran]
  
  if amp_val > 0
    with_fx :ping_pong do
      with_fx :echo, mix: 0.3 do
        sample file + "/inDust/vox.wav", amp: amp_val * 0.23, beat_stretch: 16
      end
    end
  end
  sleep 16
end

live_loop :basspluck_katran, sync: :click do
  amp_val = get[:vol_basspluck_katran]
  
  if amp_val > 0
    sample file + "/bassPluck.wav", amp: amp_val, window_size: 2, beat_stretch: 16
  end
  sleep 16
end

live_loop :ezel1_katran, sync: :click do
  amp_val = get[:vol_ezel1_katran]
  
  if amp_val > 0
    with_fx :eq, high: -0.2 do
      sample file + "/ezel1.wav", amp: amp_val, cutoff: 130, beat_stretch: 32
    end
  end
  sleep 32
end

live_loop :ezel2_katran, sync: :click do
  amp_val = get[:vol_ezel2_katran]
  
  if amp_val > 0
    sample file + "/ezel2.wav", amp: amp_val, beat_stretch: 32
  end
  sleep 32
end




#################################################################################################


set :vol_blade, 0
set :vol_blade_cut, 0
set :vol_blade_phase, 0


live_loop :blade_main, sync: :click do
  amp_val = get[:vol_blade]
  
  if amp_val > 0
    with_fx :distortion, mix: 0.7 do
      sample "C:/Users/Berke/Music/AbleforSonic2023/blade.wav", amp: amp_val, beat_stretch: 16, pitch: -3
    end
  end
  
  sleep 16
end

live_loop :blade_cut, sync: :click do
  amp_val = get[:vol_blade_cut]
  
  if amp_val > 0
    with_fx :distortion, mix: 0.7 do
      sample "C:/Users/Berke/Music/AbleforSonic2023/blade_cut.wav", amp: amp_val, beat_stretch: 16, pitch: -3
    end
  end
  
  sleep 16
end

live_loop :blade_phase, sync: :click do
  amp_val = get[:vol_blade_phase]
  
  if amp_val > 0
    with_fx :distortion, mix: 0.7 do
      sample "C:/Users/Berke/Music/AbleforSonic2023/blade_phase.wav", amp: amp_val, beat_stretch: 64, pitch: -3
    end
  end
  
  sleep 64
end


#################################################################################################

set :vj_tech, 0
set :vj_dnb, 0
##| set :vj_chaos, 0


live_loop :vj_youtube, sync: :click do
  stop
  mod_tech = get[:vj_tech]
  mod_dnb = get[:vj_dnb]
  mod_chaos = get[:vj_chaos]
  
  s = tick
  
  if mod_tech > 0
    if s % 8 == 0
      midi 0, 127
      
    elsif s % 8 == 4
      j = tick(:tech_jump)
      val = (j * 2 + 2) % 128
      midi val, 127
    end
  end
  
  if mod_dnb > 0
    pat = (ring 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 30, 0, 40, 0, 50, 0)
    midi pat.look, 127
  end
  
  ##| if mod_chaos > 0
  ##|   if one_in(3)
  ##|     midi rrand_i(10, 80), 127
  ##|   else
  ##|     midi 0, 127
  ##|   end
  ##| end
  
  sleep 0.5
end



#################################################################################################


set :vol_bossmelody1, 0
set :vol_fuguebass, 0
set :vol_fuguekick, 0
set :vol_fugue_answer, 0
set :vol_amencore3, 0

set :vol_boss_lead, 0

live_loop :master_chord_generator, sync: :click do
  c_root = (ring :a2, :d2, :e2, :f2, :b1, :e2).tick(:ch_root)
  c_type = (ring :minor, :minor, :dom7, :major, :diminished, :major).look(:ch_root)
  
  set :current_chord, chord(c_root, c_type)
  sleep 4
end


live_loop :fugue_bass_amin, sync: :click do
  amp_val = get[:vol_fuguebass]
  kick_val = get[:vol_fuguekick]
  
  c = get[:current_chord] || chord(:a2, :minor)
  
  kicks = (ring
           0, 0, 0, 0,
           0, 0, 0, 0,
           1, 0, 1, 0,
           1, 0, 1, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           1, 0, 1, 0,
           1, 0, 1, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0
           )
  k = kicks.tick
  
  if amp_val > 0
    use_synth :piano
    n = c.choose
    n = n + 12 if one_in(3)
    play n, amp: amp_val, sustain: 0.35, release: 0.1
  end
  
  
  if k == 1 && kick_val > 0
    sample "C:/Users/Berke/Music/avril4/indust_kick6.wav", amp: kick_val
  end
  
  sleep 0.5
end


with_fx :reverb, room: 0.6, mix: 0.4 do
  with_fx :echo, phase: 0.75, decay: 2, mix: 0.3 do
    
    live_loop :fugue_answer_piano, sync: :click do
      amp_val = get[:vol_fugue_answer]
      
      c_base = get[:current_chord] || chord(:a2, :minor)
      
      if amp_val > 0
        use_synth :piano
        
        if !one_in(3)
          n = c_base.choose + 24
          n = n + 12 if one_in(4)
          
          play n, amp: amp_val * 0.8, cutoff: 100, release: 0.25
        end
      end
      
      sleep 0.25
    end
    
  end
end

with_fx :bitcrusher, bits: 7, sample_rate: 10000, mix: 0.4 do
  
  live_loop :boss_fight_lead, sync: :click do
    amp_val = get[:vol_boss_lead] || 0
    t = tick
    
    if amp_val > 0
      use_synth :pulse
      
      c_base = get[:current_chord] || chord(:a2, :minor)
      c_high = c_base[0] + 36
      
      phase = t % 64
      
      if phase < 16
        play c_base.choose + 36, amp: amp_val, release: 0.2, cutoff: 110
      elsif phase < 32
        if t % 2 == 0
          play c_high + 12, amp: amp_val * 1.2, release: 0.1
        else
          play c_base.choose + 36, amp: amp_val * 0.8, release: 0.1
        end
      elsif phase < 48
        if (ring 1, 0, 1, 1, 0, 1, 0, 1).look == 1
          play c_base.choose + 36, amp: amp_val, sustain: 0.1, release: 0.1
        end
      else
        play c_high + 12 - (phase % 16), amp: amp_val, release: 0.2
      end
    end
    
    sleep 0.5
  end
  
end

#################################################################################################

live_loop :amencore3, sync: :click do
  amp_val = get[:vol_amencore3]
  current_hpf = get[:master_hpf]
  if amp_val > 0
    with_fx :eq, low: 0.3 do
      with_fx :distortion, mix: 0.5 do
        sample "C:/Users/Berke/Music/avril4/amencore3.wav", amp: amp_val,
          beat_stretch: 64, hpf: current_hpf
      end
    end
  end
  sleep 64
end

#################################################################################################


drumfile = "C:/Users/Berke/Music/avril4/drumloops"

live_loop :neuro_drum_sequence, sync: :click do
  amp_val = get[:vol_neuro_drums] || 1
  
  files = [nil, "/beat1.wav", "/beat2.wav", "/beat3.wav", nil, "/beat5.wav", "/beat6.wav"]
  lengths = [0, 8, 32, 8, 0, 8, 8]
  
  gains = [0, 1, 1, 1.5, 0, 1, 1]
  
  seq = (ring
         1, 1, 1, 1,
         1, 1, 1, 3,
         1, 1, 1, 1,
         1, 1, 1, 5,
         2,
         1, 1, 1, 1,
         1, 1, 1, 3,
         1, 1, 1, 1,
         1, 1, 1, 6,
         2
         )
  
  step = seq.tick(:drum_seq)
  
  if amp_val > 0
    with_fx :eq, low: 0.3 do
      with_fx :krush, mix: 0.5 do
        with_fx :distortion, mix: 0.2 do
          sample drumfile + files[step], beat_stretch: lengths[step], amp: amp_val * gains[step]
        end
      end
    end
  end
  
  sleep lengths[step]
end

set :vol_neuro_drums, 0



