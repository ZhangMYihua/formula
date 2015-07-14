class AddStudentIdandTeacherIdtoReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :student_id, :integer
    add_column :reviews, :teacher_id, :integer
  end
end
