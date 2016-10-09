module RoundHelper
  def total_guesses(round)
    round.guesses.pluck(:counter).inject(0) {|sum, count| sum + count}
  end
end

helpers RoundHelper

