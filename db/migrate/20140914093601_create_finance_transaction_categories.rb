class CreateFinanceTransactionCategories < ActiveRecord::Migration
  def change
    create_table :finance_transaction_categories do |t|
      t.string  :name
      t.string  :description
      t.boolean :is_income
      t.boolean :is_deleted, :default => false
 
      t.timestamps
    end
    create_default
  end
  def create_default
    FinanceTransactionCategory.create(name:"Donation",description:"Donated money for instituation",is_income:true)
    FinanceTransactionCategory.create(name:"Fees",description:"Fees for instituation",is_income:true)
	FinanceTransactionCategory.create(name:"Salary",description:"Salary for employees",is_income:false)
  end
end
