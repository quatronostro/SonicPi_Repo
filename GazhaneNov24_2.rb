use_bpm 96


live_loop :deep_bass  do
  stop
  with_fx :reverb, room: 1, mix: 0.7 do
    use_synth :sine
    play :c2, sustain: 32, amp: 1
    sleep 32
  end
end

live_loop :harmonic_flow do
  stop
  with_fx :lpf, cutoff: 55 do
    with_fx :hpf, cutoff: 30 do
      with_fx :compressor, clamp_time: 0.2, threshold: 0.9 do
        with_fx :reverb, room: 0.5, mix: 0.5 do
          
          use_synth :hollow
          play chord(:c4, :minor7), attack: 4, decay: 0.5, sustain: 8, release: 4, amp: 1.1
          sleep 8
          play chord(:eb3, :minor), attack: 3, decay: 0.5, sustain: 8, release: 4, amp: 1.1
          sleep 8
          play chord(:ab3, :M7), attack: 2, decay: 0.5, sustain: 8, release: 4, amp: 1.1
          sleep 8
          play chord(:g3, :m7), attack: 1, decay: 0.5, sustain: 8, release: 4, amp: 1.1
          sleep 8
        end
      end
    end
  end
end

live_loop :melodic_accents do
  stop
  with_fx :pan, amp: 2 do
    with_fx :reverb, room: 1, mix: 0.4 do
      use_synth :kalimba
      play scale(:eb4, :minor_pentatonic).choose, release: 0.1, amp: 1
      sleep 8
    end
  end
end


live_loop :breathing_bass do
  stop
  with_fx :reverb, room: 1, mix: 0.5 do
    use_synth :bass_foundation
    play :c2, sustain: 6, amp: 0.7, cutoff: 50
    sleep 8
    play :eb2, sustain: 6, amp: 0.7, cutoff: 50
    sleep 8
    play :ab2, sustain: 6, amp: 0.7, cutoff: 50
    sleep 8
    play :g2, sustain: 6, amp: 0.7, cutoff: 50
    sleep 8
  end
end


live_loop :wind_chimes do
  stop
  with_fx :reverb, room: 1, mix: 0.6 do
    with_fx :pan, amp: 1.3 do
      use_synth :kalimba
      play scale(:c4, :minor_pentatonic).choose, release: 2, amp: 1.3
      sleep [1, 1.5, 2, 3].choose
      play scale(:eb4, :minor_pentatonic).choose, release: 2, amp: 1.3
      sleep [1, 0.5, 2, 3].choose
      play scale(:ab3, :major_pentatonic).choose, release: 2, amp: 1.3
      sleep [1, 1.5, 2, 3].choose
      play scale(:g3, :minor_pentatonic).choose, release: 2, amp: 1.3
      sleep [1, 0.25, 2, 3].choose
    end
  end
end

live_loop :quick_chimes do
  stop
  with_fx :reverb, room: 0.8, mix: 0.9 do
    with_fx :pan, amp: 1.3 do
      use_synth :kalimba
      play scale(:c3, :minor_pentatonic).choose, amp: 1.3
      sleep 0.25
      play scale(:eb3, :minor_pentatonic).choose, amp: 1.3
      sleep 0.25
      play scale(:ab3, :major_pentatonic).choose, amp: 1.3
      sleep 0.25
      play scale(:g3, :minor_pentatonic).choose, amp: 1.3
      sleep 0.25
    end
  end
end