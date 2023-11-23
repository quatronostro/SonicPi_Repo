use_debug false
##| use_sched_ahead_time 1
use_bpm 170
set(:bpm, current_bpm)
set(:stop, false)


set_mixer_control! lpf: 130
set_mixer_control! hpf: 0

tracker = [0, 0, 0, 0,
           0, 0, 0, 0,
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
  tracker[29] = 0
  tracker[30] = 0
  tracker[31] = 0
  tracker[32] = 0
end

live_loop :bar do
  use_bpm get(:bpm)
  sleep 1
end





###Directories--------------------------------------------------------------------------



with_fx :reverb, mix: 0.2 do
  live_loop :seqa1, sync: :bar do
    if tracker[1]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/seqa1.wav", amp: line(0.5, 1, steps: 10).mirror.tick
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :psio, sync: :bar do
  if tracker[2]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/psionic.wav", amp: line(0.5, 1, steps: 8).mirror.tick
    sleep 16
  else
    sleep 1
  end
end


live_loop :risersonthestorm, sync: :bar do
  if tracker[3]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/serum_riser.wav", amp: 1
    sleep 40
  else
    sleep 1
  end
end

with_fx :distortion, mix: 0.1 do
  live_loop :darknb, sync: :bar do
    if tracker[4]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/darkDnbass.wav", amp: 1
      sleep 8
    else
      sleep 1
    end
  end
end

with_fx :eq, low: 0.5 do
  with_fx :distortion, mix: 0.4 do
    live_loop :real_dnb, sync: :bar do
      if tracker[5]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/dnb1.wav", amp: 1
        sleep 16
      else
        sleep 1
      end
    end
  end
end

with_fx :eq, low: 0.5 do
  live_loop :slayer1, sync: :bar do
    if tracker[6]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/slayer1.wav", amp: 1.4
      sleep 8
    else
      sleep 1
    end
  end
end

with_fx :krush, mix: 0.2 do
  live_loop :slayer2, sync: :bar do
    if tracker[7]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/slayer2.wav", amp: 1.4
      sleep 8
    else
      sleep 1
    end
  end
end

live_loop :scream, sync: :bar do
  if tracker[8]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/cranck.wav", amp: 1.1
    sleep 8
  else
    sleep 1
  end
end

with_fx :eq, low: 1 do
  with_fx :distortion, mix: 0.5 do
    live_loop :forty, sync: :bar do
      if tracker[9]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/fortyfor.wav", amp: 1.25
        sleep 16
      else
        sleep 1
      end
    end
  end
end

live_loop :brid_slay, sync: :bar do
  if tracker[10]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/bridge_slay.wav", amp: 1.5
    sleep 32
  else
    sleep 1
  end
end

with_fx :eq, low: 0.5 do
  with_fx :distortion, mix: 0.2 do
    live_loop :dnb2, sync: :bar do
      if tracker[11]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/dnb2.wav", amp: 1
        sleep 16
      else
        sleep 1
      end
    end
  end
end

live_loop :eslik_dnb, sync: :bar do
  if tracker[12]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/dnb_eslik.wav", amp: 1.5
    sleep 16
  else
    sleep 1
  end
end

live_loop :lead_slay, sync: :bar do
  if tracker[13]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/lead_slayer.wav", amp: 1.5
    sleep 32
  else
    sleep 1
  end
end

with_fx :eq, low: 0.5 do
  with_fx :distortion, mix: 0.2 do
    live_loop :second, sync: :bar do
      if tracker[14]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/second_phase.wav", amp: 1.5
        sleep 16
      else
        sleep 1
      end
    end
  end
end

with_fx :reverb, mix: 0.2 do
  live_loop :space_sine, sync: :bar do
    if tracker[15]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/space_sine.wav", amp: 1.4
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :puullssee, sync: :bar do
  if tracker[16]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/inpulse.wav", amp: 1.2
    sleep 16
  else
    sleep 1
  end
end




##|    ____        __              _      __
##|   |_  /_______/ / ___ ________(_)__  / /_
##|  _/_ </ __/ _  / (_-</ __/ __/ / _ \/ __/
##| /____/_/  \_,_/ /___/\__/_/ /_/ .__/\__/
##|                              /_/


###Scripts--------------------------------------------------------------



start_loop 1
sleep 96
start_loop 2
sleep 96
start_loop 3
sleep 32
stop_loop 1
stop_loop 2
sleep 6
stop_loop 3
stop_all
start_loop 4
sleep 8
stop_loop 4
start_loop 5
sleep 16
stop_loop 5
start_loop 6
sleep 8
stop_loop 6
start_loop 4
start_loop 5
sleep 8
start_loop 2
stop_loop 4
sleep 8
start_loop 7
sleep 8
stop_loop 7
start_loop 4
sleep 8
stop_loop 4
start_loop 8
sleep 8
stop_loop 8
start_loop 5
start_loop 4
sleep 8
stop_loop 4
start_loop 7
sleep 8
stop_loop 7
sleep 8
stop_all
start_loop 9
sleep 16
start_loop 10
sleep 32
stop_loop 9
start_loop 11
start_loop 12
sleep 32
start_loop 13
sleep 32
stop_all
start_loop 14
sleep 16
start_loop 11
start_loop 12
sleep 16
start_loop 15
sleep 64
start_loop 10
sleep 32
start_loop 13
sleep 32
stop_all
set_mixer_control! lpf_slide: 32, lpf: 0
start_loop 15
start_loop 16


