class ExpensesController < ApplicationController
  def index
    # puts "HOLAAAA: #{current_user.id}"
    user_session = current_user.id
    @expenses = if params[:concept] && params[:category_id]
      Expense.where('concept LIKE ?',"%#{params[:concept]}%").
      where('category_id LIKE ?',"%#{params[:category_id]}%")
    else
        @expense = Expense.where(user_id: user_session).order('date DESC')
        # @expenses = Expense.order("date DESC")
        #Expense.find(3).update('user_id': us1)
    end
  end
end
