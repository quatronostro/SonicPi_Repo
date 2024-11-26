use_debug false
use_midi_defaults port: "loopmidi_port_2"
##| use_sched_ahead_time 1
use_bpm 159




live_loop :bar do
  sleep 1
end

live_loop :kick2, sync: :bar do
  use_real_time
  midi :e2, channel: 1
  sleep 1
end


live_loop :per1, sync: :bar do
  use_real_time
  midi :e2, sustain: 8, channel: 2
  sleep 8
end

live_loop :long_midi_note, sync: :bar do
  use_real_time
  
  note = :e2
  channel = 3
  
  midi note, channel: channel, sustain: 16
  sleep 16
end

live_loop :hibidi, sync: :bar do
  use_real_time
  midi :e3, sustain: 16, channel: 4
  sleep 16
end

live_loop :chordz, sync: :bar do
  use_real_time
  sleep 0.5
  notes = [:b4, :d4, :fs4]
  midi notes.tick, sustain: 2, channel: 5
  sleep [4, 2, 2, 3.5, 1.5, 1.5].tick
end


live_loop :db, sync: :bar do
  use_real_time
  midi :a4, sustain: 8, channel: 6
  sleep 8
  midi :g4, sustain: 8, channel: 6
  sleep 8
end









