class FeeCollectionDiscount < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :finance_fee_collection
  belongs_to :batch
  belongs_to :category
  has_and_belongs_to_many :students

  def student_fee_collection_discount
    students = []
    @batch = batch
    if type == 'Student'
      students << @batch.students.find_by_admission_no(admission_no)
    elsif type == 'Student Category'
      students = @batch.students.where(category_id: category.id)
    else
      students = @batch.students
    end
    if students.present?
      students.each do |s|
        student_discount = FeeCollectionDiscountsStudent.new
        student_discount.student_id = s.id
        student_discount.fee_collection_discount_id = id
        student_discount.save
      end
    end
  end

  def collection_discount(total)
    discount = (total * self.discount) / 100
  end

  def student_name
    if type == 'Student'
      student = Student.find_by_admission_no(admission_no)
    end
    name = student.first_name + ' ' + student.last_name
  end
end
