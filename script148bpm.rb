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

live_loop :bar do
  use_bpm get(:bpm)
  sleep 1
end

live_loop :beats do
  sync :bar
  sleep 4
  cue :bass
end

basses = "C:/Users/Berke/Music/AbleforSonic3/"



###Directories--------------------------------------------------------------------------

with_fx :reverb, mix: 0.66, room: 0.42 do
  live_loop :intro1, sync: :bar do
    if tracker[1]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/exit_space.wav", amp: 1.01
      sleep 64
    else
      sleep 1
    end
  end
end

live_loop :intro2, sync: :bar do
  if tracker[2]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/empty_noise.wav", amp: line(0.24, 0.99, steps: 8).mirror.look,
      cutoff: 100
    sleep 32
  else
    sleep 1
  end
end

with_fx :krush, mix: line(0.2, 1, steps: 8).mirror.look do
  live_loop :intro3, sync: :bar do
    if tracker[3]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/smelly.wav", amp: 0.99,
        cutoff: line(70, 125, steps: 6).mirror.look
      sleep 32
    else
      sleep 1
    end
  end
end

live_loop :dBeat, sync: :bar do
  if tracker[4]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/dubstep_beat.wav", amp: 0.9
    sleep 32
  else
    sleep 1
  end
end

live_loop :kik1, sync: :bar do
  if tracker[5]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/cwayzi_kick.wav", amp: 1.15
    sleep 32
  else
    sleep 1
  end
end

with_fx :distortion, distort: 0.4 do
  with_fx :eq, low_q: 0.5 do
    live_loop :bas1, sync: :bar do
      if tracker[6]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/cwayzi_bas.wav", amp: 1.22
        sleep 64
      else
        sleep 1
      end
    end
  end
end

with_fx :reverb, mix: 0.69 do
  with_fx :ping_pong, phase: 2, feedback: 0.5 do
    with_fx :eq, high: 0.6 do
      live_loop :bridge1, sync: :bar do
        if tracker[7]>0 then
          sample "C:/Users/Berke/Music/AbleforSonic2023/bridge2.wav", amp: 1.01, finish: 0.75,
            window_size: 2, onset: pick, pan: rrand(-0.80, 0.80)
          sleep 4
        else
          sleep 1
        end
      end
    end
  end
end

live_loop :ritm, sync: :bar do
  if tracker[8]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/noisy_rythm.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

with_fx :bitcrusher do
  with_fx :eq, high: 1 do
    live_loop :bas_oktav, sync: :bar do
      if tracker[9]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/cwayzi_bas_oktav.wav", amp: 1
        sleep 16
      else
        sleep 1
      end
    end
  end
end

live_loop :kikkkk, sync: :bar do
  if tracker[10]>0 then
    sample :bd_klub, amp: 0.89
    sleep 1
  else
    sleep 1
  end
end

with_fx :eq, low: 0.5, mid: 0.5 do
  live_loop :reaktor_beat, sync: :bar do
    if tracker[11]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/reaktor_beat1.wav", amp: 1
      sleep 16
    else
      sleep 1
    end
  end
end

live_loop :eight, sync: :bar do
  if tracker[12]>0 then
    sample :bd_kick, amp: 1, rpitch: -4
    sleep [0.25, 1.25, 1.25, 5.25].tick
  else
    sleep 1
  end
end

with_fx :level, amp: 1 do
  with_fx :reverb, mix: 0.35 do
    live_loop :bass_trip, sync: :bar do
      if tracker[13]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/bas_dondurucu.wav", amp: 1
        sleep 64
      else
        sleep 1
      end
    end
  end
end

live_loop :eight_2, sync: :bar do
  if tracker[14]>0 then
    sample :bd_kick, amp: 1, rpitch: -4
    sleep [1, 1, 1, 0.25, 0.5, 0.25].tick
  else
    sleep 1
  end
end

k = (knit true, 6, false, 4)
live_loop :let_me_play, sync: :bar do
  if tracker[15]>0 then
    if k.choose
      sample "C:/Users/Berke/Music/AbleforSonic2023/let_me_play.wav", amp: 1.4
    else
      with_fx :ixi_techno, mix: 0.7 do
        sample "C:/Users/Berke/Music/AbleforSonic2023/let_me_play.wav", amp: 1.4
      end
    end
    sleep 16
  else
    sleep 1
  end
end

live_loop :stored_space_beat, sync: :bar do
  if tracker[16]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/stored_space_beat.wav", amp: line(0.94, 1.99, steps: 4).mirror.look
    sleep 16
  else
    sleep 1
  end
end

live_loop :soundes, sync: :bar do
  if tracker[17]>0 then
    samplename = [:arovane_beat_a, :arovane_beat_b, :arovane_beat_c, :arovane_beat_e].tick
    sample samplename, amp: 1, onset: pick
    sleep 8
  else
    sleep 1
  end
end




###Scripts--------------------------------------------------------------

start_loop 1 #exit space
sleep 64
start_loop 2 #empty noise
sleep 64
start_loop 3 #smelly
sleep 64
start_loop 4 #dub beat
sleep 64
stop_loop 2
start_loop 5 #cwayzi kick
sleep 60
set_mixer_control! hpf_slide: 1, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 1, hpf: 0
stop_loop 3
start_loop 6 #cwayzi bas
start_loop 10
stop_loop 4
stop_loop 5
stop_loop 1
sleep 32
start_loop 8
sleep 16
start_loop 7
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 0
stop_all
start_loop 9
sleep 16
stop_loop 9
start_loop 6
start_loop 5
start_loop 7
start_loop 10
sleep 28
set_mixer_control! hpf_slide: 1, hpf: 80
sleep 4
set_mixer_control! hpf_slide: 1, hpf: 0
stop_loop 5
stop_loop 10
start_loop 9
sleep 32
start_loop 11 #reaktor beat
sleep 32
start_loop 12 #good kick
stop_loop 6
sleep 32
start_loop 13
sleep 60
set_mixer_control! hpf_slide: 1, hpf: 85
sleep 4
set_mixer_control! hpf_slide: 0.5, hpf: 0
stop_all
start_loop 13
start_loop 14
sleep 32
start_loop 15 #let me play
sleep 32
stop_loop 14
start_loop 16 #chords
sleep 16
start_loop 14
sleep 48
stop_loop 15
stop_loop 13
sleep 16
start_loop 15



###Another Song----------------------------------------------------------------------------------------------------------------------------------------

use_debug false
##| use_sched_ahead_time 1
use_bpm 148
set(:bpm, current_bpm)
set(:stop, false)


set_mixer_control! lpf_slide: 1, lpf: 120
set_mixer_control! hpf_slide: 1, hpf: 10

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

live_loop :beats do
  sync :bar
  sleep 4
  cue :bass
end

basses = "C:/Users/Berke/Music/AbleforSonic3/"



###Directories--------------------------------------------------------------------------

live_loop :intro1, sync: :bar do
  if tracker[1]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/maybe_first.wav", amp: 1
    sleep 16
  else
    sleep 1
  end
end

with_fx :reverb, mix: line(0.2, 1, steps: 32).mirror.look do
  live_loop :pulsive, sync: :bar do
    if tracker[2]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/pulsive.wav", amp: line(0.9, 1.2, steps: 16).mirror.tick
      sleep 64
    else
      sleep 1
    end
  end
end

with_fx :ping_pong, mix: line(0.3, 0.7, steps: 64).mirror.look do
  with_fx :reverb, room: 0.5 do
    live_loop :is_this, sync: :bar do
      if tracker[3]>0 then
        sample "C:/Users/Berke/Music/AbleforSonic2023/is_this_rythm.wav", amp: 0.67, hpf: 70
        sleep 16
      else
        sleep 1
      end
    end
  end
end

with_fx :krush do
  live_loop :lsd, sync: :bar do
    if tracker[4]>0 then
      sample "C:/Users/Berke/Music/AbleforSonic2023/lsd_bass.wav", amp: line(0.1, 1.5, steps: 38).mirror.tick,
        cutoff: line(89, 125, steps: 17).mirror.tick
      sleep 64
    else
      sleep 1
    end
  end
end

live_loop :intro1_vari, sync: :bar do
  if tracker[5]>0 then
    sample "C:/Users/Berke/Music/AbleforSonic2023/maybe_first.wav", amp: rrand(1, 1.32),
      onset: rrand(0.6, 112)
    sleep 0.5
  else
    sleep 1
  end
end


###Scripts--------------------------------------------------------------

start_loop 1
sleep 64
start_loop 2
sleep 64
start_loop 3
sleep 64
start_loop 4
stop_loop 1
start_loop 5
sleep 32





















