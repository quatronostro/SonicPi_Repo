use_bpm 96


live_loop :deep_bass do
  stop
  with_fx :reverb, room: 0.2, mix: 0.4 do
    use_synth :sine
    play :c2, sustain: 32, amp: 0.5
    sleep 32
  end
end


set :current_root, :c2

with_fx :reverb, room: 0.99, mix: 0.4, damp: 0.5 do
  with_fx :echo, phase: 1.5, decay: 6, mix: 0.4 do
    
    live_loop :generative_hollow_pad do
      stop
      
      dark_scale = scale(:c2, :phrygian, num_octaves: 2)
      
      new_root = dark_scale.choose
      
      chord_type = [:minor, :diminished7, :m9, :sus2].choose
      
      creepy_chord = chord(new_root, chord_type)
      use_synth :hollow
      
      pad_cutoff = rrand(90, 120)
      
      play_chord creepy_chord, attack: rrand(4, 6), release: rrand(8, 12), amp: 0.6, cutoff: pad_cutoff
      
      use_synth :dark_ambience
      play new_root - 12, attack: 4, release: 12, amp: 0.2, cutoff: 50
      
      sleep [2, 4, 6, 8].choose
      
    end
    
  end
end




##| with_fx :reverb, mix: 0.4, room: 0.4 do
##|   1.times do
##|     sample "C:/Users/Berke/Music/AtmosYT/woman-whispering.wav", amp: 1.1
##|     sleep 44.21
##|   end
##| end


##| 1.times do
##|   sample "C:/Users/Berke/Music/AtmosYT/crickets-at-night.wav", amp: 3
##|   sleep 194
##| end



##| 1.times do
##|   sample "C:/Users/Berke/Music/AtmosYT/owls.wav", amp: 0.6
##|   sleep 250
##| end


live_loop :noises do
  stop
  
  sleep rrand(2, 8)
  
  with_fx :reverb, room: 1 do
    s = [:elec_wood, :elec_ping, :perc_impact2].choose
    
    sample s, rate: rrand(0.2, 0.5), amp: 0.4, pan: rrand(-0.8, 0.8)
  end
end



#########################################################################################

live_loop :structural_noise do
  stop
  sleep [2, 4, 6].choose
  sample :elec_filt_snare, rate: 0.15, amp: rrand(0.1, 0.2), finish: 0.1
end

live_loop :field_wind do
  stop
  use_synth :bnoise
  with_fx :reverb, room: 0.9 do
    with_fx :slicer, phase: 0.5, wave: 0, mix: 0.2 do
      play :e1,
        sustain: 4,
        amp: rrand(0.05, 0.15),
        cutoff: rrand(40, 70),
        pan: rrand(-0.8, 0.8)
      sleep 4
    end
  end
end

live_loop :spectral_church do
  stop
  use_synth :hollow
  
  notes = (scale :e3, :dorian, num_octaves: 2).ring
  
  with_fx :reverb, room: 1, mix: 0.8, damp: 0.2 do
    with_fx :echo, phase: 0.75, decay: 6, mix: 0.4 do
      
      n = notes.choose
      play n, attack: 4, sustain: 2, release: 6, amp: 0.6
      
      play n + 7, attack: 5, release: 5, amp: 0.3 if one_in(3)
      sleep [4, 8].choose
    end
  end
end

#########################################################################################





live_loop :silent_hill_pads do
  stop
  chords = [(chord :e3, :m9), (chord :c3, :major7, num_octaves: 2), (chord :bb2, :minor7), (chord :a2, :m6)]
  
  use_synth :hollow
  
  chords.each do |c|
    with_fx :reverb, room: 0.8, mix: 0.6 do
      with_fx :bitcrusher, bits: 12, sample_rate: 3000, mix: 0.02 do
        
        play c,
          attack: 4,
          sustain: 6,
          release: 8,
          amp: rrand(1.3, 1),
          cutoff: rrand(70, 105)
        
        sleep [8, 10, 12].choose
      end
    end
  end
end

with_fx :reverb, mix: 0.875 do
  live_loop :the_fog_breathing do
    stop
    sample :elec_soft_kick, amp: 0.2, rate: 0.2, finish: 0.5 if one_in(3)
    use_synth :dark_ambience
    play :e1, attack: 4, release: 8, amp: 0.5, detune: 0.5
    sleep 16
  end
end



