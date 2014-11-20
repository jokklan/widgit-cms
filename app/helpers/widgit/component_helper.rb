module Widgit
  module ComponentHelper
    def overlay_columns(component) 
      $i   = 0
      $num = component.columns

      while $i < $num  do
         puts("Inside the loop i = #$i" )
         $i +=1
      end      
    end
  end
end
