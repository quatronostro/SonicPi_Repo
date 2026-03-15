use_bpm 96
midi_port = "loopmidi_port_2"

live_loop :click do
  sleep 1
end


live_loop :creepy_walker, sync: :click do
  ##| stop
  use_real_time
  
  if one_in(6)
    
    stutter_note = get[:last_note] || 20
    puts "GLITCH TRIGGERED on note #{stutter_note}!"
    
    4.times do
      midi_note_on stutter_note, port: midi_port
      sleep 0.25
    end
    
  else
    
    
    step_count = tick
    
    cycle_index = step_count / 12
    base_note = 50 + (cycle_index * 2)
    
    offset = (ring 0, 2, 4, 6).look
    
    current_note = base_note + offset
    
    set :last_note, current_note
    
    puts "Footstep: Note #{current_note}"
    midi_note_on current_note, port: midi_port
    
    sleep 1
  end
end



live_loop :asmr, sync: :click do
  ##| stop
  use_real_time
  sample "C:/Users/Berke/Music/96BPM/asmr-loop.wav", amp: 1
  sleep 32
end

live_loop :horror, sync: :click do
  ##| stop
  use_real_time
  sample "C:/Users/Berke/Music/96BPM/horror-loop.wav", amp: 1
  sleep 32
end

live_loop :drum_loop1, sync: :click do
  stop
  use_real_time
  sample "C:/Users/Berke/Music/96BPM/96-bpm-industrial-drum-loop1.wav", amp: 1.2
  sleep 32
end

live_loop :drum_loop2, sync: :click do
  stop
  use_real_time
  sample "C:/Users/Berke/Music/96BPM/96-bpm-industrial-drum-loop2.wav", amp: 1.3
  sleep 32
end

live_loop :drum_loop3, sync: :click do
  stop
  use_real_time
  sample "C:/Users/Berke/Music/96BPM/96-bpm-industrial-drum-loop3.wav", amp: 1.2
  sleep 32
end

with_fx :eq, low: -0.2, mid: 0.5 do
  with_fx :distortion, mix: 0.2 do
    live_loop :beat_loop, sync: :click do
      ##| stop
      use_real_time
      sample "C:/Users/Berke/Music/96BPM/industrial-beat-96-bpm-8-bars-1.wav", amp: 1.5
      sleep 32
    end
  end
end



live_loop :industrial_beat, sync: :click do
  stop
  tick
  use_real_time
  with_fx :bitcrusher, bits: 8, sample_rate: 8000 do
    if (bools 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0).look
      sample :bd_haus, rate: 0.8, amp: 2, cutoff: 110
    end
  end
  
  if one_in(6)
    with_fx :reverb, room: 0.8 do
      sample :elec_cymbal, rate: 0.25, finish: 0.1, amp: 0.4, cutoff: 100, pan: rrand(-0.5, 0.5)
    end
  end
  
  sample :glitch_perc1, amp: 0.8, cutoff: 100, rate: 2 if (spread 3, 16).look
  
  sleep 0.25
end





live_loop :rusted_depths, sync: :click do
  ##| stop
  use_real_time
  
  notes = (ring :c2, :db2, :eb2, :c2, :f2, :eb2).ring
  
  use_synth :prophet
  
  with_fx :reverb, room: 0.55, mix: 0.75 do
    with_fx :distortion, distort: 0.4, mix: 0.3 do
      
      n = notes.tick
      
      play n,
        attack: 2,
        sustain: 2,
        release: 4,
        cutoff: 65,
        amp: 1
      
      if one_in(4)
        play n + 12, attack: 4, release: 5, amp: 0.4, res: 0.9
      end
      
      sleep [4, 8].choose
    end
  end
end

live_loop :depth_debris, sync: :click do
  ##| stop
  use_real_time
  
  use_synth :chipbass
  
  with_fx :slicer, phase: 0.25, wave: 1, smooth: 0.1, mix: 0.8 do
    with_fx :bitcrusher, bits: [4, 6, 8].choose, mix: 0.4 do
      with_fx :reverb, room: 0.7, mix: 0.3 do
        
        n = (ring :c2, :c2, :db2, :c1).tick
        
        play n,
          sustain: 2,
          release: 0.5,
          cutoff: rrand(60, 90),
          amp: rrand(0.1, 0.4),
          pulse_width: rrand(0.1, 0.9)
        
        sleep 2
      end
    end
  end
end

live_loop :piano, sync: :click do
  stop
  use_real_time
  
  midi_numbers = (ring 67, 68, 70, 72).reflect
  
  use_synth :piano
  
  with_fx :reverb, room: 0.3, mix: 0.4 do
    n = midi_numbers.tick
    
    play n, cutoff: 80, release: 3
    
    
    midi n, vel: 100, port: "loop_midi_port_1"
    
    if look % 4 == 0
      play n + 12, amp: 0.3, release: 0.25
      midi n + 12, vel: 80, port: "loop_midi_port_1"
    end
    
    sleep 0.25
  end
end



##############################################################################################

use_random_seed 2025

live_loop :haunted_kalimba, sync: :click do
  stop
  use_real_time
  if one_in(3)
    sleep 4
  else
    
    with_fx :echo, phase: 0.75, decay: 4, mix: 0.4 do
      with_fx :reverb, mix: 0.5 do
        
        8.times do
          use_synth :kalimba
          
          n = scale(:c5, :harmonic_minor).choose
          
          play n, amp: rrand(1.2, 1), release: 2, pan: rrand(-0.2, 0.2)
          
          sleep [0.25, 0.5].choose
        end
        
      end
    end
  end
  
end


###"""amp: rrand(1.2, 1)




##| live_loop :vibration, sync: :click do
##|   stop
##|   use_real_time
##|   sample "C:/Users/Berke/Music/96BPM/vibration-melody-96-bpm-loop.flac", amp: 1
##|   sleep 63.5
##| end



