

##with_fx :eq, high: 0, high_shelf: -1 do

##    with_fx :echo, amp: 0.2, mix: 0.2 do
##      with_fx :compressor, mix: 1 do
##        with_fx :autotuner, formant_ratio: 3, note: 60, mix: 0.3 do
##          with_fx :bitcrusher, bits: 1, cutoff: 100 do
#with_fx :flanger, feedback: 0.6, decay: 1, phase: 2 do
#with_fx :bitcrusher, mix: 1, bits: 12 do
with_fx :ping_pong, phase: 16 do
  with_fx :pitch_shift, pitch: -36, mix: 0.8 do
    with_fx :reverb, mix: 0.4 do
      live_audio :ben do
        use_synth :piano
        play :c5
      end
    end
  end
end
##      end
##    end
##  end
##end
