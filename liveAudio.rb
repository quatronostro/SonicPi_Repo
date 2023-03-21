
with_fx :distortion, distort: 0.2 do
  with_fx :flanger, delay: 0.6 do
    with_fx :gverb do
      live_audio :ben do |input|
        # set the echo delay time
        delay = 0.5
        
        # process the sound input
        with_fx :echo, delay: delay do
          # play back the processed sound
          synth :beep, note: :c4, amp: 1
        end
      end
    end
  end
end
