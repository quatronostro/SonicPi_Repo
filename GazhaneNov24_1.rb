use_midi_defaults port: "loopmidi_port_2"

use_debug false
use_bpm 96

live_loop :click do
  sleep 1
end



live_loop :odd_bassline, sync: :click do
  stop
  use_real_time
  16.times do
    midi (octs (knit :e1, 8, :fs1, 4, :a1, 4).tick, 3).choose, channel: 1
    sleep 0.5
  end
  
end

live_loop :long_midi_note, sync: :click do
  stop
  use_real_time
  
  note = :e3
  channel = 2
  
  midi note, channel: channel, sustain: 16
  sleep 16
  
end

live_loop :to_Ableton, sync: :click do
  stop
  use_real_time
  
  notes = (ring :c2, :g2, :e2, :b2, :fs2, :g1, :a2, :d2, :eb2, :bb1, :f2)
  
  midi_note_on notes.tick, velocity: rrand_i(40, 127), sustain: 0.1, channel: 3
  sleep [0.25, 0.5, 0.75].choose
  midi_note_off notes.look, channel: 3
end

live_loop :rythm_2, sync: :click do
  stop
  with_fx :distortion, mix: 0.4 do
    with_fx :reverb, mix: 0.7 do
      
      sample :tabla_ghe2, sustain: 1, release: 1, amp: 1.2, rpitch: -10
      s = [1.75, 1.75, 1.75, 1.75, 0.5, 0.5, 0.5]
      sleep s.tick
    end
  end
end

perc = "C:/Users/Berke/Music/kasım24/perc"

with_fx :distortion, mix: 0.4 do
  with_fx :reverb, room: 0.8 do
    live_loop :perc, sync: :click do
      stop
      samplename = ["RAW_DDT_PRC_01", "RAW_DDT_PRC_02", "RAW_DDT_PRC_03", "RAW_DDT_PRC_05"].choose
      
      sample perc, samplename, cutoff: line(130, 80, steps: 16).mirror.tick, amp: rrand(1, 1.3)
      s = [1.75, 1.75, 1.75, 1.75, 0.5, 0.5, 0.5]
      sleep s.tick
    end
  end
end


with_fx :distortion, distort: 0.3 do
  live_loop :kick_glitch, sync: :click do
    stop
    sample "C:/Users/Berke/Music/kasım24/SSDL_BD_04.wav", amp: 1.7
    sample :bd_klub, amp: 2.1, rpitch: 8, finish: 0.1
    sleep [0.25, 0.5].choose
    ##| s = [0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25]
    ##| sleep s.tick
  end
end

live_loop :hi_hat_random, sync: :click do
  stop
  sleep [0.125, 0.25].choose
  sample :drum_cymbal_closed, rate: 2, amp: 1 if one_in(2)
end

live_loop :acid_lead, sync: :click do
  stop
  use_synth :bnoise
  with_fx :bitcrusher, phase: 0.5, mix: 0.7 do
    play (scale :e2, :dorian).choose, release: 0.1, cutoff: 130, res: 0.9, amp: 0.8
    sleep [0.125, 0.25].choose
  end
end

with_fx :distortion, mix: 0.5 do
  live_loop :percs, sync: :click do
    stop
    sample "C:/Users/Berke/Music/kasım24/percs2.wav", amp: 1.3
    sleep 32
  end
end

live_loop :busy, sync: :click do
  ##| stop
  bass_root = :e2
  bass_notes = [bass_root, :ds2, bass_root, bass_root, :ds2, :d2, bass_root]
  
  bass_durations = [0.75, 1.25, 0.5, 1.0, 0.75, 2.0, 0.25]
  
  bass_notes.zip(bass_durations).each do |note, duration|
    midi note,
      amp: rrand(1.2, 1.6),
      channel: 4
    
    sleep bass_durations.tick
  end
end

with_fx :hpf, cutoff: 60 do
  with_fx :distortion, mix: 0.5 do
    with_fx :reverb, room: 0.7, mix: 0.7 do
      live_loop :kick_beat, sync: :click do
        stop
        sample :arovane_beat_a, amp: 1, finish: 0.01
        sleep (ring, 0.5, 1.5).tick
      end
    end
  end
end

with_fx :reverb, mix: 0.3 do
  live_loop :mel2, sync: :click do
    stop
    use_synth :beep
    c = range(70,130,steps: 2.5).shuffle.tick(:range)
    p = knit(0,7, 3,2).tick
    riff2 = rrand_i(1,2)
    case riff2
    when 1
      play :e1, release: 0.15, pan: rrand(-1,1), cutoff: c, pitch: p, amp: 1.5
      #     sleep 0.125
    when 2
      play :ds2, release: 0.15, pan: rrand(-1,1), cutoff: c, pitch: p, amp: 1.5
    when 3
      ##| use_synth :tri
      ##| play :c5, release: 0.04, pan: rrand(-1,1), pitch: ring(0,5,12,-5).choose#, cutoff: c
    when 4
      sleep 0.125
      sleep 0.125
      
    end
    sleep 0.125
  end
end

live_loop :rythn_3, sync: :click do
  ##| stop
  use_real_time
  
  notes = (ring :c2, :g2, :e2, :b2, :fs2, :g1, :a2, :d2, :eb2, :bb1, :f2)
  
  midi_note_on 50, sustain: 8, channel: 5
  sleep 4
  midi_note_off notes.look, channel: 5
end




