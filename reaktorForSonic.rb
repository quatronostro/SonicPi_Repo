use_debug false

use_bpm 148

set(:bpm, current_bpm)

set_mixer_control! lpf_slide: 1, lpf: 125
set_mixer_control! hpf_slide: 1, hpf: 0

live_loop :metronom do
  use_bpm get(:bpm)
  sleep 32
end

####### STAGE DRUMS

live_loop :stage_drums_kick, sync: :metronom do
  ##| stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/stage_drums_kick.wav", amp: 1
  sleep 32
end

with_fx :reverb, mix: 0.2 do
  live_loop :stage_drums_snare, sync: :metronom do
    stop
    sample "C:/Users/Berke/Music/ReaktorForSonic/stage_drums_snare.wav", amp: 1
    sleep 32
  end
end

live_loop :stage_drums_hat, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/stage_drums_hat.wav", amp: 1
  sleep 32
end

with_fx :ping_pong, mix: line(0.1, 0.7, steps: 18).mirror.look do
  live_loop :stage_drums_tie, sync: :metronom do
    stop
    sample "C:/Users/Berke/Music/ReaktorForSonic/stage_drums_tie.wav", amp: 1
    sleep 32
  end
end

with_fx :echo do
  live_loop :stage_drums_pod, sync: :metronom do
    stop
    sample "C:/Users/Berke/Music/ReaktorForSonic/stage_drums_pod.wav", amp: 1
    sleep 32
  end
end




####### TRIPOD

live_loop :tripod_kick, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/tripod_kick.wav", amp: 1
  sleep 32
end

live_loop :tripod_snare, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/tripod_snare.wav", amp: 1
  sleep 32
end

live_loop :tripod_hat, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/tripod_hat.wav", amp: 1
  sleep 32
end

live_loop :tripod_tie, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/tripod_tie.wav", amp: 1
  sleep 32
end

live_loop :tripod_pod, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/tripod_pod.wav", amp: 1
  sleep 32
end



####### NUTSHELL

live_loop :nutshell_kick, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/nutshell_kick.wav", amp: 1
  sleep 32
end

live_loop :nutshell_snare, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/nutshell_snare.wav", amp: 1
  sleep 32
end

live_loop :nutshell_hat, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/nutshell_hat.wav", amp: 1
  sleep 32
end

live_loop :nutshell_tie, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/nutshell_tie.wav", amp: 1
  sleep 32
end

live_loop :nutshell_pod, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/nutshell_pod.wav", amp: 1
  sleep 32
end



####### FRUIT

live_loop :fruit_kick, sync: :metronom do
  ##| stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/fruit_kick.wav", amp: 1
  sleep 32
end

live_loop :fruit_snare, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/fruit_snare.wav", amp: 1
  sleep 32
end

live_loop :fruit_hat, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/fruit_hat.wav", amp: 1
  sleep 32
end

live_loop :fruit_tie, sync: :metronom do
  stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/fruit_tie.wav", amp: 1
  sleep 32
end

live_loop :fruit_pod, sync: :metronom do
  ##| stop
  sample "C:/Users/Berke/Music/ReaktorForSonic/fruit_pod.wav", amp: 1
  sleep 32
end
