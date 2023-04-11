use_bpm 148

live_loop :m do
  sleep 1
end

set_mixer_control! lpf_slide: 1, lpf: 120
set_mixer_control! hpf_slide: 1, hpf: 10

songs = "C:/Users/Berke/Music/AbleforSonic3/"

s1 = 0
s2 = 0
kick = 0
beat = 0
my_chord = 0

kick2 = 0
basses = 0

bass_bridge = 0

hard_beat = 0
hf = 0

ride = 0
hh = 0

leady = 0

live_loop :s1, sync: :m do
  if s1 == 1 then
    sample songs, "2nd1.wav", cutoff: 120
    sleep 32
  else
    sleep 1
  end
end

live_loop :s2, sync: :m do
  if s2 == 1 then
    sample songs, "2nd2.wav", hpf: 30
    sleep 32
  else
    sleep 1
  end
end


live_loop :kick, sync: :m do
  if kick == 1 then
    sample songs, "kick_sine.wav", hpf: 10
    sleep 1
  else
    sleep 1
  end
end

live_loop :beat, sync: :m do
  if beat == 1 then
    sample songs, "2nd_beat.wav"
    sleep 32
  else
    sleep 1
  end
end

live_loop :chord, sync: :m do
  if my_chord == 1 then
    sample songs, "2nd_chord.wav", cutoff: line(95, 125, steps: 8).mirror.tick, pitch: -12.5
    sleep 32
  else
    sleep 1
  end
end

live_loop :kick2, sync: :m do
  if kick2 == 1 then
    sample songs, "nice_kick.wav"
    sleep 1
  else
    sleep 1
  end
end

live_loop :basses, sync: :m do
  if basses == 1 then
    samplename = ["bass4_n", "bass4_n", "bass_f", "bass_f", "bass_a", "bass_a"].tick
    sample songs, samplename, amp: 1.2
    sleep 16
  else
    sleep 1
  end
end

live_loop :bass_brigde, sync: :m do
  if bass_bridge == 1 then
    sample songs, "bass_bridge.wav"
    sleep 32
  else
    sleep 1
  end
end

with_fx :ping_pong do
  live_loop :hard_beat, sync: :m do
    if hard_beat == 1 then
      sample songs, "hard_beat.wav", cutoff: line(80, 120, steps: 6).mirror.tick, onset: pick
      sleep 0.25
    else
      sleep 1
    end
  end
end

with_fx :reverb, mix: 0.35 do
  live_loop :hf, sync: :m do
    if hf == 1 then
      sample songs, "hard_eslik.wav"
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :ride11, sync: :m do
    if ride == 1 then
      sample songs, "ride.wav", amp: 0.7
      sleep 4
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :hh, sync: :m do
    if hh == 1 then
      sample songs, "hh_falan.wav", amp: 0.8, cutoff: 112
      sleep 16
    else
      sleep 1
    end
  end
end

with_fx :eq, low: -1 do
  live_loop :leaddyy, sync: :m do
    if leady == 1 then
      sample "C:/Users/Berke/Music/AbleforSonic3/leady.wav", amp: 1,
        cutoff: line(90, 125, steps: 8).mirror.tick
      sleep 16
    else
      sleep 1
    end
  end
end

