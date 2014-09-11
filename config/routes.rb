Rails.application.routes.draw do

get 'setting/course_batch'
get 'general_settings/all'
get 'general_settings/none'
get 'courses/:id/grouped_batches',to: 'courses#grouped_batches',as: 'courses_grouped_batches'
post 'courses/create_batch_group'
get 'courses/:id/assign_all',to: 'courses#assign_all',as: 'courses_assign_all'
get 'courses/:id/remove_all',to: 'courses#remove_all',as: 'courses_remove_all'
get 'batches/:id/display', to: 'batches#display', as: 'batches_display'
get 'batches/select' 
get 'grading_levels/select'
get 'batch_transfers/select'
get 'batch_transfers/assign_all'
get 'batch_transfers/remove_all'
get 'batch_transfers/student_transfer'
get 'batch_transfers/:batch_id/graduation',to: 'batch_transfers#graduation', as: 'batch_transfers_graduation'
get 'batch_transfers/:batch_id/transfer',to: 'batch_transfers#transfer', as: 'batch_transfers_transfer'
get 'subjects/select'
get 'batches/:batch_id/subjects/subject',to: 'subjects#subject', as: 'batches_subjects_subject'
get 'elective_groups/:elective_group_id/elective_subject',to: 'elective_groups#elective_subject', as: 'elective_groups_elective_subject'
get 'students/search' 
get 'students/search_ajax'
get 'students/view_all'
get 'students/select'  
get 'students/profile'
get 'students/archived_profile'  
get 'students/advanced_search'
get 'students/advanced_student_search'
get 'students/:subject_id/elective',to: 'students#elective',as: 'students_elective'
get 'home/dashboard'
get 'students/admission1'
get 'students/admission2'
post 'students/adm_create'
post 'students/archived_student_create'
get 'students/admission2_1'
get 'newscasts/select'
get 'newscasts/display'
get 'students/admission3'
patch 'students/update_immediate_contact'
get 'students/previous_data'
post 'students/previous_data_create'
get 'students/previous_subject'
post 'students/previous_subject_create'
get 'students/:id/profile_pdf',to: 'students#profile_pdf',as: 'students_profile_pdf'
get 'students/report'
get 'students/archived_report'
get 'students/email'
get 'students/change_to_former'
get 'students/delete'
get 'students/remove'
get 'students/dispguardian'
get 'students/archived_student_guardian'
get 'students/addguardian'
post 'students/assign_elective'
get 'students/:subject_id/assign_all',to: 'students#assign_all',as: 'students_assign_all'
get 'students/:subject_id/remove_all',to: 'students#remove_all',as: 'students_remove_all'
post 'guardians/addguardian_create',to: 'guardians#addguardian_create',as: 'guardians_addguardian_create'
get 'users/search'
get 'users/select'
get 'users/view_all'
get 'users/view_all_details'
patch 'users/:id/update_password',to:'users#update_password',as:'users_update_password'
get 'users/:id/change_password',to: 'users#change_password',as: 'users_change_password'
get 'class_timings/select'
get 'events/show'
get 'weekdays/select'
get 'weekdays/index'
post'weekdays/create'
get 'time_tables/select'
get 'time_tables/sub'
get 'time_tables/new'
get 'time_tables/timetable'
get 'time_table_entries/select'
get 'exam_reports/report_center'
get 'exam_reports/exam_wise_report'
get 'exam_reports/subject_wise_report'
get 'exam_reports/generate_exam_report'
get 'exam_reports/select_batch'
get 'exam_reports/choose_batch'
get 'exam_reports/generate_subject_report'
get 'exam_reports/grouped_exam_report'
get 'exam_reports/generate_grouped_report'
get 'exam_reports/:exam_group_id/student_exam_report/:student_id',
                    to: 'exam_reports#student_exam_report',as: 'exam_reports_student_exam_report'
get 'exam_reports/:batch_id/student_report/:student_id',
                    to: 'exam_reports#student_report',as: 'exam_reports_student_report'
get 'exam_reports/:exam_group_id/consolidated_report',to: 'exam_reports#consolidated_report',as: 'exam_reports_consolidated_report'
get 'exam_reports/:batch_id/consolidated_archived_report',
                    to: 'exam_reports#consolidated_archived_report',as: 'exam_reports_consolidated_archived_report'
get 'exam_reports/archived_student_report'
get 'exam_reports/select_course'
get 'exam_reports/generate_archived_report'
get 'exam_reports/exam_group_wise_report'
get 'exam_reports/student_ranking_per_subject'
get 'exam_reports/rank_report_batch'
get 'exam_reports/generate_ranking_report'
get 'exam_reports/student_ranking_per_batch'
get 'exam_reports/generate_student_ranking_report'
get 'exam_reports/student_ranking_per_course'
get 'exam_reports/generate_student_ranking_report2'
get 'exam_reports/student_ranking_per_school'
get 'exam_reports/student_ranking_per_attendance'
get 'exam_reports/generate_student_ranking_report3'
get 'exam_reports/view_transcripts'
get 'exam_reports/generate_view_transcripts'
get 'exam_reports/:student_id/archived_student/',to: 'exam_reports#archived_student',as: 'exam_reports_archived_student'
get 'exam_reports/:student_id/student_view_transcripts/',to: 'exam_reports#student_view_transcripts',as: 'exam_reports_student_view_transcripts'
get 'exam_reports/ranking_level_report'
get 'exam_reports/select_mode'
get 'exam_reports/generate_ranking_level_report'
get 'calender/next'
get 'calender/demo' 
get 'calender/holiday_event_view'
get 'exam_setting/:course_id/setting',to: 'exam_setting#setting', as: 'course_class_designations'
get 'exam_setting/select'
get 'exam_setting/selectrank'
get 'exam_setting/:course_id/settingrank',to: 'exam_setting#settingrank',as: 'course_ranking_levels'
get 'exam_setting/newrank'
post 'exam_setting/createrank'
get 'exam_setting/:course_id/editRank/:id',to:'exam_setting#editRank',as:'course_ranking_level'
patch 'exam_setting/updateRank'
delete 'exam_setting/:id/destroyRank', to:'exam_setting#destroyRank', as:'exam_setting_destroyRank'
get 'exam_groups/select'
post 'exam_groups/:id/exam_group_create',to: 'exam_groups#exam_group_create',as: 'exam_groups_exam_group_create'
get 'exam_groups/:id/exam_show', to:'exam_groups#exam_show', as:'exam_groups_exam_show'
get 'online_exams/assign_all'
get 'online_exams/remove_all'
get 'online_exams/queAns'
post 'online_exams/createQue'
get 'employees/new_category'
post 'employees/add_category'
get 'employees/:category_id/edit_category', to:'employees#edit_category', as:'employees_edit_category'
patch 'employees/:category_id/update_category', to:'employees#update_category', as:'employees_update_category'
delete 'employees/:id/destroy_category', to:'employees#destroy_category', as:'employees_destroy_category'
get 'employees/new_department'
post 'employees/add_department'
get 'employees/:department_id/edit_department', to:'employees#edit_department', as:'employees_edit_department'
patch 'employees/:department_id/update_department', to:'employees#update_department', as:'employees_update_department'
get 'employees/new_position'
post 'employees/add_position'
get 'employees/:position_id/edit_position', to:'employees#edit_position', as:'employees_edit_position'
patch 'employees/:position_id/update_position', to:'employees#update_position', as:'employees_update_position'

root 'home#dashboard'
 
 resources :home
 resources :setting
 resources :categories
 resources :general_settings
  
 resources :courses do
    resources :batches
  end

  resources :grading_levels
  resources :batches do
  resources :grading_levels
end  

resources :batch_transfers
  
  resources :subjects 
   resources :batches do
    resources :subjects
    resources :elective_groups do
     resources :subjects 
    end  
  end 
 
 resources :students do
    resources :guardians
end

resources :newscasts do
resources :comments
end
resources :users

resources :time_tables
resources :class_timings
  resources :batches do
  resources :class_timings
end  
resources :events
resources :calender
resources :weekdays
resources :time_tables

resources :time_table_entries

  resources :batches do
  resources :time_table_entries
end  

resources :exam_setting
resources :exam_groups do
  resources :exams 
end
resources :exams do
    resources :exam_scores
end

resources :online_exam_groups
resources :exam_reports

resources :courses do
  resources :exam_setting
end  
resources :online_exams
resources :employees
end
