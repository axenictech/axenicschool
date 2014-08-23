class AddCountries < ActiveRecord::Migration
  
    def change
      create_default
    end

     def create_default
        clist=["India","America","Japan","Rasia","Sri-lanka","Australia"]
        clist.each do|c|
          @c1=Country.new
          @c1.name=c
          @c1.save
        end
     end
end
