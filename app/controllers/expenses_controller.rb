class ExpensesController < ApplicationController
  def index
    @expenses = if params[:concept] && params[:category_id]
      Expense.where('concept LIKE ?',"%#{params[:concept]}%").where('category_id LIKE ?',"%#{params[:category_id]}%")
    else
        @expenses = Expense.order("date DESC")
    end
  end
end
