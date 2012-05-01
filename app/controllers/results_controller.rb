class ResultsController < ApplicationController

  def displayChart
    @results = Results.all
  end
  
  def post
  end
  
   #def counting
      #@count = num1+num2+num3+num4+num5
   #end
   #def totaling
      #@total = 1*num1 + 2*num2 + 3*num3 + 4*num4 + 5*num5
   #end
   
end
