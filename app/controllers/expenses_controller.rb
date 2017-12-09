class ExpensesController < ApplicationController
  def index
     @expenses = Expense.order("date DESC")    

    
     
     unless params[:concept] && params[:concept].nil?     	
     	@expenses=@expenses.where("concept like :query",query: "%#{params[:concept]}%")
     end 

      puts '*'*50
     puts params 
    
     if params[:category_id] !="" && params[:category_id] !=nil  
     puts  	"entro aqui #{params[:category_id].nil?}"
      @expenses= @expenses.where(category_id: params[:category_id])     
     end   

  end
end