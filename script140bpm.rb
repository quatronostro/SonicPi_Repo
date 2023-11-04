use_debug false
##| use_sched_ahead_time 1
use_bpm 140
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

live_loop :bar do
  use_bpm get(:bpm)
  sleep 1
end


###Directories--------------------------------------------------------------------------

with_fx :echo, phase: rrand(0, 5), mix: 0.4 do
  with_fx :reverb, mix: 0.56, room: 0.42 do
    live_loop :intro1, sync: :bar do
      if tracker[1]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/djembe_loop.wav", cutoff: line(80, 120, steps: 160).mirror.tick,
          slice: pick
        sleep 1
      else
        sleep 1
      end
    end
  end
end

with_fx :reverb, mix: 0.34 do
  live_loop :chords do
    if tracker[2]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/carpa_chords.wav", amp: 1.2,
        cutoff: line(120, 0, steps: 12).tick
      sleep 64
    else
      sleep 1
    end
  end
end

with_fx :ring_mod, mix: 0.34 do
  live_loop :element_loop do
    if tracker[3]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/step_element.wav", amp: line(0.75, 1.25, steps: 12).tick,
        cutoff: 100
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :bass do
  if tracker[4]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/somnifereous.wav", amp: 1.5
    sleep 16
  else
    sleep 1
  end
end

k = (knit true, 3, false, 1)
live_loop :rodeo_bass2 do
  if tracker[5]>0 then
    if k.choose
      sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/electricfence.wav", amp: 1.2
    else
      with_fx :reverb do
        sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/electricfence.wav", amp: 1.2
      end
    end
    sleep 16
  else
    sleep 1
  end
end


live_loop :new_school1 do
  if tracker[6]>0 then
    sample :bd_klub, amp: 1
    sleep 1
  else
    sleep 1
  end
end

live_loop :siren do
  if tracker[7]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/siren.wav", amp: 1.1
    sleep 64
  else
    sleep 1
  end
end

with_fx :ping_pong, phase: 2, feedback: 0.5 do
  with_fx :reverb, mix: 0.3 do
    live_loop :tomak do
      if tracker[8]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/tomak.wav", amp: 1.1,
          window_size: 2
        sleep 8
      else
        sleep 1
      end
    end
  end
end




###Scripts-----------------------------------------------------------------------------

start_loop 1 #
sleep 256
start_loop 2
sleep 128
start_loop 3
sleep 128
start_loop 4
sleep 120
set_mixer_control! hpf_slide: 6, hpf: 80
sleep 8
set_mixer_control! hpf_slide: 1, hpf: 0
stop_all
start_loop 5
sleep 16
start_loop 6
sleep 48
start_loop 7
sleep 60
set_mixer_control! hpf_slide: 2, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 1, hpf: 0
stop_loop 7
start_loop 8








###Solo------------------------------------------------------------------------------

use_debug false

use_bpm 140

with_fx :reverb, mix: 0.23 do
  1.times do
    sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/edgar.wav", amp: 1.46
    sleep 536
  end
end


####-----------------------------------------------------------------------------------

use_debug false

use_bpm 140

with_fx :reverb, mix: 0.45, room: 0.5 do
  live_loop :pipe do
    ##| stop
    sample "C:/Users/Berke/Music/AbleforSonic2023/datapoint/steam_pipe.wav", amp: rrand(1.65, 1.75),
      release: 4
    sleep rrand_i(8, 32)
  end
end







