use_debug false
##| use_sched_ahead_time 1
use_bpm 148
set(:bpm, current_bpm)
set(:stop, false)


set_mixer_control! lpf_slide: 1, lpf: 130
set_mixer_control! hpf_slide: 1, hpf: 0

tracker = [0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0]


define :start_loop do |i|
  tracker[i] = 1
end

define :stop_loop do |i|
  tracker[i] = 0
end

define :stop_all do
  tracker[0] = 0
  tracker[1] = 0
  tracker[2] = 0
  tracker[3] = 0
  tracker[4] = 0
  tracker[5] = 0
  tracker[6] = 0
  tracker[7] = 0
  tracker[8] = 0
  tracker[9] = 0
  tracker[10] = 0
  tracker[11] = 0
  tracker[12] = 0
  tracker[13] = 0
  tracker[14] = 0
  tracker[15] = 0
  tracker[16] = 0
  tracker[17] = 0
  tracker[18] = 0
  tracker[19] = 0
  tracker[20] = 0
  tracker[21] = 0
  tracker[22] = 0
  tracker[23] = 0
  tracker[24] = 0
  tracker[25] = 0
  tracker[26] = 0
  tracker[27] = 0
  tracker[28] = 0
end

live_loop :heart do
  use_bpm get(:bpm)
  sleep 1
end

###Directories--------------------------------------------------------------------------


live_loop :intro, sync: :heart do
  if tracker[1]>0 then
    sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis45_pod.wav", amp: 1.1
    sleep 32
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.3 do
  live_loop :tie_me, sync: :heart do
    if tracker[2]>0 then
      sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis45_tie.wav", amp: line(0.2, 1, steps: 8).tick
      sleep 32
    else
      sleep 1
    end
  end
end

live_loop :yes_davis, sync: :heart do
  if tracker[3]>0 then
    sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis45_kick.wav", amp: 1.12
    sleep 32
  else
    sleep 1
  end
end

live_loop :beat_me_up, sync: :heart do
  if tracker[4]>0 then
    sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis45_snhat.wav", amp: 1, cutoff: 120
    sleep 32
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.3 do
  live_loop :look_at_me, sync: :heart do
    if tracker[5]>0 then
      sample "C:/Users/Berke/Music/ReaktorForSonic/lookatme_chord.wav", amp: line(0.2, 1, steps: 8).tick
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :kick_me, sync: :heart do
  if tracker[6]>0 then
    sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis23_kick.wav", amp: 1.1
    sleep 8
  else
    sleep 1
  end
end

live_loop :what, sync: :heart do
  if tracker[7]>0 then
    sample "C:/Users/Berke/Music/ReaktorForSonic/rdavis23_tie.wav", amp: 1.1
    sleep 16
  else
    sleep 1
  end
end



###Scripts-----------------------------------------------------------------------------

start_loop 1 #pod
sleep 32
start_loop 2 #tie
sleep 64
start_loop 3 #kick
sleep 60
set_mixer_control! hpf_slide: 1, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 1, hpf: 0
start_loop 4
sleep 64
stop_loop 2
start_loop 5 #pod_diff
sleep 32
stop_loop 3 #kick
sleep 32
stop_loop 4 #snhat
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 1, hpf: 0
stop_all
start_loop 7
sleep 16
start_loop 6










