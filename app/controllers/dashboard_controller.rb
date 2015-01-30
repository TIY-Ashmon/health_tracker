class DashboardController < ApplicationController
  def status
    @total_exercises= Exercise.sum(:duration)
    @total_weight_lost= Weight.sum(:user_weight)
    @total_steps= Step.sum(:steps_taken)
    @total_calories_consumed= Joule.sum(:consumed_joules)

    graph=[@total_exercises, @total_weight_lost, @total_steps, @total_calories_consumed]
    @total=graph.reduce(:+)

    if @total_weight_lost> 0
      @latest_weight= Weight.last.user_weight
    end



    @net_calories = Joule.sum(:consumed_joules)

    @exercises_percent=(@total_exercises/@total) * 100
    @weight_lost_percent=(@total_weight_lost/@total) * 100
    @steps_percent=(@total_steps/@total) * 100
    @calories_percent=(@total_calories_consumed/@total) * 100

  end

end
