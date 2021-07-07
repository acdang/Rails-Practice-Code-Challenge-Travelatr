class PostsController < ApplicationController
    before_action :find_post, only: [:show, :create, :edit, :update, :add_like]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
    end

    def update
        @post = Post.update(post_params)

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    def add_like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :blogger_id, :destination_id, :content)
    end
end