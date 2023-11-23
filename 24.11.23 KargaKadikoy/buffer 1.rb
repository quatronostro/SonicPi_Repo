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


with_fx :eq, low: -0.5, mid: 0.75 do
  live_loop :loki, sync: :bar do
    if tracker[1]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/lokiMyth.wav", amp: 1.25
      sleep 64
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1.1 do
  live_loop :lokiChords, sync: :bar do
    if tracker[2]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/lokiMythChord.wav", amp: 0.81
      sleep 64
    else
      sleep 1
    end
  end
end

with_fx :distortion, mix: 0.1 do
  live_loop :kick, sync: :bar do
    if tracker[3]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/frenchKick.wav", amp: 1.15
      sleep ring(1, 1, 1, 1, 1, 1, 1, 0.5, 0.5).tick
    else
      sleep 1
    end
  end
end


live_loop :trap, sync: :bar do
  if tracker[4]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/frenchTrap.wav", amp: 1.18
    sleep 4
  else
    sleep 1
  end
end


with_fx :gverb, mix: line(0.1, 0.5, steps: 10).mirror.tick do
  live_loop :bremen, sync: :bar do
    if tracker[5]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/bremen.wav", amp: 1,
        cutoff: line(90, 130, steps: 4).mirror.look
      sleep 8
    else
      sleep 1
    end
  end
end


with_fx :reverb, mix: 0.34 do
  live_loop :bremen2, sync: :bar do
    if tracker[6]>0 then
      samplename = ["C:/Users/Berke/Music/AbleforSonic2023/bremen.wav",
                    "C:/Users/Berke/Music/AbleforSonic2023/bremen.wav",
                    "C:/Users/Berke/Music/AbleforSonic2023/bremenMi.wav",
                    "C:/Users/Berke/Music/AbleforSonic2023/bremenMi.wav"].tick
      sample samplename, amp: 1.1
      sleep 8
    else
      sleep 1
    end
  end
end

with_fx :reverb, mix: 0.4, room: 0.4 do
  live_loop :au, sync: :bar do
    if tracker[7]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/aurealis.wav", amp: 0.9
      sleep 32
    else
      sleep 1
    end
  end
end

with_fx :eq, high: 0.5 do
  live_loop :jungle_perc, sync: :bar do
    if tracker[8]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/junglePerc.wav", amp: 0.9
      sleep 4
    else
      sleep 1
    end
  end
end

##| with_fx :reverb, mix: 0.24 do
##|   with_fx :eq, low: 0.5 do
##|     with_fx :distortion, mix: 0.19 do
##|       live_loop :french_corps, sync: :bar do
##|         if tracker[9]>0 then
##|           sample "C:/Users/Berke/Music/AbleforSonic2023/frenchCorps.wav", amp: 0.9
##|           sleep 4
##|         else
##|           sleep 1
##|         end
##|       end
##|     end
##|   end
##| end

with_fx :ixi_techno, mix: 0.4 do
  live_loop :perc, sync: :bar do
    if tracker[10]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/percussion.wav", amp: 1.1
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: 0.5 do
  live_loop :vector, sync: :bar do
    if tracker[11]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/vectory46.wav", amp: 1
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :fear_bass, sync: :bar do
  if tracker[12]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/riser.wav", amp: 0.99
    sleep 16
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.3 do
  live_loop :riser_bass, sync: :bar do
    if tracker[13]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/riser2.wav", amp: 0.9
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :riser_sol, sync: :bar do
  if tracker[14]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/riser3.wav", amp: 0.9, pan: -0.5
    sleep 16
  else
    sleep 1
  end
end

live_loop :riser_top, sync: :bar do
  if tracker[15]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/riser4.wav", amp: 1, pan: 0.5
    sleep 16
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.4 do
  with_fx :bitcrusher, mix: 0.9 do
    with_fx :eq, mid: 0.5 do
      live_loop :hypnotica, sync: :bar do
        if tracker[16]>0 then
          sample "C:/Users/Berke/Music/AbleforSonic2023/hypnotica.wav", amp: 1.1
          sleep 16
        else
          sleep 1
        end
      end
    end
  end
end

with_fx :flanger, mix: 0.9 do
  with_fx :reverb, mix: 0.3, room: 0.3 do
    live_loop :solo, sync: :bar do
      if tracker[17]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/monosawLong.wav", amp: 0.82
        sleep 64
      else
        sleep 1
      end
    end
  end
end

with_fx :flanger, mix: 0.9 do
  with_fx :reverb, mix: 0.3, room: 0.3 do
    live_loop :eslik_saw, sync: :bar do
      if tracker[18]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/eslikSaw.wav", amp: 0.79
        sleep 16
      else
        sleep 1
      end
    end
  end
end

live_loop :quardus, sync: :bar do
  if tracker[19]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/quardus2.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

live_loop :formula_rise, sync: :bar do
  if tracker[20]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/formulaRise.wav", amp: 1
    sleep 96
  else
    sleep 1
  end
end

live_loop :formula_mi, sync: :bar do
  if tracker[21]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/formulaMi.wav", amp: 1
    sleep 32
  else
    sleep 1
  end
end


with_fx :eq, low: 0.5 do
  with_fx :distortion, mix: 0.15 do
    live_loop :vector2, sync: :bar do
      if tracker[22]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/vectory31-1.wav", amp: 1.1
        sleep 16
      else
        sleep 1
      end
    end
  end
end

with_fx :distortion, mix: 0.2 do
  with_fx :eq, low: 0.5 do
    live_loop :vector3, sync: :bar do
      if tracker[23]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/vectory31-2.wav", amp: 1.1
        sleep 16
      else
        sleep 1
      end
    end
  end
end

live_loop :blade, sync: :bar do
  if tracker[24]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/blade.wav", amp: 1, cutoff: line(90, 130, steps: 6).mirror.tick
    sleep 16
  else
    sleep 1
  end
end


live_loop :down, sync: :bar do
  if tracker[25]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/downunder.wav", amp: 2
    sleep 16
  else
    sleep 1
  end
end

live_loop :layeredriser, sync: :bar do
  if tracker[26]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/layer_riser.wav", amp: 1
    sleep 64
  else
    sleep 1
  end
end

live_loop :blade_cut, sync: :bar do
  if tracker[27]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/blade_cut.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

with_fx :reverb, mix: 0.19 do
  live_loop :blade_phase, sync: :bar do
    if tracker[28]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/blade_phase.wav", amp: 1
      sleep 64
    else
      sleep 1
    end
  end
end

with_fx :distortion, mix: 0.2 do
  live_loop :gabber, sync: :bar do
    if tracker[29]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/gabber.wav", amp: 1.2
      sleep 1
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1, high: 0.5 do
  live_loop :rtmrtm, sync: :bar do
    if tracker[30]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/rtm.wav", amp: 2
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :reverb, mix: 0.1 do
  live_loop :fifth, sync: :bar do
    if tracker[31]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/blade_fifth.wav", amp: 0.7
      sleep 32
    else
      sleep 1
    end
  end
end



##|    ___          __              _      __ 
##|   |_  |___  ___/ / ___ ________(_)__  / /_
##|  / __// _ \/ _  / (_-</ __/ __/ / _ \/ __/
##| /____/_//_/\_,_/ /___/\__/_/ /_/ .__/\__/ 
##|                               /_/         


###Scripts--------------------------------------------------------------


start_loop 1
sleep 64
start_loop 2
start_loop 10 #percussion
sleep 64
start_loop 3 #kick
sleep 30
set_mixer_control! hpf_slide: 1, hpf: 95
sleep 2
set_mixer_control! hpf_slide: 0.5, hpf: 5
start_loop 4
stop_loop 10
sleep 32
stop_loop 4
sleep 32
stop_loop 3 #kick
start_loop 4
sleep 32
start_loop 5
stop_loop 4
sleep 22
set_mixer_control! hpf_slide: 4, hpf: 100
sleep 10
set_mixer_control! hpf_slide: 0.5, hpf: 0
start_loop 3
start_loop 10
sleep 32
stop_loop 5
sleep 16
stop_loop 3
stop_loop 1
start_loop 6
sleep 32
start_loop 7
stop_loop 2
stop_loop 10
sleep 32
start_loop 8
sleep 32
start_loop 3
sleep 128
stop_loop 3
stop_loop 8
sleep 32
stop_loop 6
sleep 28
set_mixer_control! hpf_slide: 2, hpf: 100
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 0
start_loop 3
start_loop 1
start_loop 8
sleep 64
start_loop 5
sleep 32
stop_loop 8
start_loop 10
sleep 92
set_mixer_control! hpf_slide: 2, hpf: 100
sleep 4
set_mixer_control! hpf_slide: 0.1, hpf: 0
stop_loop 3
stop_loop 1
stop_loop 10
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 95
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 0
stop_all #----
sleep 4
start_loop 11 #vector
sleep 64
start_loop 13 #riser
sleep 32
start_loop 12
sleep 32
start_loop 14
sleep 32
start_loop 15
sleep 32
stop_loop 11
start_loop 16 #hypnotica
start_loop 17
sleep 32
stop_loop 15
stop_loop 14
stop_loop 12
start_loop 11
sleep 32
start_loop 12
stop_loop 17
start_loop 18
sleep 32
start_loop 14
sleep 32
start_loop 15
sleep 32
stop_loop 11
stop_loop 16
sleep 16
stop_loop 18
start_loop 20
sleep 16
stop_loop 15
sleep 16
stop_loop 14
sleep 16
stop_loop 13
sleep 32
stop_loop 12
sleep 16
stop_loop 20
##############33mi--------------------------
start_loop 21
start_loop 22
sleep 32
start_loop 23
sleep 32
start_loop 24
stop_loop 22
sleep 32
start_loop 22
stop_loop 21
sleep 64
stop_loop 22
stop_loop 23
sleep 16
start_loop 25
sleep 32
start_loop 26
sleep 64
stop_all
start_loop 27
sleep 16
stop_loop 27
start_loop 28
start_loop 29
sleep 16
start_loop 30
sleep 16
start_loop 31
sleep 32
start_loop 26
sleep 64
stop_all

start_loop 27
sleep 16
stop_loop 27
start_loop 25
start_loop 24
sleep 96
stop_loop 25
sleep 32
stop_loop 24
stop_all









