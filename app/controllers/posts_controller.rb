class PostsController < ApplicationController

    def new
        @post = Post.new
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def search
    end

    def create
        @post = Post.new(post_params)
        if @post.save && post_params_image[:image_name]
            @post.image_name = "#{@post.id}.jpg"
            @post.save
            image = post_params_image[:image_name]
            File.binwrite("public/post_images/#{@post.image_name}", image.read)
            redirect_to "/posts/new"
        elsif @post.save
            redirect_to "/posts/new"
        else
            render "posts/new"
        end
    end
  
    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to "/posts/new"
    end


    private
        def post_params
            params.require(:post).permit(:content).merge(user_id: current_user.id)
        end

        def post_params_image
            params.require(:post).permit(:image_name)
        end
end
