use_debug false
##| use_sched_ahead_time 1
use_bpm 148
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




basses = "C:/Users/Berke/Music/AbleforSonic3/"



###Directories--------------------------------------------------------------------------



live_loop :scndnd1, sync: :bar do
  if tracker[1]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/2nd1.wav", amp: 1
    sleep 32
  else
    sleep 1
  end
end


live_loop :scndnd2, sync: :bar do
  if tracker[2]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/2nd2.wav", amp: 1.1, cutoff: 120
    sleep 32
  else
    sleep 1
  end
end


live_loop :scndndk, sync: :bar do
  if tracker[3]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/2nd_kick.wav", amp: 1
    sleep 32
  else
    sleep 1
  end
end


live_loop :scndndb, sync: :bar do
  if tracker[4]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/2nd_beat.wav", amp: 1
    sleep 32
  else
    sleep 1
  end
end


live_loop :scndndchord, sync: :bar do
  if tracker[5]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/2nd_chord.wav", amp: 1, pitch: -0.5,
      cutoff: line(95, 125, steps: 8).mirror.tick
    sleep 32
  else
    sleep 1
  end
end

with_fx :eq, high: -1, mid: -0.5 do
  with_fx :distortion, mix: 0.1 do
    live_loop :kick4, sync: :bar do
      if tracker[6]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic3/kick_sine.wav", amp: 1.5
        sleep 1
      else
        sleep 1
      end
    end
  end
end

live_loop :bassES, sync: :bar do
  if tracker[7]>0 then
    samplename = ["bass4_n", "bass4_n", "bass_f", "bass_f", "bass_a", "bass_a"].tick
    sample basses, samplename, amp: 1.21
    sleep 16
  else
    sleep 1
  end
end


live_loop :kick5, sync: :bar do
  if tracker[8]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/nice_kick.wav", amp: 1.2
    sleep 16
  else
    sleep 1
  end
end

live_loop :bb, sync: :bar do
  if tracker[9]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/bass_bridge.wav", amp: 1.01
    sleep 32
  else
    sleep 1
  end
end

live_loop :bassES_ctf, sync: :bar do
  if tracker[10]>0 then
    samplename = ["bass4_n", "bass4_n", "bass_f", "bass_f", "bass_a", "bass_a"].tick
    sample basses, samplename, amp: 1.21, cutoff: 80
    sleep 16
  else
    sleep 1
  end
end

live_loop :hb, sync: :bar do
  if tracker[11]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hard_beat.wav", amp: 1,
      cutoff: line(80, 120, steps: 6).mirror.tick
    sleep 16
  else
    sleep 1
  end
end

live_loop :hf, sync: :bar do
  if tracker[12]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hard_brake_short.wav", amp: 1
    sleep 8
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.35 do
  live_loop :he, sync: :bar do
    if tracker[13]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/hard_eslik.wav", amp: 1
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :ride11, sync: :bar do
    if tracker[14]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/ride.wav", amp: 0.9
      sleep 4
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :hhf, sync: :bar do
    if tracker[15]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/hh_falan.wav", amp: 0.9
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :leaddyy, sync: :bar do
    if tracker[16]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/leady.wav", amp: 1,
        cutoff: line(90, 125, steps: 8).mirror.tick
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :kick6, sync: :bar do
  if tracker[17]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/kick_burn.wav", amp: 1.2
    sleep 1
  else
    sleep 1
  end
end

live_loop :ophh1, sync: :bar do
  if tracker[18]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/open_hh.wav", amp: 0.89, cutoff: 121
    sleep 8
  else
    sleep 1
  end
end

live_loop :clhh1, sync: :bar do
  if tracker[19]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/closed_hh.wav", amp: 0.89, cutoff: 119
    sleep 16
  else
    sleep 1
  end
end

live_loop :collission, sync: :bar do
  if tracker[20]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/colli_bass.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

live_loop :bilmiyor, sync: :bar do
  if tracker[21]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/bilmiyorum.wav", amp: 1
    sleep 4
  else
    sleep 1
  end
end

live_loop :sacmalamasyon, sync: :bar do
  if tracker[22]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/saçma.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

with_fx :eq, low: -1 do
  live_loop :leaddyy2, sync: :bar do
    if tracker[23]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/leady.wav", amp: 1
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: 0.5 do
  live_loop :hard_times1, sync: :bar do
    if tracker[24]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_beat.wav", amp: 1.1
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :hard_times_sub, sync: :bar do
  if tracker[25]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_dofa_sub.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

live_loop :hard_times_dofa1, sync: :bar do
  if tracker[26]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_dofa2.wav", amp: 1.14
    sleep 16
  else
    sleep 1
  end
end

live_loop :hard_times_rtm1, sync: :bar do
  if tracker[27]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_rtm.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

live_loop :hard_times_dofa2, sync: :bar do
  if tracker[28]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_dofa1.wav", amp: 1.14
    sleep 16
  else
    sleep 1
  end
end

live_loop :hard_times_rtm2, sync: :bar do
  if tracker[29]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/hardtimes_rtm2.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

with_fx :eq, high: 1.2 do
  live_loop :trv, sync: :bar do
    if tracker[30]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic3/travilazir.wav", amp: 1.12
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :kick7, sync: :bar do
  if tracker[31]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic3/kick_burn.wav", amp: 1.25
    sleep ring(1, 1, 1, 1, 1, 1, 1, 0.5, 0.5).tick
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.34 do
  live_loop :do_fault, sync: :bar do
    if tracker[32]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/dofault.wav", amp: 0.75
      sleep 16
    else
      sleep 1
    end
  end
end



##|    ___     __                    _       __ 
##|   <  /____/ /_   _______________(_)___  / /_
##|   / / ___/ __/  / ___/ ___/ ___/ / __ \/ __/
##|  / (__  ) /_   (__  ) /__/ /  / / /_/ / /_  
##| /_/____/\__/  /____/\___/_/  /_/ .___/\__/  
##|                               /_/           



###Scripts--------------------------------------------------------------



start_loop 1 #2nd1
sleep 128
start_loop 2 #2nd2
sleep 64
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
start_loop 3 #2ndkick
sleep 32
start_loop 4 #2ndbeat
sleep 64
stop_loop 3
start_loop 5 #2ndchord
sleep 32
start_loop 8 #nice kik
stop_loop 2
stop_loop 4
sleep 64
stop_loop 1
start_loop 7 #bass_group
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
start_loop 4
sleep 32
set_mixer_control! hpf_slide: 4, hpf: 58
sleep 32
set_mixer_control! hpf_slide: 0.5, hpf: 5
stop_loop 5
sleep 32
stop_loop 8
sleep 32
stop_loop 4
start_loop 6 #kick_sine
start_loop 14 #ride
sleep 64
stop_loop 6
stop_loop 7
start_loop 9
sleep 32
stop_loop 9
stop_loop 14
start_loop 11 #hard_beat
start_loop 10
start_loop 8
sleep 92
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
stop_all #----
start_loop 12 #hard_break
sleep 8
stop_loop 12
start_loop 7 #bass_group
start_loop 6 #kick sine
start_loop 4
start_loop 15 #hh_falan
start_loop 14 #ride
start_loop 11
sleep 32
start_loop 13 #hard_eslik
sleep 32
stop_loop 4
stop_loop 6
stop_loop 14
sleep 4
start_loop 6 #kick_sine
sleep 16
stop_loop 11 #hard_beat
sleep 16
stop_loop 15
sleep 32
stop_loop 6
stop_loop 13
start_loop 16 #leady
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
start_loop 17 #kick_burn
sleep 32
start_loop 14
sleep 32
start_loop 18 #hh
start_loop 19 #closedhh
sleep 32
set_mixer_control! hpf_slide: 4, hpf: 58
sleep 32
set_mixer_control! hpf_slide: 0.5, hpf: 5
stop_loop 19 #cls hh
stop_loop 7
sleep 16
stop_loop 15
sleep 16
stop_loop 18 #open hh
sleep 16
start_loop 20 #collision
sleep 32
stop_loop 17
stop_loop 16 #leady
start_loop 21 #bilmiyorum
sleep 16
start_loop 14
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
stop_all #----
start_loop 12 #hard_break
sleep 8
stop_loop 12
start_loop 17
start_loop 23 #leady_uncut
start_loop 21 #bilmiyorum
start_loop 20 #collision
sleep 32
start_loop 18
sleep 16
start_loop 19
sleep 16
stop_loop 20
sleep 32
stop_loop 17
start_loop 14
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
stop_all #----
start_loop 24 #hardtimes beat
sleep 32
start_loop 25 #sub
sleep 16
start_loop 26 #dofa1
sleep 16
stop_loop 24
start_loop 27 #rtm
sleep 32
start_loop 28 #dofa2
sleep 32
start_loop 24
sleep 16
start_loop 29 #rtm2
sleep 60
set_mixer_control! hpf_slide: 1, hpf: 75
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 5
start_loop 31
stop_loop 29
start_loop 14
stop_loop 24
stop_loop 25
stop_loop 26
stop_loop 27
sleep 64
start_loop 32
stop_loop 14
start_loop 30
sleep 64
stop_loop 31
start_loop 24
start_loop 29
sleep 32
stop_loop 29
sleep 32
stop_loop 24
start_loop 25
sleep 64
stop_all #----

with_fx :reverb do
  1.times do
    sample "C:/Users/Berke/Music/AbleforSonic3/travilazir.wav", rpitch: -12, finish: 0.16, amp: 1.5
    sleep 4
  end
end



