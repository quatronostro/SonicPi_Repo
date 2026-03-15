
use_midi_defaults port: "loopmidi_port_2"

use_debug false
use_bpm 96

live_loop :click do
  sleep 1
end



live_loop :to_YouTube, sync: :click do
  stop
  use_real_time
  ##| use_random_seed 6546
  
  
  ######################## MELODY ###########################
  ##| n = [12, 17, 12, 19]
  ##| midi_note_on n.tick
  
  ##| sleep [4, 2, 4, 2].look
  
  ######################## JUST RANDOM ###########################
  ##| n = rrand_i(1, 125)
  ##| midi_note_on n
  
  ##| sleep 1
  
  ######################## EUCLIDIAN ###########################
  ##| if spread(5, 16).tick
  ##|   midi_note_on rrand_i(5, 99), port: "loopmidi_port_2"
  ##| end
  
  ##| sleep 1
  
  ######################## STUTTER ###########################
  ##| note_to_stutter = 60
  
  ##| density 4 do
  ##|   midi_note_on note_to_stutter, port: "loopmidi_port_1"
  ##|   sleep 1
  ##| end
  
  ##| sleep 0.5
  
  #############################################################
end

live_loop :rythm_2, sync: :click do
  stop
  use_real_time
  with_fx :distortion, mix: 0.4 do
    with_fx :reverb, mix: 0.6 do
      
      sample :tabla_ghe2, sustain: 1, amp: 1.3, rpitch: -13, cutoff: 130
      s = [1.75, 1.75, 1.75, 1.75, 0.5, 0.5]
      sleep s.tick
    end
  end
end

perc = "C:/Users/Berke/Music/kasım24/perc"

with_fx :distortion, mix: 0.4 do
  with_fx :reverb, room: 0.8 do
    live_loop :perc, sync: :click do
      stop
      use_real_time
      
      samplename = ["RAW_DDT_PRC_01", "RAW_DDT_PRC_02", "RAW_DDT_PRC_03", "RAW_DDT_PRC_05"].choose
      
      sample perc, samplename, cutoff: line(95, 70, steps: 16).mirror.tick, amp: rrand(1, 0.6)
      s = [1.75, 1.75, 1.75, 1.75, 0.5, 0.5, 0.5]
      sleep s.tick
    end
  end
end


with_fx :reverb, mix: 0.4 do
  live_loop :hi_hat_random, sync: :click do
    stop
    use_real_time
    sleep [0.25, 0.25].choose
    sample :drum_cymbal_closed, rate: 2, cutoff: 120, pan: rrand(-1, 0.6), amp: 1 if one_in(2)
  end
end

live_loop :acid_lead, sync: :click do
  stop
  use_real_time
  use_synth :bnoise
  with_fx :bitcrusher, phase: 0.5, mix: 0.3 do
    play (scale :e2, :dorian).choose, release: 0.1, cutoff: 130, res: 0.9, amp: 0.5
    sleep [0.25, 0.75].choose
  end
end








live_loop :radio_static, sync: :click do
  stop
  use_real_time
  sleep rrand(0.2, 2)
  
  with_fx :slicer, phase: 0.1, wave: 1, invert_wave: 1 do
    with_fx :bpf, centre: rrand(70, 110) do
      use_synth :noise
      play 60, release: 0.2, amp: rrand(0.5, 1.1)
    end
  end
  
  if one_in(3)
    use_synth :sine
    play rrand(80, 100), release: 0.05, amp: 0.2
  end
end

######################################################################################
######################################################################################


live_loop :rusted_piano, sync: :click do
  stop
  use_real_time
  
  notes = (ring :e3, :g3, :fs3, :b2, :as2, :e3)
  
  use_synth :piano
  
  with_fx :reverb, room: 0.4, mix: 0.7 do
    n = notes.tick
    play n,
      cutoff: 80,
      release: 3
    play n - 24, amp: 0.7, release: 8 if look % 4 == 0
    sleep [4, 4, 2, 6].choose
  end
end

live_loop :rusted_shadow, sync: :click do
  stop
  use_real_time
  
  notes = (ring :e3, :g3, :fs3, :b2, :as2, :e3).reverse
  use_synth :hollow
  
  with_fx :reverb, room: 0.8, mix: 0.5 do
    with_fx :echo, phase: 0.75, decay: 4, mix: 0.3 do
      
      n = notes.tick
      play n + 12,
        attack: 2,
        release: 4,
        amp: rrand(0.4, 0.9),
        cutoff: 80
      sleep 4
    end
  end
end

live_loop :rusted_pulses, sync: :click do
  stop
  use_real_time
  
  use_synth :chipbass
  with_fx :reverb, room: 0.6, mix: 0.4 do
    with_fx :lpf, cutoff: 70 do
      
      8.times do
        if spread(5, 8).tick
          play :e4,
            release: 0.1,
            amp: rrand(0.7, 0.25),
            pan: rrand(-0.5, 0.5)
        end
        
        sample :elec_filt_snare, rate: 4, amp: 1, finish: 0.01 if one_in(12)
        
        sleep 0.25
      end
      
    end
  end
end

live_loop :radio_static2, sync: :click do
  stop
  use_real_time
  
  use_synth :noise
  with_fx :lpf, cutoff: 70 do
    with_fx :slicer, phase: 0.25, wave: 0, mix: 0.5 do
      amp_sweep = (line 0.07, 0.75, steps: 64).mirror.tick
      play :e1, sustain: 8, release: 2, amp: amp_sweep
      sleep 8
    end
  end
end

live_loop :distant_siren, sync: :click do
  stop
  use_real_time
  
  use_synth :prophet
  with_fx :reverb, room: 1, mix: 0.8 do
    n = play :e1, sustain: 12, release: 4, amp: 0.5, note_slide: 8, cutoff: 100
    control n, note: :f2
    sleep 32
  end
end


live_loop :debris, sync: :click do
  stop
  use_real_time
  
  sample :elec_filt_snare, rate: 0.2, amp: rrand(0.1, 0.3) if one_in(4)
  sample :perc_door, rate: 0.5, amp: 0.3 if one_in(6)
  sleep [2, 4, 8].choose
end


live_loop :kicks, sync: :click do
  stop
  use_real_time
  
  sample :bd_kick, amp: 2, cutoff: 100, rate: 0.5
  sample :bd_haus, amp: 1.2, cutoff: 80 if (spread 3, 8).look
  
  sleep 1
end


live_loop :metal_hats, sync: :click do
  stop
  
  use_real_time
  
  with_fx :hpf, cutoff: 110 do
    sample :elec_cymbal,
      amp: rrand(0.3, 0.6),
      rate: 3,
      finish: 0.02 if spread(5, 8).tick
  end
  sleep 0.25
end





