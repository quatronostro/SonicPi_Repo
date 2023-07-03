##| -STRANGER THINGS muzigi
##| -ilk bpm ve metronom
use_bpm 80

live_loop :metro do
  sleep 1
end
##| -ilk melodi
with_fx :reverb, room: 0.5 do
  live_loop :melodi1, sync: :metro do
    stop
    use_synth :prophet
    play [:c3, :e3, :g3, :b3, :c4, :b3, :g3, :e3].tick,
      cutoff: line(50, 110, steps: 32).mirror.look
    sleep 0.25
  end
end
##| ilk melodi double
with_fx :reverb, room: 0.5 do
  live_loop :melodi2, sync: :metro do
    ##| stop
    use_synth :saw
    play [:c2, :e2, :g2, :b2, :c3, :b2, :g2, :e2].tick,
      cutoff: line(50, 110, steps: 32).mirror.look
    sleep 0.25
  end
end
##| -kick
live_loop :kick, sync: :metro do
  stop
  sample :bd_kick
  sleep [0.75, 0.25].tick
end
##| -beats
live_loop :beat1, sync: :metro do
  stop
  sample :loop_amen, onset: pick
  sleep 0.5
end

with_fx :distortion, distort: 0.2 do
  live_loop :beat2, sync: :metro do
    stop
    sample :loop_amen, rate: 1.19
    sleep 1
  end
end

##| -pad
live_loop :thirdhitpad, sync: :metro do
  ##| stop
  with_fx :lpf, cutoff: 75 do
    use_synth :dsaw
    use_synth_defaults detune: 0.05, attack: 0.5, sustain: 4, release: 4
    play_chord [:c3, :g3, :b3, :g4]
    sleep 8
    play_chord [:b2, :e3, :g3, :g4]
  end
end
##| -arpej
live_loop :arpej, sync: :metro do
  ##| stop
  c = line(40, 80, steps: 124).mirror.look
  r = line(0.2, 0.5, steps: 100).mirror.look
  f = line(0.3, 0.8, steps: 50).mirror.look
  use_synth :prophet
  notes = (ring :e3, :g3, :b3, :c4, :b3, :g3,
           :e3, :g3, :b3, :c4, :b3, :g3,
           :e3, :g3, :b3, :c4)
  
  play notes.tick, attack: 0, release: r, cutoff: c, amp: 0.8
  sleep 0.125
end
##| -bass
with_fx :reverb, mix: 0.4 do
  live_loop :bass, sync: :metro do
    ##| stop
    with_fx :distortion, distort: 0.85, amp: 1.1 do
      with_fx :lpf, cutoff: 80 do
        use_synth :piano
        play :c2, sustain: 7, release: 1
        sleep 7
        play :d2, sustain: 1, release: 1
        sleep 1
        play :e2, sustain: 7, release: 1
        sleep 7
        play :d2, sustain: 1, release: 1
        sleep 1
        play :c2, sustain: 6, release: 1
        sleep 6
        play :d2, sustain: 0.75
        sleep 0.75
        play :c2, sustain: 0.75
        sleep 0.75
        play :b1, sustain: 0.5
        sleep 0.5
        play :e2, sustain: 7, release: 1
        sleep 8
      end
    end
  end
end
