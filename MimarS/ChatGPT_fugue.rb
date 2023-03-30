# Set the tempo and key
use_bpm 100
set :key, :c

# Define the subject of the fugue
subject = (ring :c5, :d5, :e5, :f5, :g5, :a5, :g5, :f5, :e5, :d5, :c5)

# Define the countersubject
countersubject = (ring :g4, :f4, :e4, :d4, :c4, :b3, :c4, :d4, :e4, :f4, :g4)

# Define the fugue voices
voice1 = (ring :c4, :g4, :c5, :e5, :d5, :e5, :f5, :g5, :a5, :g5, :f5, :e5, :d5, :c5, :g4)
voice2 = (ring :g3, :e4, :g4, :b4, :a4, :b4, :c5, :d5, :e5, :d5, :c5, :b4, :a4, :g4, :e4)
voice3 = (ring :c3, :g3, :c4, :e4, :d4, :e4, :f4, :g4, :a4, :g4, :f4, :e4, :d4, :c4, :g3)

# Define a function to play a single voice
define :play_voice do |notes, delay|
  notes.each do |note|
    with_fx :reverb, room: 0.8 do
      synth :piano, note: note, attack: 0.01, release: 0.5, amp: 0.4, pan: rrand(-0.8, 0.8)
      sleep delay
    end
  end
end

# Play the fugue
live_loop :fugue do
  # Play the subject
  play_voice(subject, 0.25)
  
  # Play the countersubject
  play_voice(countersubject, 0.25)
  
  # Play the fugue voices
  play_voice(voice1, 0.5)
  play_voice(voice2, 0.5)
  play_voice(voice3, 0.5)
end
