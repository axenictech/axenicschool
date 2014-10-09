class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps
    end
    create_default
  end

  def create_default
    language_list =['English','Spanish','Marathi','hindi','Arebian']

    language_list.each do |l|
      Language.create(name:l)
    end
  end
end
