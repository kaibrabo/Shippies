class SessionsController < ApplicationController

    def new
        #
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            create_session(user)
            flash[:notice] = "Welcome, #{user.name}!"
            redirect_to root_path
        else
            flash.now[:alert] = 'Invalid email/password combination'
            render :new
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        destroy_session(user)
        flash[:notice] = "You've been signed out, come back soon!"
        redirect_to root_path
    end

end


# def destroy
#     @topic = Topic.find(params[:id])
#
#     if @topic.destroy
#         flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
#         redirect_to action: :index
#     else
#         flash.now[:alert] = "There was an error deleting the topic."
#         render :show
#     end
# end
