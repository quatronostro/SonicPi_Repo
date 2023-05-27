use_bpm 100

##with_fx :eq, high: 0, high_shelf: -1 do
with_fx :pitch_shift, pitch: 3 do
  ##    with_fx :echo, amp: 0.2, mix: 0.2 do
  ##      with_fx :compressor, mix: 1 do
  #with_fx :autotuner, mix: 0.3 do
  ##| with_fx :bitcrusher, mix: 0.9 do
  #with_fx :reverb do
  with_fx :sound_out_stereo do
    with_fx :reverb, mix: 0.9, room: 0.85 do
      live_audio :ben do
        use_synth :piano
        play :c5
      end
    end
  end
end
##| end