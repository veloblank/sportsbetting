print "Input Current Bankroll: "
bankroll = gets.chomp.to_i
puts "1u bet size = #{bankroll *0.010}"
puts "2u bet size = #{bankroll *0.020}"
puts "3u bet size = #{bankroll *0.030}"
puts "4u bet size = #{bankroll *0.040}"
puts "5u bet size = #{bankroll *0.050}"
print "******************************\n******************************\n"

print "What is your Kelly Fraction (%): "
kelly_fraction = gets.chomp.to_f / 100

print "What are the odds of Side 1 win outcome (decimal): "
odds_side1_win = gets.chomp.to_f
print "What are the odds of Side 2 win outcome (decimal): "
odds_side2_win = gets.chomp.to_f
puts "\n \n"
print "What is the handicapped probability of Side 1 win outcome (%): "
prob_side1_win = gets.chomp.to_f / 100
print "What is the handicapped probability of Side 2 win outcome (%): "
prob_side2_win = gets.chomp.to_f / 100
puts "\n \n"

percent_br_bet_prop_one = ((((odds_side1_win * prob_side1_win)-1))/(odds_side1_win-1))
percent_br_bet_prop_two = ((((odds_side2_win * prob_side2_win)-1))/(odds_side2_win-1))

sized_bet_prop_one = ((((odds_side1_win * prob_side1_win)-1))/(odds_side1_win-1)) * (bankroll) * kelly_fraction
sized_bet_prop_two = ((((odds_side2_win * prob_side2_win)-1))/(odds_side2_win-1)) * (bankroll) * kelly_fraction

full_kelly_prop_one = ((((odds_side1_win * prob_side1_win)-1))/(odds_side1_win-1)) * (bankroll)
full_kelly_prop_two = ((((odds_side2_win * prob_side2_win)-1))/(odds_side2_win-1)) * (bankroll)

if sized_bet_prop_one < 0 && sized_bet_prop_two < 0
  puts "You should not make a bet on this game."
elsif sized_bet_prop_one > sized_bet_prop_two
  puts "You should bet: $"+"#{sized_bet_prop_one.round(2)} at #{kelly_fraction*100}% Kelly on Side 1"
elsif
  puts "You should bet $"+"#{sized_bet_prop_two.round(2)} at #{kelly_fraction*100}% Kelly on Side 2"
end

puts "*****************Kelly Table*****************"
puts "*                                           *"
puts "*     At:   15%    30%    60%    75%    Full    *"
puts "*                                           *"
puts "* Side 1:  #{full_kelly_prop_one.round(2) * 0.15}   #{full_kelly_prop_one.round(2) * 0.30}   *"
puts "*                                           *"
puts "* Side 2:  #{full_kelly_prop_two.round(2) * 0.15}   #{full_kelly_prop_two.round(2) * 0.30}   *"
