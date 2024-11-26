s1 = "C:/Users/Berke/Music/kasım24/sounds/731971__looplicator__159-bpm-industrial-glitch-loop-410-wav.wav"
s2 = "C:/Users/Berke/Music/kasım24/sounds/731999__looplicator__159-bpm-industrial-synth-loop-425-wav.wav"
s3 = "C:/Users/Berke/Music/kasım24/sounds/732462__looplicator__159-bpm-industrial-tribal-loop-476-wav.wav"
s4 = "C:/Users/Berke/Music/kasım24/sounds/759334__looplicator__159-bpm-industrial-drum-loop-6083-wav.wav"
s5 = "C:/Users/Berke/Music/kasım24/sounds/759665__looplicator__159-bpm-industrial-drum-loop-6165-wav.wav"
s6 = "C:/Users/Berke/Music/kasım24/sounds/762750__looplicator__159-bpm-industrial-drum-loop-6953-wav.wav"
s7 = "C:/Users/Berke/Music/kasım24/sounds/763027__looplicator__159-bpm-industrial-synth-loop-7054-wav.wav"
s8 = "C:/Users/Berke/Music/kasım24/sounds/765212__looplicator__159-bpm-industrial-drum-loop-7301-wav.wav"



use_debug false
use_bpm 159

live_loop :click do
  sleep 1
end

live_loop :s5, sync: :click do
  stop
  sample s5, amp: 1.1
  sleep 32
end

live_loop :s1, sync: :click do
  stop
  sample s1, amp: 1.1
  sleep 32
end

live_loop :s2, sync: :click do
  stop
  sample s2, amp: 1
  sleep 32
end

live_loop :s3, sync: :click do
  stop
  sample s3, amp: 1.1
  sleep 32
end

with_fx :distortion, mix: 0.2 do
  live_loop :s4, sync: :click do
    stop
    sample s4, amp: 0.9
    sleep 32
  end
end

live_loop :s6, sync: :click do
  stop
  sample s6, amp: 1.2
  sleep 32
end

with_fx :distortion, mix: 0.5 do
  live_loop :s7, sync: :click do
    stop
    sample s7
    sleep 16
  end
end


with_fx :distortion, distort: 0.5 do
  live_loop :kick_glitch, sync: :click do
    stop
    sample "C:/Users/Berke/Music/kasım24/SSDL_BD_04.wav", amp: 2.4, rpitch: -2, hpf: 0
    sample :bd_klub, amp: 2.7, rpitch: 9, finish: 0.1
    sleep [1, 1, 1, 1, 1, 1, 1, 0.5, 0.5].tick
    ##| sleep 1
  end
end



